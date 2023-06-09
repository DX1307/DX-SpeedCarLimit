Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle) * 2.236936
            local category = GetVehicleClass(vehicle)
            local limit = Config.speedLimits[category]
            local name = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            local limitByName = speedLimitsByName[name]
            if limitByName then
                limit = limitByName
            end
            if limit and speed > limit then
                SetEntityMaxSpeed(vehicle, limit * 0.44704)
            else
                SetEntityMaxSpeed(vehicle, Config.CarSpeedMax)
            end
        end
    end
end)

function GetVehicleClassFromName(name)
    for k,v in pairs(Config.VehicleClasses) do
        for i=1, #v.models do
            if v.models[i] == name then
                return k
            end
        end
    end
    return nil
end