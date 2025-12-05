
require("scripts/autotracking/item_mapping")
require("scripts/autotracking/location_mapping")

CUR_INDEX = -1
SLOT_DATA = {}

function has_value (t, val)
    for i, v in ipairs(t) do
        if v == val then return 1 end
    end
    return 0
end

function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ','
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
end

function onClear(slot_data)
    CUR_INDEX = -1
    -- reset locations
    for _, location_array in pairs(LOCATION_MAPPING) do
        for _, location in pairs(location_array) do
            if location then
                local location_obj = Tracker:FindObjectForCode(location)
                if location_obj then
                    if location:sub(1, 1) == "@" then
                        location_obj.AvailableChestCount = location_obj.ChestCount
                    else
                        location_obj.Active = false
                    end
                end
            end
        end
    end

    -- reset items
    for _, item_pair in pairs(ITEM_MAPPING) do
        local item_code = item_pair[1]
        local item_type = item_pair[2]
        local item_obj = Tracker:FindObjectForCode(item_code)
        if item_obj then
            if item_obj.Type == "toggle" then
                item_obj.Active = false
            elseif item_obj.Type == "progressive" then
                item_obj.CurrentStage = 0
                item_obj.Active = false
            elseif item_obj.Type == "consumable" then
                if item_obj.MinCount then
                    item_obj.AcquiredCount = item_obj.MinCount
                else
                    item_obj.AcquiredCount = 0
                end
            elseif item_obj.Type == "progressive_toggle" then
                item_obj.CurrentStage = 0
                item_obj.Active = false
            end
        end
    end

    local advanced_logic = Tracker:FindObjectForCode("advanced_logic")
    if slot_data['LogicDifficulty'] and slot_data['LogicDifficulty'] == 1 then
        advanced_logic.Active = true
        standard_logic.Active = false
    else
        advanced_logic.Active = false
        standard_logic.Active = true
    end

    PLAYER_ID = Archipelago.PlayerNumber or -1
    TEAM_NUMBER = Archipelago.TeamNumber or 0
    SLOT_DATA = slot_data

    -- if Archipelago.PlayerNumber > -1 then

    --     HINTS_ID = "_read_hints_"..TEAM_NUMBER.."_"..PLAYER_ID
    --     Archipelago:SetNotify({HINTS_ID})
    --     Archipelago:Get({HINTS_ID})
    -- end
end


function onItem(index, item_id, item_name, player_number)
    if index <= CUR_INDEX then
        return
    end
    CUR_INDEX = index

    local is_local = player_number == Archipelago.PlayerNumber
    local item = ITEM_MAPPING[item_id]

    if not item or not item[1] then
        print(string.format("onItem: could not find item mapping for id %s", item_id))
        return
    end

    local item_code = item[1]
    local item_type = item[2]
    local amount = tonumber(item[3]) or 1

    local item_obj = Tracker:FindObjectForCode(item_code)
    if not item_obj then
        print(string.format("onItem: could not find object for code %s", item_code))
        return
    end

    if item_obj.Type == "toggle" then
        item_obj.Active = true

    elseif item_obj.Type == "progressive" then
        item_obj.Active = true
        item_obj.CurrentStage = item_obj.CurrentStage + 1

    elseif item_obj.Type == "consumable" then
        local inc = item_obj.Increment or 1
        item_obj.AcquiredCount = item_obj.AcquiredCount + inc * amount

    elseif item_obj.Type == "progressive_toggle" then
        if item_obj.Active then
            item_obj.CurrentStage = item_obj.CurrentStage + 1
        else
            item_obj.Active = true
        end
    end
end

--called when a location gets cleared
function onLocation(location_id, location_name)
    local location_array = LOCATION_MAPPING[location_id]
    local location = location_array[1]
    local counter = location_array[2]

    local location_obj = Tracker:FindObjectForCode(location)
    if location_obj then
        if location:sub(1, 1) == "@" then
            location_obj.AvailableChestCount = location_obj.AvailableChestCount - 1
        else
            location_obj.Active = true
        end

        if counter then
            local item_obj = Tracker:FindObjectForCode(counter)
            item_obj.AcquiredCount = item_obj.AcquiredCount + item_obj.Increment
        end
    else
        print(string.format("onLocation: could not find location_object for code %s", location))
    end
end

function onEvent(key, value, old_value)
    updateEvents(value)
end

function onEventsLaunch(key, value)
    updateEvents(value)
end

Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
