ESX = nil 
CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Wait(0)
    end
end)

RegisterNetEvent('wItem:repairNearestVehicle')
AddEventHandler('wItem:repairNearestVehicle', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)

    if DoesEntityExist(vehicle) then
        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        ClearPedTasksImmediately(playerPed)
        ESX.ShowNotification('~g~Vehicle reparé ! ')
        TriggerServerEvent('wItem:RepareOK')
    else
        ESX.ShowNotification('~r~Pas de véhicule autour !')
    end
end)


RegisterNetEvent('wItem:cleanNearestVehicle')
AddEventHandler('wItem:cleanNearestVehicle', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)

    if DoesEntityExist(vehicle) then
        TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
        SetVehicleDirtLevel(vehicle, 0)
        ClearPedTasksImmediately(playerPed)
        ESX.ShowNotification('~g~Vehicle Nettoyé !')
        TriggerServerEvent('wItem:CleanOK')
    else
        ESX.ShowNotification('~r~Pas de véhicule autour !')
    end
end)

RegisterNetEvent('wItem:startHealAnimation')
AddEventHandler('wItem:startHealAnimation', function()
    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, true)
    RequestAnimDict("anim@amb@nightclub@peds@")
    while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
        Wait(100)
    end
    
    TaskPlayAnim(playerPed, "anim@amb@nightclub@peds@", "amb_medic_standing_timeofdeath_base", 8.0, -8.0, -1, 49, 0, false, false, false)


    FreezeEntityPosition(playerPed, false)
    ClearPedTasks(playerPed)
end)

RegisterCommand('kill', function()
    local playerPed = PlayerPedId()
    SetEntityHealth(playerPed, 0)
    print("Vous vous êtes suicidé.")
end, false)

