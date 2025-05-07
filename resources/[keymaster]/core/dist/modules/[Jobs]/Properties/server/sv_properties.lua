Properties = Properties or {} -- Ensure Properties table exists
Properties.PropertiesList = Properties.PropertiesList or {}
Properties.Loaded = Properties.Loaded or false
Properties.garage = Properties.garage or { count2 = {} } -- Ensure nested tables for garage are initialized

-- Helper function to safely decode JSON
local function safeJsonDecode(jsonString, default)
    if jsonString == nil or jsonString == '' or jsonString == 'none' then
        return default
    end
    local success, result = pcall(json.decode, jsonString)
    if success then
        return result
    else
        print(("[PropertiesServer] WARNING: Failed to decode JSON string: %s. Error: %s"):format(jsonString, tostring(result))) -- result is error message on pcall fail
        return default
    end
end

function Properties:Load()
    MySQL.Async.fetchAll('SELECT * FROM properties', {}, function(p)
        local tempPropertiesList = {}
        local pcount = 0

        for k,v in pairs(p) do
            local propertyData = {
                id = v.propertiesID,
                owner = v.propertiesOWNER,
                ownerName = v.ownerName,
                name = v.name,
                label = v.label,
                price = v.price,
                enter = safeJsonDecode(v.enter, {x=0.0,y=0.0,z=0.0}),
                exit = safeJsonDecode(v.exit, {x=0.0,y=0.0,z=0.0}),
                street_name = v.street,
                trunkPos = safeJsonDecode(v.trunkPos, {x=0.0,y=0.0,z=0.0}),
                garage = v.garage,
                garagePos = safeJsonDecode(v.garagePos, {x=0.0,y=0.0,z=0.0}),
                garageSpawn = safeJsonDecode(v.garageSpawn, {x=0.0,y=0.0,z=0.0}),
                garageRotation = v.garageRotation,
                garageType = v.garageType,
                players = safeJsonDecode(v.players, {}), -- Stores who is allowed/in
                type = v.type,
                logementType = v.logementType,
                open = false, -- Runtime state, not from DB typically
                playersIG = {}, -- Runtime state: list of players physically inside
                coffreOpen = false, -- Runtime state
                interphone = {}, -- Runtime state
                entrepot = v.entrepot,
                pound = v.pound,
                time = v.time -- Assuming 'time' column exists for rentals
            }

            local trunkData = safeJsonDecode(v.trunk, nil)
            if trunkData == nil or type(trunkData) ~= 'table' then
                propertyData.trunk = {
                    ['items'] = {},
                    ['weapons'] = {},
                    ['accounts'] = { cash = 0, black_money = 0 },
                    ['code'] = { active = false, blocked = false, code = nil }
                }
            else
                -- Ensure all sub-tables exist in decoded trunk data
                trunkData.items = trunkData.items or {}
                trunkData.weapons = trunkData.weapons or {}
                trunkData.accounts = trunkData.accounts or { cash = 0, black_money = 0 }
                if type(trunkData.accounts.cash) ~= 'number' then trunkData.accounts.cash = 0 end
                if type(trunkData.accounts.black_money) ~= 'number' then trunkData.accounts.black_money = 0 end
                trunkData.code = trunkData.code or { active = false, blocked = false, code = nil }
                if type(trunkData.code.active) == 'nil' then trunkData.code.active = false end -- handle nil specifically if it can occur
                if type(trunkData.code.blocked) == 'nil' then trunkData.code.blocked = false end
                propertyData.trunk = trunkData
            end
            
            tempPropertiesList[v.propertiesID] = propertyData
            pcount = pcount + 1
        end
        
        Properties.PropertiesList = tempPropertiesList -- Replace the old list
        Properties.Loaded = true
        print(("[PropertiesServer] Properties loaded successfully. Count: %s"):format(pcount))
        
        -- Inform all clients that properties have been (re)loaded
        TriggerClientEvent('sunny:properties:load', -1, Properties.PropertiesList)
    end)
end

function Properties:addPlayer(i,p)
    SetPlayerRoutingBucket(i,p)
end

function Properties:updatePlayers(u,p,v)
    Properties.PropertiesList[p].players[tostring(u)] = v

    local player = ReturnPlayerId(p)

    if player then
        TriggerClientEvent('sunny:properties:updatePlayers', -1, p, Properties.PropertiesList[p].players)
    end
end

function Properties:DbPlayerSync(p)
    MySQL.Async.execute('UPDATE properties SET players = @players WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = p,
        ['@players'] = json.encode(Properties.PropertiesList[p].players)
    })
end

CreateThread(function()
    Wait(2000) -- Give a bit more time for ESX and MySQL to be ready
    Properties:Load()
end)

RegisterNetEvent('sunny:properties:load', function()
    local source = source
    if Properties.Loaded then
        TriggerClientEvent('sunny:properties:load', source, Properties.PropertiesList)
    else
        -- Queue or delay if not loaded yet, or force a load for this player
        print(("[PropertiesServer] WARNING: Player %s requested properties before initial load was complete. Sending current (possibly empty) list."):format(source))
        TriggerClientEvent('sunny:properties:load', source, Properties.PropertiesList) 
        -- Consider deferring the TriggerClientEvent until Properties.Loaded is true, or re-triggering Properties:Load()
    end
end)

RegisterServerEvent('Achat:Maison')
AddEventHandler('Achat:Maison', function(Infos)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)

    if not xPlayer then 
        print(("[PropertiesServer] ERROR: xPlayer not found for source %s in Achat:Maison"):format(_src))
        return 
    end

    if not Infos or not Infos.id or not Infos.price then
        TriggerClientEvent('esx:showNotification', _src, '~r~Erreur: Informations de propriété invalides.')
        print(("[PropertiesServer] ERROR: Invalid Infos for Achat:Maison. Data: %s"):format(json.encode(Infos)))
        return
    end
    
    local IdMaison = Infos.id    
    local PrixMaison = tonumber(Infos.price)

    if not PrixMaison or PrixMaison <= 0 then
        TriggerClientEvent('esx:showNotification', _src, '~r~Erreur: Prix de la maison invalide.')
        return
    end

    if xPlayer.getMoney() >= PrixMaison then
        xPlayer.removeAccountMoney('cash', PrixMaison) -- ESX standard is removeAccountMoney for cash

        MySQL.Async.execute('UPDATE properties SET propertiesOWNER = @propertiesOwner, ownerName = @ownerName WHERE propertiesID = @propertiesID', {
            ['@propertiesOwner'] = xPlayer.UniqueID,
            ['@ownerName'] = xPlayer.getName(), -- Store player's character name
            ['@propertiesID'] = IdMaison
        }, function(affectedRows)
            if affectedRows > 0 then
                TriggerClientEvent('esx:showNotification', _src, 'Vous avez acheté la maison avec succès !')
        
                -- Update server-side list first
                if Properties.PropertiesList[IdMaison] then
                    Properties.PropertiesList[IdMaison].owner = xPlayer.UniqueID
                    Properties.PropertiesList[IdMaison].ownerName = xPlayer.getName()
                    Properties.PropertiesList[IdMaison].players = {} -- Reset players inside on purchase
                    Properties.PropertiesList[IdMaison].open = false -- Default to closed
                    Properties.PropertiesList[IdMaison].coffreOpen = false

                     -- Update all clients with the changed property
                    TriggerClientEvent('sunny:properties:updateProperties', -1, IdMaison, Properties.PropertiesList[IdMaison])
                    Properties:DbPlayerSync(IdMaison) -- Save updated players list (empty) to DB
                else
                    -- If not in list, reload it (should not happen if loaded correctly)
                    Properties:Load() 
                end
            else
                TriggerClientEvent('esx:showNotification', _src, '~r~Une erreur est survenue lors de l\'achat de la maison (DB).')
                xPlayer.addAccountMoney('cash', PrixMaison) -- Refund if DB update failed
            end
        end)
    else
        TriggerClientEvent('esx:showNotification', _src, 'Vous n\'avez pas assez d\'argent pour acheter cette maison.')
    end
end)

RegisterNetEvent('sunny:properties:createProperties', function(name, label, price, enter, exit, garage, posGarage, posGarageSpawn, rotGarageSpawn, garageType, typeData, trunkPos, logementType, current_zone, entrepot, pound)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer or not xPlayer.job or not xPlayer.job.name then
        print("[PropertiesServer] ERROR: xPlayer or job not found for createProperties.")
        return
    end

    local society = Society:getSociety(xPlayer.job.name)
    if not society then 
        TriggerClientEvent('esx:showNotification', source, "~r~Erreur: Société non trouvée.")
        return 
    end

    local garageVal = (garage == true or garage == 1) and 1 or 0
    local posGarageVal = garageVal == 1 and json.encode(posGarage) or '[]'
    local posGarageSpawnVal = garageVal == 1 and json.encode(posGarageSpawn) or '[]'
    local rotGarageSpawnVal = garageVal == 1 and rotGarageSpawn or 0.0
    local garageTypeVal = garageVal == 1 and garageType or 'none'

    local entrepotVal = (entrepot == true or entrepot == 1) and 1 or 0
    local poundVal = entrepotVal == 1 and tonumber(pound) or 0

    local propertyPrice = tonumber(price)
    if not propertyPrice or propertyPrice <= 0 then
        TriggerClientEvent('esx:showNotification', source, "~r~Erreur: Prix invalide pour la propriété.")
        return
    end
    
    -- Ensure all coordinate objects are valid or default
    enter = enter and json.encode(enter) or '{"x":0.0,"y":0.0,"z":0.0}'
    exit = exit and json.encode(exit) or '{"x":0.0,"y":0.0,"z":0.0}'
    trunkPos = trunkPos and json.encode(trunkPos) or '{"x":0.0,"y":0.0,"z":0.0}'


    MySQL.Async.execute('INSERT INTO properties (propertiesOWNER, ownerName, name, label, price, enter, `exit`, garage, garagePos, garageSpawn, garageRotation, garageType, players, type, `trunkPos`, logementType, street, entrepot, pound, trunk) VALUES (@propertiesOWNER, @ownerName, @name, @label, @price, @enter, @exit, @garage, @garagePos, @garageSpawn, @garageRotation, @garageType, @players, @type, @trunkPos, @logementType, @street, @entrepot, @pound, @trunk)', {
        ['@propertiesOWNER'] = 'none', 
        ['@ownerName'] = 'none',
        ['@name'] = name, 
        ['@label'] = label, 
        ['@price'] = propertyPrice, 
        ['@enter'] = enter, 
        ['@exit'] = exit, 
        ['@garage'] = garageVal, 
        ['@garagePos'] = posGarageVal, 
        ['@garageSpawn'] = posGarageSpawnVal, 
        ['@garageRotation'] = rotGarageSpawnVal, 
        ['@garageType'] = garageTypeVal,
        ['@players'] = '{}', -- Empty JSON object for players
        ['@type'] = typeData,
        ['@trunkPos'] = trunkPos,
        ['@logementType'] = logementType,
        ['@street'] = current_zone or 'N/A',
        ['@entrepot'] = entrepotVal,
        ['@pound'] = poundVal,
        ['@trunk'] = json.encode({ -- Default empty trunk structure
            items = {}, weapons = {}, accounts = {cash = 0, black_money = 0},
            code = {active = false, blocked = false, code = nil}
        })
    }, function(affectedRows)
        if affectedRows > 0 then
            local costToSociety = propertyPrice / 100 * 75
            society.removeSocietyMoney(costToSociety) -- Assuming this function exists and handles society money

            -- Fetch the newly created property to get its ID
            MySQL.Async.fetchAll('SELECT * FROM properties WHERE name = @name AND label = @label ORDER BY propertiesID DESC LIMIT 1', {
                ['@name'] = name,
                ['@label'] = label
            }, function(result)
                if result and result[1] then
                    local newProp = result[1]
                    local newPropData = {
                        id = newProp.propertiesID,
                        owner = 'none',
                        ownerName = 'none',
                        name = newProp.name,
                        label = newProp.label,
                        price = newProp.price,
                        enter = safeJsonDecode(newProp.enter, {x=0.0,y=0.0,z=0.0}),
                        exit = safeJsonDecode(newProp.exit, {x=0.0,y=0.0,z=0.0}),
                        street_name = newProp.street,
                        trunkPos = safeJsonDecode(newProp.trunkPos, {x=0.0,y=0.0,z=0.0}),
                        garage = newProp.garage,
                        garagePos = safeJsonDecode(newProp.garagePos, {x=0.0,y=0.0,z=0.0}),
                        garageSpawn = safeJsonDecode(newProp.garageSpawn, {x=0.0,y=0.0,z=0.0}),
                        garageRotation = newProp.garageRotation,
                        garageType = newProp.garageType,
                        players = safeJsonDecode(newProp.players, {}),
                        type = newProp.type,
                        logementType = newProp.logementType,
                        trunk = safeJsonDecode(newProp.trunk, {items = {}, weapons = {}, accounts = {cash = 0, black_money = 0}, code = {active = false, blocked = false, code = nil}}),
                        entrepot = newProp.entrepot,
                        pound = newProp.pound,
                        open = false, playersIG = {}, coffreOpen = false, interphone = {}
                    }
                    Properties.PropertiesList[newProp.propertiesID] = newPropData
                    TriggerClientEvent('esx:showNotification', source, ('La propriétée %s a été créée avec succès'):format(name))
                    TriggerClientEvent('sunny:properties:add', -1, newProp.propertiesID, newPropData)
                else
                    TriggerClientEvent('esx:showNotification', source, "~r~Erreur lors de la récupération de la propriété créée.")
                end
            end)
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Erreur lors de la création de la propriété en base de données.")
        end
    end)
end)

RegisterNetEvent('sunny:properties:addPlayer', function(target, value, pId, playersClientState)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    if not Properties.PropertiesList[pId] then 
        TriggerClientEvent('esx:showNotification', source, "~r~Cette propriété n'existe plus.")
        return 
    end

    if value == 'me' then
        Properties:addPlayer(source, pId) -- Set routing bucket
        TriggerClientEvent('sunny:properties:teleport', source, Properties.PropertiesList[pId].exit) -- Use the vector3 directly

        -- Update server-side state for this player
        Properties.PropertiesList[pId].players[tostring(xPlayer.UniqueID)] = true
        
        -- Add to playersIG (runtime list of who is physically inside)
        Properties.PropertiesList[pId].playersIG = Properties.PropertiesList[pId].playersIG or {}
        Properties.PropertiesList[pId].playersIG[source] = { source = source, UniqueID = xPlayer.UniqueID }

        -- Notify the acting client about their state change
        TriggerClientEvent('sunny:properties:changePlayerSate', source, pId, true)
    end
    
    -- Persist the 'players' state (who is allowed/marked as in)
    Properties:DbPlayerSync(pId)
    -- Notify ALL clients about the updated 'players' list for this property
    TriggerClientEvent('sunny:properties:updatePlayers', -1, pId, Properties.PropertiesList[pId].players)
end)

RegisterNetEvent('sunny:properties:removePlayer', function(target, value, pId, playersClientState)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    if not Properties.PropertiesList[pId] then 
        TriggerClientEvent('esx:showNotification', source, "~r~Cette propriété n'existe plus.")
        return 
    end

    if value == 'me' then
        Properties:addPlayer(source, 0) -- Clear routing bucket
        TriggerClientEvent('sunny:properties:teleport', source, Properties.PropertiesList[pId].enter) -- Use the vector3 directly

        Properties.PropertiesList[pId].players[tostring(xPlayer.UniqueID)] = false -- Or remove key: nil
        if Properties.PropertiesList[pId].playersIG and Properties.PropertiesList[pId].playersIG[source] then
            Properties.PropertiesList[pId].playersIG[source] = nil
        end
        TriggerClientEvent('sunny:properties:changePlayerSate', source, pId, false)

    elseif value == 'all' then
        if Properties.PropertiesList[pId].playersIG then
            for playerSrc, playerData in pairs(Properties.PropertiesList[pId].playersIG) do
                local targetPlayer = ESX.GetPlayerFromId(playerSrc)
                if targetPlayer then
                    Properties:addPlayer(playerSrc, 0)
                    TriggerClientEvent('sunny:properties:teleport', playerSrc, Properties.PropertiesList[pId].enter)
                    Properties.PropertiesList[pId].players[tostring(targetPlayer.UniqueID)] = false -- Or nil
                    TriggerClientEvent('sunny:properties:changePlayerSate', playerSrc, pId, false)
                end
            end
            Properties.PropertiesList[pId].playersIG = {} -- Clear the runtime list
            -- For 'all', we might want to clear the entire 'players' table or just those who were in playersIG
            -- For now, assuming 'players' reflects permissions/saved states, and 'all' just kicks out current occupants.
            -- If 'all' means reset all permissions, then Properties.PropertiesList[pId].players = {}
        end
    end

    Properties:DbPlayerSync(pId)
    TriggerClientEvent('sunny:properties:updatePlayers', -1, pId, Properties.PropertiesList[pId].players)
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    -- local xPlayer = ESX.GetPlayerFromId(playerId) -- xPlayer is already passed as second arg in newer ESX
    if xPlayer and xPlayer.UniqueID then
        Properties.garage = Properties.garage or {} -- Ensure garage table exists
        Properties.garage.count2 = Properties.garage.count2 or {} -- Ensure count2 table exists
        Properties.garage.count2[xPlayer.UniqueID] = 0
    else
        print(("[PropertiesServer] WARNING: xPlayer or UniqueID not found for esx:playerLoaded. Source/PlayerID: %s"):format(tostring(playerId)))
    end
    -- No need for Wait(5000) here, this event is for when player is loaded.
    -- Requesting properties for this specific client can be done here too, if 'sunny:properties:load' on client isn't sufficient
    -- TriggerClientEvent('sunny:properties:load', playerId, Properties.PropertiesList)
end)

-- Ensure player data is cleaned up on disconnect
AddEventHandler('esx:playerDropped', function(playerId, reason)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if not xPlayer then return end

    local playerUniqueId = tostring(xPlayer.UniqueID)

    for propId, propData in pairs(Properties.PropertiesList) do
        if propData.players and propData.players[playerUniqueId] then
            propData.players[playerUniqueId] = nil -- Remove from permission/state list
            Properties:DbPlayerSync(propId)
            TriggerClientEvent('sunny:properties:updatePlayers', -1, propId, propData.players)
        end
        if propData.playersIG and propData.playersIG[playerId] then
            propData.playersIG[playerId] = nil -- Remove from runtime 'inside' list
        end
    end
    if Properties.garage and Properties.garage.count2 and Properties.garage.count2[playerUniqueId] then
        Properties.garage.count2[playerUniqueId] = nil
    end
    print(("[PropertiesServer] Cleaned up property data for disconnected player %s (UniqueID: %s)"):format(playerId, playerUniqueId))
end)


RegisterNetEvent('sunny:properties:locked', function(k, statut)
    if Properties.PropertiesList[k] then
        Properties.PropertiesList[k].open = statut
        TriggerClientEvent('sunny:properties:locked', -1, k, statut)
    end
end)

RegisterNetEvent('sunny:properties:lockedCoffre', function(k, statut)
    if Properties.PropertiesList[k] then
        Properties.PropertiesList[k].coffreOpen = statut
        TriggerClientEvent('sunny:properties:lockedCoffre', -1, k, statut)
    end
end)

RegisterNetEvent('sunny:properties:sell', function(propertiesID)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    if not Properties.PropertiesList[propertiesID] then
        TriggerClientEvent('esx:showNotification', source, "~r~Cette propriété n'existe pas.")
        return
    end
    
    local propertyToSell = Properties.PropertiesList[propertiesID]
    if propertyToSell.owner ~= xPlayer.UniqueID then
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'êtes pas le propriétaire de cette maison.")
        return
    end

    MySQL.Async.execute('UPDATE properties SET propertiesOWNER = @owner, ownerName = @ownerName, players = @players WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = propertiesID,
        ['@owner'] = 'none',
        ['@ownerName'] = 'none',
        ['@players'] = '{}' -- Reset players list to empty JSON object
    }, function(affectedRows)
        if affectedRows > 0 then
            -- Kick out anyone inside
            if propertyToSell.playersIG then
                for playerSrc, pData in pairs(propertyToSell.playersIG) do
                    Properties:addPlayer(playerSrc, 0) -- Clear routing bucket
                    TriggerClientEvent('sunny:properties:teleport', playerSrc, propertyToSell.enter)
                    TriggerClientEvent('sunny:properties:changePlayerSate', playerSrc, propertiesID, false)
                end
            end
            
            propertyToSell.owner = 'none'
            propertyToSell.ownerName = 'none'
            propertyToSell.players = {}
            propertyToSell.playersIG = {}
            propertyToSell.open = false
            propertyToSell.coffreOpen = false

            TriggerClientEvent('esx:showNotification', source, '🏠 Propriété vendue avec succès')
            local refundAmount = tonumber(propertyToSell.price) / 100 * 50
            xPlayer.addAccountMoney('bank', refundAmount) -- Use addAccountMoney for bank

            TriggerClientEvent('sunny:properties:updateProperties', -1, propertiesID, propertyToSell)
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Erreur lors de la vente de la propriété (DB).")
        end
    end)
end)

RegisterNetEvent('sunny:properties:interphone:call', function(propertiesDataClient, time) -- propertiesDataClient is just .id from client
    if not propertiesDataClient or not propertiesDataClient.id then return end
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local propertyId = propertiesDataClient.id
    if not Properties.PropertiesList[propertyId] then return end

    local actualPropertyData = Properties.PropertiesList[propertyId]

    actualPropertyData.interphone = actualPropertyData.interphone or {}
    actualPropertyData.interphone[xPlayer.UniqueID] = {
        UniqueID = xPlayer.UniqueID,
        name = xPlayer.name, -- ESX player name (character name)
        firstname = xPlayer.get('firstName'), -- Assuming ESX identity
        lastname = xPlayer.get('lastName'),   -- Assuming ESX identity
        playerCoords = GetEntityCoords(GetPlayerPed(source)),
        at = os.date(('%sh%sm%ss'):format('%H', '%M', '%S')), -- More precise time
    }

    -- Notify players inside the property or the owner
    local ownerPlayer = nil
    if actualPropertyData.owner ~= 'none' then
        ownerPlayer = ESX.GetPlayerFromUniqueId(actualPropertyData.owner)
    end

    local notifiedSomeone = false
    if actualPropertyData.playersIG then
        for playerSrc, pData in pairs(actualPropertyData.playersIG) do
            local targetPlayer = ESX.GetPlayerFromId(playerSrc)
            if targetPlayer then
                TriggerClientEvent('sunny:properties:interphone:call:requestCall', targetPlayer.source, actualPropertyData)
                notifiedSomeone = true
            end
        end
    end
    
    -- If owner is online but not inside, notify them too
    if ownerPlayer and (not actualPropertyData.playersIG or not actualPropertyData.playersIG[ownerPlayer.source]) then
         TriggerClientEvent('sunny:properties:interphone:call:requestCall', ownerPlayer.source, actualPropertyData)
         notifiedSomeone = true
    end

    if not notifiedSomeone then
        -- Potentially notify caller that no one is available, or handle silently
        -- TriggerClientEvent('esx:showNotification', source, "Personne n'est disponible pour répondre.")
    end
end)

RegisterNetEvent('sunny:properties:interphone:call:validateEnter', function(propertiesDataClient, playerData)
    local source = source -- Person inside answering
    local xPlayerAnswering = ESX.GetPlayerFromId(source)

    if not xPlayerAnswering then return end
    
    local propertyId = propertiesDataClient.id
    local property = Properties.PropertiesList[propertyId]
    if not property then return end

    -- Ensure the person answering is authorized (owner or inside)
    local isOwner = property.owner == xPlayerAnswering.UniqueID
    local isInside = property.playersIG and property.playersIG[source]
    if not isOwner and not isInside then
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'êtes pas autorisé à faire entrer des gens.")
        return
    end

    local playerToEnter = ESX.GetPlayerFromUniqueId(playerData.UniqueID)
    if not playerToEnter then 
        TriggerClientEvent('esx:showNotification', source, "~r~La personne qui a sonné n'est plus connectée.")
        return 
    end

    if property.interphone and property.interphone[playerData.UniqueID] then
        property.interphone[playerData.UniqueID] = nil -- Remove from interphone list
        TriggerClientEvent('sunny:properties:updateCallWithPlayerCall', playerToEnter.source, property) -- Notify caller their bell status might change
    end

    -- Notify all clients about interphone list update (mainly for those inside)
    TriggerClientEvent('sunny:properties:interphone:update', -1, property)

    if #(GetEntityCoords(GetPlayerPed(playerToEnter.source)) - vector3(property.enter.x, property.enter.y, property.enter.z)) > 10.0 then -- Increased range slightly
        TriggerClientEvent('esx:showNotification', source, "~r~La personne est trop éloignée de la porte d'entrée.")
        TriggerClientEvent('esx:showNotification', playerToEnter.source, "~r~Vous êtes trop éloigné de la porte d'entrée.")
        return 
    end

    -- Let the player in
    Properties:addPlayer(playerToEnter.source, propertyId) -- Set routing bucket
    TriggerClientEvent('sunny:properties:teleport', playerToEnter.source, property.exit)

    property.playersIG = property.playersIG or {}
    property.playersIG[playerToEnter.source] = { source = playerToEnter.source, UniqueID = playerToEnter.UniqueID }
    property.players[tostring(playerToEnter.UniqueID)] = true

    Properties:DbPlayerSync(propertyId)
    
    TriggerClientEvent('sunny:properties:changePlayerSate', playerToEnter.source, propertyId, true)
    TriggerClientEvent('sunny:properties:updatePlayers', -1, propertyId, property.players) -- Notify all about the new player list
end)

RegisterNetEvent('sunny:properties:interphone:call:refuseEnter', function(propertiesDataClient, playerData)
    local source = source -- Person inside answering
    local xPlayerAnswering = ESX.GetPlayerFromId(source)

    if not xPlayerAnswering then return end

    local propertyId = propertiesDataClient.id
    local property = Properties.PropertiesList[propertyId]
    if not property then return end

    local isOwner = property.owner == xPlayerAnswering.UniqueID
    local isInside = property.playersIG and property.playersIG[source]
    if not isOwner and not isInside then
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'êtes pas autorisé.")
        return
    end

    local playerRefused = ESX.GetPlayerFromUniqueId(playerData.UniqueID)
    if not playerRefused then return end -- Player already left

    if property.interphone and property.interphone[playerData.UniqueID] then
        property.interphone[playerData.UniqueID] = nil
        TriggerClientEvent('sunny:properties:updateCallWithPlayerCall', playerRefused.source, property) -- Notify caller
    end
    
    TriggerClientEvent('esx:showNotification', playerRefused.source, "~y~On vous a refusé l'entrée.")
    TriggerClientEvent('sunny:properties:interphone:update', -1, property) -- Update interphone list for clients inside
    -- No need to call sunny:propeties:updatePlayers as the list of people inside hasn't changed.
    -- The original sunny:propeties:updatePlayers was likely a typo for sunny:properties:updatePlayers
end)

-- Function to get player by UniqueID (if ESX doesn't have a direct one or for broader use)
function ReturnPlayerId(uniqueId)
    local players = ESX.GetPlayers()
    for i=1, #players do
        local xPlayer = ESX.GetPlayerFromId(players[i])
        if xPlayer and tostring(xPlayer.UniqueID) == tostring(uniqueId) then
            return xPlayer -- Returns the xPlayer object
        end
    end
    return nil
end

-- Make sure ESX is loaded before anything else
CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(0) -- Check every tick initially
    end
    print("[PropertiesServer] ESX Loaded.")
end)

-- Commented out the hourly rental logic for now, can be re-enabled and debugged separately.
-- Ensure 'time' column exists in 'properties' table and 'users' table for this to work.
--[[]
CreateThread(function()
    while true do 
        Wait(3600000) -- 1 hour
        MySQL.Async.fetchAll('SELECT * FROM properties WHERE type = @type AND propertiesOWNER <> @none', {
            ['@type'] = 'location',
            ['@none'] = 'none'
        }, function(result)
            if result then
                for k,v in pairs(result) do 
                    if tonumber(v.time) <= 0 then goto continue_rental_loop end

                    local newTime = tonumber(v.time) - 1
                    Properties.PropertiesList[v.propertiesID].time = newTime

                    if newTime > 0 then
                        MySQL.Async.execute('UPDATE properties SET time = @time WHERE propertiesID = @p', {
                            ['@p'] = v.propertiesID,
                            ['@time'] = newTime
                        }, function()
                            TriggerClientEvent('sunny:properties:updateProperties', -1, v.propertiesID, Properties.PropertiesList[v.propertiesID])
                        end)
                    else
                        -- Rental expired
                        local propertyToExpire = Properties.PropertiesList[v.propertiesID]
                        MySQL.Async.execute('UPDATE properties SET time = @time, propertiesOWNER = @o, ownerName = @on, players = @players WHERE propertiesID = @p', {
                            ['@p'] = v.propertiesID,
                            ['@time'] = 0,
                            ['@o'] = 'none',
                            ['@on'] = 'none',
                            ['@players'] = '{}'
                        }, function()
                            if propertyToExpire.playersIG then
                                for playerSrc, pData in pairs(propertyToExpire.playersIG) do
                                    Properties:addPlayer(playerSrc, 0) 
                                    TriggerClientEvent('sunny:properties:teleport', playerSrc, propertyToExpire.enter)
                                    TriggerClientEvent('sunny:properties:changePlayerSate', playerSrc, v.propertiesID, false)
                                end
                            end
                            propertyToExpire.owner = 'none'
                            propertyToExpire.ownerName = 'none'
                            propertyToExpire.players = {}
                            propertyToExpire.playersIG = {}
                            propertyToExpire.open = false
                            propertyToExpire.coffreOpen = false
                            propertyToExpire.time = 0
                            TriggerClientEvent('sunny:properties:updateProperties', -1, v.propertiesID, propertyToExpire)
                            
                            local ownerUser = ESX.GetPlayerFromUniqueId(v.propertiesOWNER)
                            if ownerUser then
                                TriggerClientEvent('esx:showNotification', ownerUser.source, ("Votre location pour %s a expiré."):format(propertyToExpire.label or propertyToExpire.name))
                            end
                        end)
                    end
                    ::continue_rental_loop::
                end
            end
        end)
    end
end)
]]--