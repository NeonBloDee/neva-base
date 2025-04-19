AddEventHandler('chatMessage', function(source, author, message)
	if (message):find(Config.CommandPrefix) ~= 1 then
		return
	end

	local commandArgs = ESX.StringSplit(((message):sub((Config.CommandPrefix):len() + 1)), ' ')
	local commandName = (table.remove(commandArgs, 1)):lower()
	local command = ESX.Commands[commandName]

	if command then
		CancelEvent()
		local xPlayer = ESX.GetPlayerFromId(source)


		if command.group ~= nil then
			if ESX.GroupsRankRelative[xPlayer.getGroup()]  >= command.group then
				if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
					if not exports['core']:getService(source) then return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff') end
				end
				if (command.arguments > -1) and (command.arguments ~= #commandArgs) then
					TriggerEvent("esx:incorrectAmountOfArguments", source, command.arguments, #commandArgs)
				else
					command.callback(source, commandArgs, xPlayer)
				end
			else
				return ESX.Notifi(xPlayer.source, 'Vous n\'avez pas les permissions suffisantes')
			end
		else
			if (command.arguments > -1) and (command.arguments ~= #commandArgs) then
				TriggerEvent("esx:incorrectAmountOfArguments", source, command.arguments, #commandArgs)
			else
				command.callback(source, commandArgs, xPlayer)
			end
		end
	end
end)

function ESX.RegisterGroupCommand(command, group, callback)
	ESX.Commands[command] = {}
	ESX.Commands[command].group = group
	ESX.Commands[command].callback = callback
	ESX.Commands[command].arguments = arguments or -1
end

RegisterCommand('car', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 3) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		TriggerClientEvent('esx:spawnVehicle', source, args[1])
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)

RegisterCommand('pos', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 3) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		local x, y, z = tonumber(args[1]), tonumber(args[2]), tonumber(args[3])
		
		if x and y and z then
			TriggerClientEvent('esx:teleport', source, vector3(x, y, z))
		else
			ESX.ChatMessage(source, "Invalid coordinates!")
		end
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)

RegisterCommand('setjob', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 3) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		if tonumber(args[1]) and args[2] and tonumber(args[3]) then
			local player = exports['core']:getPlayerWithUniqueID(args[1])

			if player then
				local xPlayer = ESX.GetPlayerFromId(player.id)

				if args[1] == 'me' then
					xPlayer[source]:setJob(args[2], args[3])
				else
					if xPlayer then
						if ESX.DoesJobExist(args[2], args[3]) then
							xPlayer.setJob(args[2], args[3])
						else
							ESX.ChatMessage(source, 'That job does not exist.')
						end
					end
				end
			else
				ESX.ChatMessage(source, 'Invalid usage.')
			end
		else
			ESX.ChatMessage(source, 'Player not online.')
		end
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)

RegisterCommand('setjob2', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 3) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		if tonumber(args[1]) and args[2] and tonumber(args[3]) then
			local player = exports['core']:getPlayerWithUniqueID(args[1])

			if player then
				local xPlayer = ESX.GetPlayerFromId(player.id)

				if xPlayer then
					if ESX.DoesJobExist(args[2], args[3]) then
						xPlayer.setJob2(args[2], args[3])
					else
						ESX.ChatMessage(source, 'That job does not exist.')
					end
				end
			else
				ESX.ChatMessage(source, 'Invalid usage.')
			end
		else
			ESX.ChatMessage(source, 'Player not online.')
		end
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)

RegisterCommand('dv', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 3) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		TriggerClientEvent('esx:deleteVehicle', source, args[1])
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)

RegisterNetEvent('server:deleteVehicle')
AddEventHandler('server:deleteVehicle', function(netId)
	if source == 0 then return end

	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
	
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    if DoesEntityExist(vehicle) then
        DeleteEntity(vehicle)
    end
end)

RegisterCommand('giveitem', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 7) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		local player = exports['core']:getPlayerWithUniqueID(args[1])

		if player then
			local xPlayer = ESX.GetPlayerFromId(player.id)

			if xPlayer then
				local item = args[2]
				local count = tonumber(args[3])
		
				if count then
					if ESX.Items[item] then
						xPlayer.addInventoryItem(item, count)
					else
						xPlayer.showNotification(_U('invalid_item'))
					end
				else
					xPlayer.showNotification(_U('invalid_amount'))
				end
			end
		else
			ESX.ChatMessage(source, 'Player not online.')
		end
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)

RegisterCommand('giveweapon', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 7) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		local player = exports['core']:getPlayerWithUniqueID(args[1])

		if player then
			local xPlayer = ESX.GetPlayerFromId(player.id)
			if xPlayer then
				local weaponName = args[2] or 'unknown'
		
				if ESX.getWeapon(weaponName) then
					xPlayer.addWeapon(weaponName, tonumber(args[3]))
				else
					ESX.ChatMessage(source, 'Le nom de l\'arme est invalide.')
				end
			end
		else
			ESX.ChatMessage(source, 'Player not online.')
		end
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)

RegisterCommand('giveweaponcomponent', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 7) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		local player = exports['core']:getPlayerWithUniqueID(args[1])

		if player then
			local xPlayer = ESX.GetPlayerFromId(player.id)

			if xPlayer then
				local weaponName = args[2] or 'unknown'
		
				if ESX.getWeapon(weaponName) then
					if xPlayer.hasWeapon(weaponName) then
						local component = ESX.GetWeaponComponent(weaponName, args[3] or 'unknown')
		
						if component then
							xPlayer.addWeaponComponent(weaponName, args[3])
						else
							ESX.ChatMessage(source, 'Invalid weapon component.')
						end
					else
						ESX.ChatMessage(source, 'Player does not have that weapon.')
					end
				else
					ESX.ChatMessage(source, 'Invalid weapon.')
				end
			end
		else
			ESX.ChatMessage(source, 'Player not online.')
		end
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)

RegisterCommand('clearall', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 6) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		TriggerEvent("ratelimit", source, "clearall")
		TriggerClientEvent('chat:clear', -1)
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)

RegisterCommand('clearinventory', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 7) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		if args[1] == nil then return end

		if args[1] then
			local player = exports['core']:getPlayerWithUniqueID(args[1])

			if player then
				xPlayer = ESX.GetPlayerFromId(player.id)
			else
				xPlayer = ESX.GetPlayerFromId(source)
			end
		else
			xPlayer = ESX.GetPlayerFromId(source)
		end

		if xPlayer then
			for i = 1, #xPlayer.inventory, 1 do
				if xPlayer.inventory[i] then
					if xPlayer.inventory[i].count > 0 then
						xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
					end
				end
			end
		else
			ESX.ChatMessage(source, 'Player not online.')
		end
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)

RegisterCommand('clearloadout', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 7) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		if args[1] == nil then return end

		if args[1] then
			local player = exports['core']:getPlayerWithUniqueID(args[1])

			if player then
				xPlayer = ESX.GetPlayerFromId(player.id)
				
			else
				xPlayer = ESX.GetPlayerFromId(source)
			end
		else
			xPlayer = ESX.GetPlayerFromId(source)
		end

		if xPlayer then
			for i = #xPlayer.loadout, 1, -1 do
				if xPlayer.loadout[i] then
					xPlayer.removeWeapon(xPlayer.loadout[i].name)
				end
			end
		else
			ESX.ChatMessage(source, 'Player not online.')
		end
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)

RegisterCommand('giveaccountmoney', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and (ESX.GroupsRankRelative[xPlayer.getGroup()] >= 7) then
		if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
			if not exports['core']:getService(source) then 
				return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff')
			end
		end
		local _source = source

		local player = exports['core']:getPlayerWithUniqueID(args[1])

		if player then
			local xPlayer = ESX.GetPlayerFromId(player.id)

			local account = args[2]

			local amount  = tonumber(args[3])


			if xPlayer then
				if amount ~= nil then

					if xPlayer.getAccount(account) ~= nil then
			
						xPlayer.addAccountMoney(account, amount)
			
					else
			
						TriggerClientEvent('esx:showNotification', _source, _U('invalid_account'))
			
					end
			
				else
			
					TriggerClientEvent('esx:showNotification', _source, _U('amount_invalid'))
			
				end
			end
		else
			return TriggerClientEvent('esx:showNotification', 'Joueur non connécté')
		end
	else
		ESX.Notifi(source, 'Vous n\'avez pas les permissions suffisantes')
	end
end, false)