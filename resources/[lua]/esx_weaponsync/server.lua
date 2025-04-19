ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx:discardInventoryItem')
AddEventHandler('esx:discardInventoryItem', function(item, count)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
  xPlayer.removeInventoryItem(item, count)

end)

RegisterServerEvent('esx:modelChanged')
AddEventHandler('esx:modelChanged', function(id)
	TriggerClientEvent('esx:modelChanged', id)
end)

ESX.RegisterUsableItem('pistol_ammo_box', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('pistol_ammo_box', 1)
	xPlayer.addInventoryItem('pistol_ammo', 24)
end)

ESX.RegisterUsableItem('smg_ammo_box', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('smg_ammo_box', 1)
	xPlayer.addInventoryItem('smg_ammo', 30)
end)

ESX.RegisterUsableItem('rifle_ammo_box', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('rifle_ammo_box', 1)
	xPlayer.addInventoryItem('rifle_ammo', 30)
end)

ESX.RegisterUsableItem('shotgun_ammo_box', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('shotgun_ammo_box', 1)
	xPlayer.addInventoryItem('shotgun_ammo', 16)
end)

local weaponCooldowns = {}

ESX.RegisterUsableItem('weapon', function(source, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemName = item.name
    
    if weaponCooldowns[source] and weaponCooldowns[source][itemName] then
        local timeLeft = weaponCooldowns[source][itemName] - GetGameTimer()
        if timeLeft > 0 then
            TriggerClientEvent('esx:showNotification', source, 'Vous devez attendre avant de pouvoir réutiliser cette arme')
            return
        end
    end

    weaponCooldowns[source] = weaponCooldowns[source] or {}
    weaponCooldowns[source][itemName] = GetGameTimer() + 500

    TriggerClientEvent('kotonier:equipWeapon', source, string.upper(itemName))
end)

AddEventHandler('playerDropped', function()
    local source = source
    weaponCooldowns[source] = nil
end)

for k, v in pairs(Config.Weapons) do
	ESX.RegisterUsableItem(v.item, function(playerId)
		TriggerClientEvent('kotonier:equipWeapon', playerId, k)
	end)
end