local densitySettings = Config.Density

local function UpdateDensity(settings)
    densitySettings = settings
end

RegisterNetEvent('frwk:updateDensity')
AddEventHandler('frwk:updateDensity', UpdateDensity)

Citizen.CreateThread(function()
    while true do
        SetPedDensityMultiplierThisFrame(densitySettings.Peds)
        SetVehicleDensityMultiplierThisFrame(densitySettings.Vehicles)
        SetParkedVehicleDensityMultiplierThisFrame(densitySettings.ParkedVehicles)
        SetRandomVehicleDensityMultiplierThisFrame(densitySettings.RandomVehicles)

        SetCreateRandomCops(densitySettings.EnableCops)
        SetCreateRandomCopsNotOnScenarios(densitySettings.EnableCops)
        SetCreateRandomCopsOnScenarios(densitySettings.EnableCops)

        Citizen.Wait(0)
    end
end)

-- AddEventHandler('entityCreated', function(entity)
--     Citizen.Wait(0)
--     if IsEntityAVehicle(entity) then
--         SetVehicleDoorsLocked(entity, 2)
--         SetVehicleDoorsLockedForAllPlayers(entity, true)
--     end
-- end)
