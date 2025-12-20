
local variant = Tracker.ActiveVariantUID

-- Items
require("scripts/items_import")

-- Logic
require("scripts/logic/logic_helper")
require("scripts/logic/logic_main")
require("scripts/logic/regions_logic")
require("scripts/logic/locations_logic")

-- Maps
Tracker:AddMaps("maps/maps.jsonc")  

-- Layout
require("scripts/layouts_import")

-- Locations
Tracker:AddLocations("locations/garden_locations.jsonc")
Tracker:AddLocations("locations/forest_locations.jsonc")
Tracker:AddLocations("locations/lake_locations.jsonc")
Tracker:AddLocations("locations/grove_locations.jsonc")

ScriptHost:AddWatchForCode("progressive_hook_handler", "progressive_hooks", function(code)
    local count = Tracker:ProviderCountForCode("progressive_hooks")
    if count == 1 then
        Tracker:FindObjectForCode("rusty_hooks").Active = true
    elseif count == 2 then
        Tracker:FindObjectForCode("sturdy_hooks").Active = true
    else
        Tracker:FindObjectForCode("rusty_hooks").Active = false
        Tracker:FindObjectForCode("sturdy_hooks").Active = false
    end
end)

ScriptHost:AddWatchForCode("relic_handler", "ancient_relic", function(code)
    local count = Tracker:ProviderCountForCode("ancient_relic")
    if count == 1 then
        Tracker:FindObjectForCode("ancient_relic_1").Active = true
    elseif count == 2 then
        Tracker:FindObjectForCode("ancient_relic_2").Active = true
    else 
        Tracker:FindObjectForCode("ancient_relic_1").Active = false
        Tracker:FindObjectForCode("ancient_relic_2").Active = false
    end
end)

ScriptHost:AddWatchForCode("level_toggle", "*", function(code)
    local forest = Tracker:FindObjectForCode('@Forest of Fall')
    if forest.AccessibilityLevel == AccessibilityLevel.Normal then
        Tracker:FindObjectForCode("forest_of_fall").Active = true
    end
    local lake = Tracker:FindObjectForCode('@Lake of Bloom')
    if lake.AccessibilityLevel == AccessibilityLevel.Normal then
        Tracker:FindObjectForCode("lake_of_bloom").Active = true
    end
    local grove = Tracker:FindObjectForCode('@Elder\'s Home')
    if grove.AccessibilityLevel == AccessibilityLevel.Normal then
        Tracker:FindObjectForCode("grove_of_life").Active = true
    end
end)

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.26.0" then
    require("scripts/autotracking")
end