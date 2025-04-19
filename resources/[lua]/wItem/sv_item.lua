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
    TriggerEvent('wItem:useBandage', source)
    print('je suis la')
end)

RegisterServerEvent('wItem:useBandage')
AddEventHandler('wItem:useBandage', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem('bandage').count > 0 then
        local maxHealth = GetEntityMaxHealth(GetPlayerPed(source))
        local healAmount = math.floor(maxHealth * 0.20)
        TriggerEvent('esx_status:add', source, 'health', healAmount)
        xPlayer.removeInventoryItem('bandage', 1)
        TriggerClientEvent('wItem:startHealAnimation', source)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez utilisé un bandage et récupéré une partie de votre santé.')
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas de bandage.')
    end
end)

ESX.RegisterUsableItem('medikit', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerEvent('wItem:useMedikit', source)
end)

RegisterServerEvent('wItem:useMedikit')
AddEventHandler('wItem:useMedikit', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerClientEvent('wItem:startHealAnimation', _source)

    TriggerEvent('esx_status:set', _source, 'health', 100)
    xPlayer.removeInventoryItem('medikit', 1)

    TriggerClientEvent('esx:showNotification', _source, 'Vous avez utilisé un medikit et récupéré toute votre santé.')
end)

