local response

local function toggleNuiFrame(shouldShow)
    -- SetNuiFocus(shouldShow, shouldShow)
    SendReactMessage('setVisible', shouldShow)
end

Citizen.CreateThread(function()
    local isShowing = false
    while true do
        local wait = 1000
        if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) then
            wait = 100
            if isShowing == false then
                toggleNuiFrame(true)
                isShowing = true
            end
            if isShowing then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                local speed = GetEntitySpeed(vehicle) * 3.6
                speed = math.floor(speed)
                local fuel = GetVehicleFuelLevel(vehicle)
                local engine = GetIsVehicleEngineRunning(vehicle)
                local headlight = GetVehicleDashboardLights(vehicle)
                local light = GetVehicleLightsState(vehicle)
                if headlight == 0 then headlight = false else headlight = true end
                if engine == 1 then engine = true else engine = false end
                SendReactMessage('setIcons', { engine = engine, headlight = headlight })
                SendReactMessage('setFuel', fuel)
                SendReactMessage('setSpeed', speed)
            end
        else
            if isShowing then
                toggleNuiFrame(false)
                isShowing = false
            end
        end

        Citizen.Wait(wait)
    end
end)