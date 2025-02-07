# 🚲🚗 FiveM Vehicle Spawner  

Easily spawn vehicles at predefined locations with customizable options!  

## ✨ Features  

✅ **Spawn bikes at specific locations**  
✅ **Markers are only visible when players are close (customizable distance)**  
✅ **Floating text appears dynamically above markers when enabled**  
✅ **Prevents spawning if a vehicle is blocking the spawn spot**  
✅ **Custom keybind for spawning (fully configurable)**  
✅ **`/refreshspawners` command to restart the resource and refresh spawn points**  

## 📌 Requirements  

### 🔹 ESX Framework  
- `es_extended` (usually built-in with ESX)  

## 🎮 How It Works  

- Players can see a marker when they get close to a spawn point.  
- If enabled, floating text appears above the marker saying **"Press E to Spawn"**.  
- Pressing the keybind spawns a vehicle **only if no other vehicle is blocking the spot**.  
- Players automatically enter the spawned bike.  
- The `/refreshspawners` command restarts the resource to refresh all spawn locations.  

## 🔧 Configuration  

Modify `config.lua` to customize the spawner behavior:  

```lua
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
```

# 🔗 Links

### [Controls](https://docs.fivem.net/docs/game-references/controls)
### [Blips](https://docs.fivem.net/docs/game-references/blips)
### [Markers](https://docs.fivem.net/docs/game-references/markers)
### [Colors](https://docs.fivem.net/docs/game-references/hud-colors)
