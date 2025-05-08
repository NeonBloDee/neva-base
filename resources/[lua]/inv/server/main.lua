

RegisterServerCallback("lgddddd:getPlayerInventory", function(source, cb)
	local xPlayer = GetPlayerFromId(source)
	if xPlayer ~= nil then
		local identifier = GetPlayerLicense(xPlayer)
		-- local bag = xPlayer.getInventoryItem('sac').count
		local clothes = {}
		if Config.ActivePhoneUnique then
			getNumberInBDD(identifier, function(phoneData)
				dataPhone = phoneData
			end)
		end
		if Config.ActiveIdCard then
			getCardInBDD(identifier, function(cardData)
				idcardData = cardData
			end)
		end

		MySQL.Async.fetchAll('SELECT * FROM sunny_clothes WHERE identifier = @identifier', {
			['@identifier'] = identifier
		}, function(result) 

				if result[1] then
					for i = 1, #result, 1 do  
						table.insert(clothes, {      
							type      = result[i].type,  
							clothe      = result[i].data,
							id      = result[i].id,
							label      = result[i].name,
						})
					end
				end

				-- if bag >= 1 then 
				-- 	weightInv = 60
				-- else
				-- 	weightInv = GetPlayerMaxWeight(xPlayer)
				-- end


				cb({
					inventory = GetPlayerInventory(xPlayer), 
					accounts = GetPlayerMoney(xPlayer), 
					weapons = GetPlayerWeapon(xPlayer), 
					weight = GetPlayerWeight(xPlayer), 
					maxWeight = GetPlayerMaxWeight(xPlayer),
					clothes = clothes,
					idcard = idcardData,
					phone = dataPhone,
				})
		end)  
	-- 	if targetXPlayer ~= nil then
	-- 		-- cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.getLoadout(), weight = targetXPlayer.getWeight(), maxWeight = targetXPlayer.maxWeight, cards = result, idcard = result2})

	-- 		cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.getLoadout(), weight = targetXPlayer.getWeight(), maxWeight = targetXPlayer.maxWeight})
	else
		cb(nil)
	end
	-- end
end)






-- Modification du gestionnaire d'événements 'lgd:giveItem'
RegisterNetEvent('lgd:giveItem')
AddEventHandler('lgd:giveItem', function(target, name, count, type, label)
    local source = source
    local xPlayer = GetPlayerFromId(source)
    local xTarget = GetPlayerFromId(target)
    
    -- Vérifier si la source et la cible sont valides
    if not xPlayer or not xTarget then
        if xPlayer then xPlayer.showNotification("Transaction impossible: joueur cible invalide") end
        return
    end
    
    -- Empêcher de se donner à soi-même
    if source == target then
        xPlayer.showNotification("Vous ne pouvez pas vous donner un objet à vous-même")
        return
    end
    
    -- Verrouillage pour éviter les duplications
    if transferInProgress then
        xPlayer.showNotification("Une transaction est déjà en cours, veuillez patienter")
        return
    end
    
    transferInProgress = true
    
    local _itemName = name
    local check = exports['ArmePerm']:sv_isitemperm(_itemName)
    if check == false then 
        if type == 'item_standard' then
            local x_Item = GetItem(xPlayer, name)
            if count > 0 and GetItemAmount(x_Item) >= count then
                if getWeight(xTarget, name, count) then
                    -- Retirer d'abord, puis ajouter pour éviter les duplications
                    RemoveItem(xPlayer, name, count)
                    
                    -- Petit délai pour éviter les problèmes de synchronisation
                    Wait(50)
                    
                    AddItem(xTarget, name, count)
                    showNotification(xPlayer, (Locales[Config.Language]['give_from_item']):format(count, GetItemLabel(name)), 'success')
                    showNotification(xTarget, (Locales[Config.Language]['give_target_item']):format(count, GetItemLabel(name)), 'success')
                    
                    -- Logger la transaction
                    logItemTransfer(source, target, name, count, "item_standard")
                else
                    showNotification(xPlayer, Locales[Config.Language]['give_error_weight'], 'error')
                end
            else
                showNotification(xPlayer, "Vous n'avez pas cette quantité", 'error')
            end
        elseif type == 'item_account' then
            if count > 0 and getAccount(xPlayer, name) >= count then
                -- Retirer d'abord, puis ajouter
                removeMoney(xPlayer, name, count)
                
                -- Petit délai pour éviter les problèmes de synchronisation
                Wait(50)
                
                addMoney(xTarget, name, count)
                showNotification(xPlayer, (Locales[Config.Language]['give_from_account']):format(count, Config.AccountName[name]), 'success')
                showNotification(xTarget, (Locales[Config.Language]['give_target_account']):format(count, Config.AccountName[name]), 'success')
                
                -- Logger la transaction
                logItemTransfer(source, target, name, count, "item_account")
            else
                showNotification(xPlayer, Locales[Config.Language]['give_error_account'], 'error')
            end
        elseif type == 'item_vetement' then
            -- Vérifier d'abord si le vêtement existe
            MySQL.Async.fetchScalar('SELECT COUNT(*) FROM sunny_clothes WHERE id = @id', {
                ['@id'] = name
            }, function(count)
                if count > 0 then
                    -- Mise à jour sécurisée
                    MySQL.Sync.execute('UPDATE sunny_clothes SET identifier = @identifier WHERE id = @id AND identifier = @sourceIdentifier', {
                        ['@id'] = name,
                        ['@identifier'] = GetPlayerLicense(xTarget),
                        ['@sourceIdentifier'] = GetPlayerLicense(xPlayer)
                    })
                    
                    showNotification(xPlayer, Locales[Config.Language]['give_from_clothes'], 'success')
                    showNotification(xTarget, Locales[Config.Language]['give_target_clothes'], 'success')
                    
                    -- Logger la transaction
                    logItemTransfer(source, target, "vêtement_id_" .. name, 1, "item_vetement")
                else
                    showNotification(xPlayer, "Ce vêtement n'existe plus", 'error')
                end
            end)
        elseif type == 'item_phone' then
            -- Vérifier d'abord si le téléphone existe
            MySQL.Async.fetchScalar('SELECT COUNT(*) FROM ' .. phoneTable .. ' WHERE ' .. numberTable .. ' = @number AND ' .. idPhoneTable .. ' = @sourceId', {
                ['@number'] = name,
                ['@sourceId'] = GetPlayerLicense(xPlayer)
            }, function(count)
                if count > 0 then
                    -- Mise à jour sécurisée
                    MySQL.Sync.execute('UPDATE ' .. phoneTable .. ' SET ' .. idPhoneTable .. ' = @targetId WHERE ' .. numberTable .. ' = @number AND ' .. idPhoneTable .. ' = @sourceId', {
                        ['@number'] = name,
                        ['@targetId'] = GetPlayerLicense(xTarget),
                        ['@sourceId'] = GetPlayerLicense(xPlayer)
                    })
                    
                    showNotification(xPlayer, (Locales[Config.Language]['give_from_phone']):format(formatPhoneNumber(name)), 'success')
                    showNotification(xTarget, (Locales[Config.Language]['give_target_phone']):format(formatPhoneNumber(name)), 'success')
                    
                    -- Logger la transaction
                    logItemTransfer(source, target, "téléphone_" .. name, 1, "item_phone")
                else
                    showNotification(xPlayer, "Ce téléphone n'existe plus", 'error')
                end
            end)
        elseif type == 'item_weapon' then
            if not getWeapon(xTarget, name) then
                -- Vérifier si le joueur a bien l'arme
                if getWeapon(xPlayer, name) then
                    removeWeapon(xPlayer, name)
                    
                    -- Petit délai pour éviter les problèmes de synchronisation
                    Wait(50)
                    
                    AddItem(xTarget, name, count)
                    showNotification(xPlayer, (Locales[Config.Language]['give_from_weapon']):format(label), 'success')
                    showNotification(xTarget, (Locales[Config.Language]['give_target_weapon']):format(label), 'success')
                    
                    -- Logger la transaction
                    logItemTransfer(source, target, name, 1, "item_weapon")
                else
                    showNotification(xPlayer, "Vous n'avez pas cette arme", 'error')
                end
            else
                showNotification(xPlayer, Locales[Config.Language]['give_error_weapon'], 'error')
            end
        end
    else
        xPlayer.showNotification("Vous ne pouvez pas faire cela, cet item est permanent.")
    end
    
    -- Libérer le verrou après un délai
    SetTimeout(500, function()
        transferInProgress = false
    end)
end)

-- Fonction de journalisation pour les transferts d'items
function logItemTransfer(sourceId, targetId, itemName, count, itemType)
    local sourceName = GetPlayerName(sourceId) or "Inconnu"
    local targetName = GetPlayerName(targetId) or "Inconnu"
    local sourceIdentifier = GetPlayerIdentifiers(sourceId)[1] or "Inconnu"
    local targetIdentifier = GetPlayerIdentifiers(targetId)[1] or "Inconnu"
    
    print(string.format("[ITEM_TRANSFER] %s (%s) a donné %s x%s à %s (%s) - Type: %s",
        sourceName, sourceIdentifier, itemName, count, targetName, targetIdentifier, itemType))
    
    -- On pourrait aussi enregistrer dans une base de données ou un fichier
    -- MySQL.Async.execute('INSERT INTO item_transfers (source_id, target_id, item_name, count, item_type, timestamp) VALUES (@source, @target, @item, @count, @type, @time)', {
    --     ['@source'] = sourceIdentifier,
    --     ['@target'] = targetIdentifier,
    --     ['@item'] = itemName,
    --     ['@count'] = count,
    --     ['@type'] = itemType,
    --     ['@time'] = os.time()
    -- })
end

-- Modification du gestionnaire d'événements 'lgd:removeItem'
RegisterNetEvent('lgd:removeItem')
AddEventHandler('lgd:removeItem', function(info, name, count)
    local source = source
    local xPlayer = GetPlayerFromId(source)

    if not xPlayer then return end
    
    -- Verrouillage pour éviter les duplications
    if removeInProgress then
        xPlayer.showNotification("Une suppression est déjà en cours, veuillez patienter")
        return
    end
    
    removeInProgress = true
    
    local _itemName = name
    local check = exports['ArmePerm']:sv_isitemperm(_itemName)
    if check == false then 
        if info == 'item_standard' then
            local x_Item = GetItem(xPlayer, name)
            if count > 0 and GetItemAmount(x_Item) >= count then		
                RemoveItem(xPlayer, name, count)
                xPlayer.showNotification("Vous avez détruit " .. count .. "x " .. GetItemLabel(name))
            else
                xPlayer.showNotification("Vous n'avez pas cette quantité")
            end
        elseif info == 'item_weapon' then
            if getWeapon(xPlayer, name) then
                removeWeapon(xPlayer, name)
                xPlayer.showNotification("Vous avez détruit votre arme")
            else
                xPlayer.showNotification("Vous n'avez pas cette arme")
            end
        elseif info == 'item_account' then
            if count > 0 and getAccount(xPlayer, name) >= count then
                removeMoney(xPlayer, name, count)
                xPlayer.showNotification("Vous avez détruit " .. count .. "$ " .. Config.AccountName[name])
            else
                xPlayer.showNotification("Vous n'avez pas ce montant")
            end
        elseif info == 'item_vetement' then
            MySQL.Async.execute('DELETE FROM sunny_clothes WHERE id = @id', { 
                ['@id'] = name 
            })
            xPlayer.showNotification("Vous avez détruit un vêtement")
        elseif info == 'item_phone' then
            MySQL.Sync.execute('DELETE FROM '..phoneTable..' WHERE '..numberTable..' = @'..numberTable..'', {
                ['@'..numberTable] = name,   
            })
            xPlayer.showNotification("Vous avez détruit un téléphone")
        end
    else
        xPlayer.showNotification("Vous ne pouvez pas faire cela, cet item est permanent.")
    end
    
    -- Libérer le verrou après un délai
    SetTimeout(500, function()
        removeInProgress = false
    end)
end)

-- Fonction de journalisation pour les suppressions d'items
function logItemRemoval(sourceId, itemName, count, itemType)
    local sourceName = GetPlayerName(sourceId) or "Inconnu"
    local sourceIdentifier = GetPlayerIdentifiers(sourceId)[1] or "Inconnu"
    
    print(string.format("[ITEM_REMOVAL] %s (%s) a supprimé %s x%s - Type: %s",
        sourceName, sourceIdentifier, itemName, count, itemType))
    
    -- On pourrait aussi enregistrer dans une base de données ou un fichier
    -- MySQL.Async.execute('INSERT INTO item_removals (source_id, item_name, count, item_type, timestamp) VALUES (@source, @item, @count, @type, @time)', {
    --     ['@source'] = sourceIdentifier,
    --     ['@item'] = itemName,
    --     ['@count'] = count,
    --     ['@type'] = itemType,
    --     ['@time'] = os.time()
    -- })
end

-- Variables globales pour le verrouillage
transferInProgress = false
removeInProgress = false




RegisterNetEvent('Malette')
AddEventHandler('Malette', function(type)
	local xPlayer = GetPlayerFromId(source)
	local defaultMaxWeight = ESX.GetConfig().MaxWeight
	if type == 1 then
		xPlayer.setMaxWeight(defaultMaxWeight + 2000)
		showNotification(xPlayer, "~r~Informations~s~\nVous avez maintenant une capacité en plus de : "..(math.floor(2000/1000)).."KG")
	elseif type == 2 then
		xPlayer.setMaxWeight(defaultMaxWeight + 3000)
		showNotification(xPlayer, "~r~Informations~s~\nVous avez maintenant une capacité en plus de : "..(math.floor(3000/1000)).."KG")
	elseif type == 3 then
		xPlayer.setMaxWeight(defaultMaxWeight)
	end
end)


