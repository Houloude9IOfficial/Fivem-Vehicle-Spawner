Config = {}

Config.SpawnLocations = {
    {
        coords = vector3(-235.094498, -969.694519, 29.4),
        bikeModel = "bf400",  -- Set the model of the bike for this location
        markerID = 23,  -- Marker ID for the spawn point
        color = { r = 255, g = 0, b = 0 },  -- Marker color
        distance = 1,  -- Distance within which the bike can spawn
        showBlip = true,  -- Whether to show the blip on the map
        markerDistance = 1000.0,  -- Distance required to see the spawn marker BE AWARE OF PERFORMANCE ISSUES
        blipID = 226,  -- Blip ID
        scale = 0.8,  -- Blip scale
    },
    {
        coords = vector3(-235.094498, -979.694519, 29.4),
        bikeModel = "bf400",  -- Set the model of the bike for this location
        markerID = 23,  -- Marker ID for the spawn point
        color = { r = 255, g = 0, b = 0 },  -- Marker color
        distance = 1,  -- Distance within which the bike can spawn
        showBlip = true,  -- Whether to show the blip on the map
        markerDistance = 1000.0,  -- Distance required to see the spawn marker BE AWARE OF PERFORMANCE ISSUES
        blipID = 226,  -- Blip ID
        scale = 0.8,  -- Blip scale
    }
}

Config.keybind = 38  -- E Key | Find more here: https://docs.fivem.net/docs/game-references/controls
Config.keybindlabel = "E" -- The same as before but string
Config.showtip = true -- Whether to show the tooltip
