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
        local dict = "mini@repair"
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(100)
        end
        
        FreezeEntityPosition(playerPed, true)
        TaskPlayAnim(playerPed, dict, "fixing_a_player", 8.0, -8.0, -1, 49, 0, false, false, false)
        
        if lib.progressBar({
            duration = 8000,
            label = 'Réparation en cours...',
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
                move = true,
                combat = true
            },
        }) then
            SetVehicleFixed(vehicle)
            SetVehicleDeformationFixed(vehicle)
            SetVehicleUndriveable(vehicle, false)
            ClearPedTasksImmediately(playerPed)
            FreezeEntityPosition(playerPed, false)
            ESX.ShowNotification('~g~Véhicule réparé avec succès!')
            TriggerServerEvent('wItem:RepareOK')
        end
    else
        ESX.ShowNotification('~r~Pas de véhicule à proximité!')
    end
end)


RegisterNetEvent('wItem:cleanNearestVehicle')
AddEventHandler('wItem:cleanNearestVehicle', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)

    if DoesEntityExist(vehicle) then
        local dict = "timetable@floyd@clean_kitchen@base"
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(100)
        end
        
        FreezeEntityPosition(playerPed, true)
        TaskPlayAnim(playerPed, dict, "base", 8.0, -8.0, -1, 49, 0, false, false, false)
        
        if lib.progressBar({
            duration = 6000,
            label = 'Nettoyage en cours...',
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
                move = true,
                combat = true
            },
        }) then
            SetVehicleDirtLevel(vehicle, 0)
            ClearPedTasksImmediately(playerPed)
            FreezeEntityPosition(playerPed, false)
            ESX.ShowNotification('~g~Véhicule nettoyé avec succès!')
            TriggerServerEvent('wItem:CleanOK')
        end
    else
        ESX.ShowNotification('~r~Pas de véhicule à proximité!')
    end
end)

RegisterNetEvent('wItem:startHealAnimation')
AddEventHandler('wItem:startHealAnimation', function(isMedikit)
    local playerPed = PlayerPedId()
    local dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
    local anim = "machinic_loop_mechandplayer"
    
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(100)
    end
    
    FreezeEntityPosition(playerPed, true)
    TaskPlayAnim(playerPed, dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
    
    local duration = isMedikit and 8000 or 4000
    local label = isMedikit and 'Application du kit de soin...' or 'Application du bandage...'
    
    if lib.progressBar({
        duration = duration,
        label = label,
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
            combat = true
        },
    }) then
        -- Progress complete
        if isMedikit then
            -- Update health directly on client side
            SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
        else
            -- Add 20% of max health
            local maxHealth = GetEntityMaxHealth(playerPed)
            local currentHealth = GetEntityHealth(playerPed)
            local newHealth = math.min(currentHealth + (maxHealth * 0.20), maxHealth)
            SetEntityHealth(playerPed, newHealth)
        end
    end
    
    ClearPedTasks(playerPed)
    FreezeEntityPosition(playerPed, false)
end)

RegisterCommand('kill', function()
    local playerPed = PlayerPedId()
    SetEntityHealth(playerPed, 0)
    print("Vous vous êtes suicidé.")
end, false)

