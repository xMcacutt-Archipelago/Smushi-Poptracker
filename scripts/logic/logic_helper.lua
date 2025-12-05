
function A(result)
    if result then
        return AccessibilityLevel.Normal
    else
        return AccessibilityLevel.None
    end
end

function all(...)
    local args = { ... }
    local min = AccessibilityLevel.Normal
    for i, v in ipairs(args) do
        if type(v) == "boolean" then
            v = A(v)
        end
        if v < min then
            if v == AccessibilityLevel.None then
                return AccessibilityLevel.None
            else
                min = v
            end
        end
    end
    return min
end

function any(...)
    local args = { ... }
    local max = AccessibilityLevel.None
    for i, v in ipairs(args) do
        if type(v) == "boolean" then
            v = A(v)
        end
        if tonumber(v) > tonumber(max) then
            if tonumber(v) == AccessibilityLevel.Normal then
                return AccessibilityLevel.Normal
            else
                max = tonumber(v)
            end
        end
    end
    return max
end

function has(item, amount, amountInLogic)
-- function has(item, noKDS_amount, noKDS_amountInLogic, KDS_amount, KDS_amountInLogic)
    local count = Tracker:ProviderCountForCode(item)

    -- print(item, count, amount, amountInLogic)
    count = Tracker:ProviderCountForCode(item)
    if amountInLogic then
        if count >= amountInLogic then
            return AccessibilityLevel.Normal
        elseif count >= amount then
            return AccessibilityLevel.SequenceBreak
        else
            return AccessibilityLevel.None
        end
    end
    if not amount then
        return count > 0
    else
        amount = tonumber(amount)
        return count >= amount
    end
end

function use_advanced()
    local adv = Tracker:FindObjectForCode("advanced_logic")
    return adv and adv.Active
end

function use_standard()
    return not use_advanced()
end

function adv(result)
    if result then
        if use_advanced() then
            return AccessibilityLevel.Normal
        else
            return AccessibilityLevel.SequenceBreak
        end
    else
        return AccessibilityLevel.None
    end
end
            
function can_mine()
    return has("tool_of_mining", 1)
end

function can_hm01()
    return has("blade_of_power", 1)
end

function is_shroom_nerd()
    return has("mycology_journal", 1)
end

function can_burn()
    return has("firestarter_kit", 1)
end

function is_pitch_black_baby()
    return has("headlamp", 1)
end

function can_screw_glass()
    return has("screwdriver", 1)
end

function can_go_water()
    return has("essence_of_water", 1)
end

function can_hail_magic_conch()
    return has("conch_shell", 1)
end

function can_fly()
    return has("leaf_glider", 1)
end

function has_climb_level(level)
    level = tonumber(level)
    if level == 1 then
        return has("rusty_hooks") or has("sturdy_hooks")
    elseif level == 2 then
        return has("sturdy_hooks")
    end
end

function is_literate()
    return has("tool_of_writing", 1)
end

function is_stretchy()
    return has("band_of_elasticity", 1)
end

function is_rich()
    return has("ancient_relic_1") and has("ancient_relic_2")
end

function is_thicc()
    return has("blueberry", 2)
end

function is_member()
    return has("secret_password", 1)
end

function can_boom()
    return all(
        has("explosive_powder", 2),
        can_burn()
    )
end

function can_has_lamp()
    return has("container_of_light", 1)
end

function has_a_secret()
    return has("secret_opener", 1)
end

function can_save_chungus()
    return has("old_string", 1)
end

function can_glue()
    return has("band_aid", 1)
end

function can_sprint()
    return has("energy_spore", 2)
end

function has_basics()
    return all(
        has_climb_level(1),
        can_fly()
    )
end

function has_tools()
    return all(
        has_climb_level(1),
        can_fly(),
        can_mine()
    )
end

function is_uncle_iroh()
    return has("lotus_flower", 5)
end