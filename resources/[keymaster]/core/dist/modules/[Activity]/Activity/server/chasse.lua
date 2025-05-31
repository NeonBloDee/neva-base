_CHASSE = {
    inChasse = false,

    levels = {},

    myAnimals = {},
    myAnimalsSpawn = {},
    animals = {},

    value = 'noanimal',
}

function _CHASSE.SaveLevel(UniqueID)
    MySQL.Async.execute('UPDATE chasse SET levels = @levels, animals = @animals WHERE uniqueid = @uniqueid', {
        ['@uniqueid'] = UniqueID,
        ['@levels'] = _CHASSE.levels[UniqueID],
        ['@animals'] = json.encode(_CHASSE.myAnimals[UniqueID])
    }, function()
    end)
end

function _CHASSE.GetNewLevel(level, UniqueID)
    if level < 100 then _CHASSE.myAnimals[UniqueID] = {'Lapin'} elseif level < 200 then _CHASSE.myAnimals[UniqueID] = SunnyConfigServ.Activity.Chasse.Levels[100] elseif level < 300 then _CHASSE.myAnimals[UniqueID] = SunnyConfigServ.Activity.Chasse.Levels[200] elseif level < 400 then _CHASSE.myAnimals[UniqueID] = SunnyConfigServ.Activity.Chasse.Levels[300] elseif level < 700 then _CHASSE.myAnimals[UniqueID] = SunnyConfigServ.Activity.Chasse.Levels[400] end

    if SunnyConfigServ.Activity.Chasse.Levels[_CHASSE.levels[UniqueID]] ~= nil then
        _CHASSE.value = 'newAnimal'
    end

    return _CHASSE
end

RegisterNetEvent('sunny:chasse:start', function()
   local source = source
   local xPlayer = ESX.GetPlayerFromId(source)

   _CHASSE.inChasse = true

   
   MySQL.Async.fetchAll('SELECT * FROM chasse WHERE uniqueid = @uniqueid', {
    ['@uniqueid'] = xPlayer.UniqueID
   }, function(result)
        if result[1] == nil then 
            _CHASSE.levels[xPlayer.UniqueID] = 0
            _CHASSE.myAnimals[xPlayer.UniqueID] = {'Lapin'}
            MySQL.Async.execute('INSERT INTO chasse (uniqueid, levels, animals) VALUE (@uniqueid, @levels, @animals)', {
                ['@uniqueid'] = xPlayer.UniqueID,
                ['@levels'] = _CHASSE.levels[xPlayer.UniqueID],
                ['@animals'] = json.encode({'Lapin'})
            })
        else
            _CHASSE.levels[xPlayer.UniqueID] = tonumber(result[1].levels)
            _CHASSE.myAnimals[xPlayer.UniqueID] = json.decode(result[1].animals)
        end

        TriggerClientEvent('sunny:chasse:startChasse', source, _CHASSE.inChasse, _CHASSE.levels[xPlayer.UniqueID], _CHASSE.myAnimals[xPlayer.UniqueID])
        sendLog(("Le joueurs (%s - %s) viens de commencer la chasse"):format(xPlayer.name, xPlayer.UniqueID), {
            author = xPlayer.name,
            fields = {
                {title = 'Joueur', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'start_chasse'
        })
    end)
   
    xPlayer.addInventoryItem(string.lower("musket"), 1)
    xPlayer.addInventoryItem(string.lower("shotgun_ammo"), 40)

end)

RegisterNetEvent('sunny:chasse:stop', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeWeapon('weapon_musket')

    _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
    sendLog(("Le joueurs (%s - %s) viens de stopper la chasse"):format(xPlayer.name, xPlayer.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'stop_chasse'
    })

    local musketCount = xPlayer.getInventoryItem(string.lower("musket")).count
    if musketCount > 0 then
        xPlayer.removeInventoryItem(string.lower("musket"), musketCount)
    end

    local ammoCount = xPlayer.getInventoryItem(string.lower("shotgun_ammo")).count
    if ammoCount > 0 then
        xPlayer.removeInventoryItem(string.lower("shotgun_ammo"), ammoCount)
    end

end)

RegisterNetEvent('sunny:chasse:forceStopChasse', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    _CHASSE.levels[xPlayer.UniqueID] -= 50

    _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
end)

RegisterNetEvent('sunny:chasse:playerDropped')
AddEventHandler('sunny:chasse:playerDropped', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if xPlayer then
        if _CHASSE.inChasse then
            xPlayer.removeInventoryItem('musket', 1)

            print(('[CHASSE] Le joueur %s s\'est déconnecté pendant la chasse, son équipement a été retiré.'):format(GetPlayerName(playerId)))


        end
    else
        print(('[CHASSE] Impossible de retirer l\'équipement : le joueur %s est déjà déconnecté.'):format(playerId))
    end
end)

AddEventHandler('playerDropped', function(reason)
    local playerId = source
    TriggerEvent('sunny:chasse:playerDropped', playerId)
end)


RegisterNetEvent('sunny:chasse:take', function(model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in pairs(SunnyConfigServ.Activity.Chasse.AuthorizedAnimals) do
        if _CHASSE.levels[xPlayer.UniqueID] < 0 then
            if v.hash == model and v.requirededlevel < tonumber(_CHASSE.levels[xPlayer.UniqueID]) then
                _CHASSE.levels[xPlayer.UniqueID] -= 10
    
                _CHASSE.myAnimals[xPlayer.UniqueID] = _CHASSE.GetNewLevel(_CHASSE.levels[xPlayer.UniqueID], tonumber((xPlayer.UniqueID))).myAnimals[xPlayer.UniqueID]
    
                _CHASSE.myAnimals[xPlayer.UniqueID] = SunnyConfigServ.Activity.Chasse.Levels[_CHASSE.levels[xPlayer.UniqueID]] or _CHASSE.myAnimals[xPlayer.UniqueID]
                _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
                TriggerClientEvent('sunny:chasse:updateLevel', source, _CHASSE.levels[xPlayer.UniqueID], _CHASSE.myAnimals[xPlayer.UniqueID], _CHASSE.GetNewLevel(_CHASSE.levels[xPlayer.UniqueID], tonumber((xPlayer.UniqueID))).value)
                _CHASSE.value = 'noanimal'
                TriggerClientEvent('esx:showNotification', source, 'Tu ne peux pas chasser de type d\'animal pour le moment, 10 point on été retirer de ton expérience')
                return
            end
        else
            if v.hash == model and v.requirededlevel > tonumber(_CHASSE.levels[xPlayer.UniqueID]) then
                _CHASSE.levels[xPlayer.UniqueID] -= 10
    
                _CHASSE.myAnimals[xPlayer.UniqueID] = _CHASSE.GetNewLevel(_CHASSE.levels[xPlayer.UniqueID], tonumber((xPlayer.UniqueID))).myAnimals[xPlayer.UniqueID]
    
                _CHASSE.myAnimals[xPlayer.UniqueID] = SunnyConfigServ.Activity.Chasse.Levels[_CHASSE.levels[xPlayer.UniqueID]] or _CHASSE.myAnimals[xPlayer.UniqueID]
                _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
                TriggerClientEvent('sunny:chasse:updateLevel', source, _CHASSE.levels[xPlayer.UniqueID], _CHASSE.myAnimals[xPlayer.UniqueID], _CHASSE.GetNewLevel(_CHASSE.levels[xPlayer.UniqueID], tonumber((xPlayer.UniqueID))).value)
                _CHASSE.value = 'noanimal'
                TriggerClientEvent('esx:showNotification', source, 'Tu ne peux pas chasser de type d\'animal pour le moment, 10 point on été retirer de ton expérience')
                return
            end
        end
    end
    local VxPlayer = ESX.GetPlayerFromId(source)
    if not VxPlayer.canCarryItem('cerf', 1) then 
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire")
        return
    end
    xPlayer.addInventoryItem(SunnyConfigServ.Activity.Chasse.Levels2[model] or 'cerf', 1)
    _CHASSE.levels[xPlayer.UniqueID] += 10
    _CHASSE.myAnimals[xPlayer.UniqueID] = SunnyConfigServ.Activity.Chasse.Levels[_CHASSE.levels[xPlayer.UniqueID]] or _CHASSE.myAnimals[xPlayer.UniqueID]
    _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
    TriggerClientEvent('sunny:chasse:updateLevel', source, _CHASSE.levels[xPlayer.UniqueID], _CHASSE.myAnimals[xPlayer.UniqueID], _CHASSE.GetNewLevel(_CHASSE.levels[xPlayer.UniqueID], tonumber((xPlayer.UniqueID))).value)
    _CHASSE.value = 'noanimal'
    TriggerClientEvent('esx:showNotification', source, '🥩 Vous avez dépecer ~y~x1~s~ gibier')
    sendLog(("Le joueurs (%s - %s) viens de dépecer (x1 - Gibier)"):format(xPlayer.name, xPlayer.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'reco_chasse'
    })
    SetTimeout(2000, function()
        if _CHASSE.levels[xPlayer.UniqueID] >= 1000 then
            _CHASSE.myAnimals[xPlayer.UniqueID] = {'Lapin'}
            xPlayer.addAccountMoney('cash', 10000)
            TriggerClientEvent('esx:showNotification', source, '🥇 Félicitations, vous avez atteint le level 1000/1000 une prime de ~y~10 000$~s~ vous a été déversé et votre level a été réinitialisé !')
            _CHASSE.levels[xPlayer.UniqueID] = 0
            TriggerClientEvent('sunny:chasse:updateLevel', source, _CHASSE.levels[xPlayer.UniqueID], _CHASSE.myAnimals[xPlayer.UniqueID], 'newAnimal')

            _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
        end
    end)
end)

RegisterNetEvent('sunny:chasse:sell', function(item, label, price, quantity)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        if xPlayer.getInventoryItem(item).count < quantity then return TriggerClientEvent('esx:showNotification', source, 'Vous ne disposez assez de viande pour faire cela !') end

        xPlayer.removeInventoryItem(item, quantity)

        local total = 0
        for i=1, quantity do 
            local expectedAmount = 200
            if price > expectedAmount then
                DropPlayer(source, "Trigger Chasse...")
            end
                xPlayer.addAccountMoney('cash', price)


            total += price/100*133
        end

        TriggerClientEvent('esx:showNotification', source, ('Vous avez vendue ~y~x%s~s~ %s pour ~y~%s$~s~'):format(quantity, label, total))
        sendLog(('Le Player (%s - %s) a vendue (%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, quantity, item), {
			author = 'Vente Chasse',
			fields = {
				{title = 'Player', subtitle = xPlayer.name},
				{title = 'ID Unique', subtitle = xPlayer.UniqueID},
				{title = 'Identifier', subtitle = xPlayer.identifier},
				{title = "Gain", subtitle = total},
			},
			channel = 'vente_chasse'
		})
    end
end)