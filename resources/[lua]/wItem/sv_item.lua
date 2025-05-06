ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('repairkit', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('wItem:repairNearestVehicle', source)
end)

RegisterServerEvent("wItem:RepareOK")
AddEventHandler("wItem:RepareOK", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('repairkit', 1)
end)

ESX.RegisterUsableItem('kitcarro', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('wItem:cleanNearestVehicle', source)
end)

RegisterServerEvent("wItem:CleanOK")
AddEventHandler("wItem:CleanOK", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('kitcarro', 1)
end)

ESX.RegisterUsableItem('bandage', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getInventoryItem('bandage').count > 0 then
        TriggerClientEvent('wItem:startHealAnimation', source, false)
        xPlayer.removeInventoryItem('bandage', 1)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez utilisé un bandage.')
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas de bandage.')
    end
end)

ESX.RegisterUsableItem('medikit', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getInventoryItem('medikit').count > 0 then
        TriggerClientEvent('wItem:startHealAnimation', source, true)
        xPlayer.removeInventoryItem('medikit', 1)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez utilisé un medikit.')
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas de medikit.')
    end
end)

