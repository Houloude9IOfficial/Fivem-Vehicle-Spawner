local bikeSpawners = Config.SpawnLocations
ESX = exports['es_extended']:getSharedObject()
local spawnBikeKey = Config.keybind

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function SpawnBike(location)
    if IsVehicleOnTop(location) then
        ESX.ShowNotification("~r~Spawn point is blocked!")
        return
    end

    RequestModel(location.bikeModel)
    while not HasModelLoaded(location.bikeModel) do
        Wait(500)
    end

    local bike = CreateVehicle(location.bikeModel, location.coords.x, location.coords.y, location.coords.z, 0.0, true, false)
    SetEntityAsMissionEntity(bike, true, true)
    SetVehicleCustomPrimaryColour(bike, location.color.r, location.color.g, location.color.b)

    TaskWarpPedIntoVehicle(PlayerPedId(), bike, -1)
end

function IsVehicleOnTop(location)
    local vehicles = GetGamePool('CVehicle')
    for _, vehicle in ipairs(vehicles) do
        if #(GetEntityCoords(vehicle) - location.coords) < 3.0 then
            return true
        end
    end
    return false
end

function DrawFloatingText(coords, text)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.35, 0.35)
    SetTextColour(255, 255, 255, 215)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    SetDrawOrigin(coords.x, coords.y, coords.z + 0, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function DisplayKeyPrompt(location)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local distance = #(playerCoords - location.coords)

    if distance < location.distance then
        if Config.showtip then
            DrawFloatingText(location.coords, "~g~Press " .. Config.keybindlabel .. " to spawn.")
        end
        if IsControlJustPressed(0, spawnBikeKey) then
            SpawnBike(location)
            ESX.ShowNotification("~g~Bike spawned! Press " .. Config.keybindlabel .. " to spawn.")
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        for _, location in ipairs(bikeSpawners) do
            if #(playerCoords - location.coords) < location.markerDistance then
                DrawMarker(location.markerID, location.coords.x, location.coords.y, location.coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, location.color.r, location.color.g, location.color.b, 100, false, true, 2, false, false, false, false)
                DisplayKeyPrompt(location)
            end
        end
    end
end)

for _, location in ipairs(bikeSpawners) do
    location.isBikeSpawned = false
end

RegisterCommand("refreshspawners", function()
    ExecuteCommand("restart " .. GetCurrentResourceName())
    ESX.ShowNotification("~g~Spawners refreshed and resource restarted.")
end, false)

function CreateBlipForLocation(location)
    if location.showBlip then
        local blip = AddBlipForCoord(location.coords.x, location.coords.y, location.coords.z)
        SetBlipSprite(blip, location.blipID)
        SetBlipScale(blip, location.scale)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 2) -- Green color, change as needed
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Bike Spawn")
        EndTextCommandSetBlipName(blip)

        location.blip = blip
    end
end

Citizen.CreateThread(function()
    for _, location in ipairs(bikeSpawners) do
        CreateBlipForLocation(location)
    end
end)
