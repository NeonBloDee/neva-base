RegisterNetEvent('sunny:properties:job:addPropertiesForPlayer', function(target, price, propertiesID, paidType, time)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    local society = Society:getSociety(xPlayer.job.name)

    if not society then return end

    local price = tonumber(price)

    if targetPlayer.getAccount(paidType).money < price then TriggerClientEvent('esx:showNotification', source, '💲 La personne ne possède pas les fonds nécessaires !') TriggerClientEvent('esx:showNotification', target, '💲 Vous ne possedez pas les fonds nécessaires !') return end

    targetPlayer.removeAccountMoney(paidType, price)
    society.addSocietyMoney(price)

    MySQL.Async.execute('UPDATE properties SET propertiesOWNER = @p, ownerName = @n, time = @time WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = propertiesID,
        ['@p'] = targetPlayer.UniqueID,
        ['@n'] = targetPlayer.name,
        ['@time'] = time
    }, function(rowsChanged)
        if rowsChanged == 0 then
            return TriggerClientEvent('esx:showNotification', source, 'Erreur lors de la mise à jour de la propriété')
        end

        Properties.PropertiesList[propertiesID].owner = tostring(targetPlayer.UniqueID)
        Properties.PropertiesList[propertiesID].ownerName = targetPlayer.name
        Properties.PropertiesList[propertiesID].time = time

        TriggerClientEvent('sunny:properties:updateOwner', -1, propertiesID, Properties.PropertiesList[propertiesID].owner, Properties.PropertiesList[propertiesID].ownerName)

        TriggerClientEvent('esx:showNotification', source, ('Propriété attribuée à %s'):format(targetPlayer.name))
        TriggerClientEvent('esx:showNotification', target, ('💲 Vous avez été prélevé de ~y~%s$~s~'):format(price))
    end)
end)

RegisterNetEvent('sunny:properties:delete', function(propertiesID)
    local source = source
    if not Properties.PropertiesList[propertiesID] then
        return TriggerClientEvent('esx:showNotification', source, 'Propriété invalide')
    end

    MySQL.Async.execute('DELETE FROM properties WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = propertiesID
    }, function(rowsChanged)
        if rowsChanged > 0 then
            Properties.PropertiesList[propertiesID] = nil
            TriggerClientEvent('sunny:properties:delete', -1, propertiesID)
            TriggerClientEvent('esx:showNotification', source, 'Propriété supprimée avec succès')
        end
    end)
end)

RegisterNetEvent('sunny:properties:moneyBoss', function(society, amount, action)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    
    local society = Society:getSociety(xPlayer.job.name)
    if not society then return end

    amount = tonumber(amount)
    if not amount or amount <= 0 then
        return TriggerClientEvent('esx:showNotification', source, 'Montant invalide')
    end

    if action == 'deposit' then
        if xPlayer.getAccount('bank').money < amount then 
            return TriggerClientEvent('esx:showNotification', source, 'Solde insuffisant') 
        end

        society.addSocietyMoney(amount)
        xPlayer.removeAccountMoney('bank', amount)
        
        TriggerEvent('sunny:properties:refreshSocietyMoney', xPlayer.job.name)
    elseif action == 'remove' then    
        local societyAccount = society.getSocietyMoney()
        if societyAccount < amount then
            return TriggerClientEvent('esx:showNotification', source, 'Fonds insuffisants dans la société')
        end

        society.removeSocietyMoney(amount)
        xPlayer.addAccountMoney('bank', amount)
        
        TriggerEvent('sunny:properties:refreshSocietyMoney', xPlayer.job.name)
    end
end)

RegisterNetEvent('sunny:properties:refreshSocietyMoney', function(jobName)
    local society = Society:getSociety(jobName)
    if not society then return end

    local money = society.getSocietyMoney()
    TriggerClientEvent('sunny:properties:updateSocietyMoney', -1, jobName, money)
end)

RegisterNetEvent('sunny:properties:disouLogement', function(propertiesID)
    local source = source
    MySQL.Async.execute('UPDATE properties SET propertiesOWNER = @propertiesOWNER, ownerName = @ownerName WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = propertiesID,
        ['@propertiesOWNER'] = 'none',
        ['@ownerName'] = 'none'
    }, function()
        TriggerClientEvent('esx:showNotification', source, ('Le logement de la propriétée ~y~#%s~s~ a était dissous avec succès'):format(propertiesID))

        TriggerClientEvent('esx:showNotification', source, ('Le joueur %s | Le logement de la propriétée ~y~#%s~s~ a était dissous avec succès'):format(GetPlayerName(source), propertiesID))
    end)
end)

RegisterNetEvent('sunny:properties:visitMod', function(player2, pos)
    local source = source
    local coords = nil
    if pos == 1 then
        coords = vector3(151.45,-1007.57,-98.9999)
    elseif pos == 2 then
        coords = vector3(265.307,-1002.802,-101.008)
    elseif pos == 3 then
        coords = vector3(-612.16,59.06,97.2)
    elseif pos == 4 then
        coords = vector3(-785.13,315.79,187.91)
    elseif pos == 5 then
        coords = vector3(-1459.17,-520.58,54.929)
    elseif pos == 6 then
        coords = vector3(-680.6088,590.5321,145.39)
    elseif pos == 7 then
        coords = vector3(1026.5056,-3099.8320,-38.9998)
    elseif pos == 8 then
        coords = vector3(1048.5067,-3097.0817,-38.9999)
    elseif pos == 9 then
        coords = vector3(1088.1834, -3099.3547, -38.9999)
    elseif pos == 0 or pos == nil then
        coords = vector3(151.45, 1007.57, 98.9999)
    end

    TriggerClientEvent('sunny:properties:visitMod', source, coords)
    TriggerClientEvent('sunny:properties:visitMod', player2, coords)
end)

RegisterNetEvent('sunny:properties:stopVisit', function(player2)
    TriggerClientEvent('sunny:properties:stopvisit', player2)
end)

RegisterNetEvent('sunny:properties:edit', function(propertyData)
    if not Properties.PropertiesList[propertyData.id] then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    Properties.PropertiesList[propertyData.id] = propertyData

    MySQL.Async.execute('UPDATE properties SET name = @name, label = @label WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = propertyData.id,
        ['@name'] = propertyData.name,
        ['@label'] = propertyData.label,
    })

    TriggerClientEvent('esx:showNotification', source, 'Propriété modifié avec succès')
end)