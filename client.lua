CreateThread(function()
    while true do
        Wait(0)
        local playerPed = GetPlayerPed(-1)
        if IsPedInAnyVehicle(playerPed, false) then
            for k,v in pairs(Config.speedLimitsByName) do
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                local speed = GetEntitySpeed(vehicle) * 3.6
                local name = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                local nametext = GetLabelText(name)
                local limitByName = k
                local LimitType = v
                if name == limitByName then
                    if  speed > LimitType then
                        SetEntityMaxSpeed(vehicle, LimitType* 0.28)
                    else
                        SetEntityMaxSpeed(vehicle,Config.CarSpeedMax)
                    end
                end
            end
        end
    end
end)
