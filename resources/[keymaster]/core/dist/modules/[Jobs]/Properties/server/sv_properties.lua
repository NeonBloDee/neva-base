-- Initialize Properties object first
Properties = {
    PropertiesList = {},
    Loaded = false,
    garage = {
        count2 = {}
    }
}

function Properties:Load()
    MySQL.Async.fetchAll('SELECT * FROM properties', {}, function(result)
        -- Clear existing data
        self.PropertiesList = {}
        
        -- Debug print
        -- print("^3Loading properties... Found " .. #result .. " properties^7")
        
        if result then
            for _, v in pairs(result) do
                -- Add validation
                if not v.propertiesID then
                    print("^1Error: Invalid property data - missing ID^7")
                    goto continue
                end

                local defaultTrunk = {
                    items = {},
                    weapons = {},
                    accounts = {cash = 0, black_money = 0},
                    code = {active = false, blocked = false, code = nil}
                }

                -- Safely decode JSON fields with error handling
                local function safeJsonDecode(str, default)
                    if not str or str == "" or str == "null" then return default end
                    local success, result = pcall(json.decode, str)
                    return success and result or default
                end

                -- Decode all JSON fields
                local enter = safeJsonDecode(v.enter, {})
                local exit = safeJsonDecode(v.exitPos, {})
                local trunk = safeJsonDecode(v.trunk, defaultTrunk)
                local garagePos = safeJsonDecode(v.garagePos, {})
                local garageSpawn = safeJsonDecode(v.garageSpawn, {})
                local players = safeJsonDecode(v.players, {})

                -- Debug print
                -- print(("^2Loading property ID %d - %s^7"):format(v.propertiesID, v.name))

                self.PropertiesList[v.propertiesID] = {
                    id = v.propertiesID,
                    owner = v.propertiesOWNER or 'none',
                    ownerName = v.ownerName or 'none',
                    name = v.name,
                    label = v.label,
                    price = v.price,
                    enter = enter,
                    exit = exit,
                    street_name = v.street,
                    trunkPos = safeJsonDecode(v.trunk, {}),
                    garage = v.garage == 1,
                    garagePos = garagePos,
                    garageSpawn = garageSpawn,
                    garageRotation = v.garageRotation,
                    garageType = v.garageType,
                    players = players,
                    type = v.type,
                    logementType = v.logementType,
                    trunk = trunk,
                    open = false,
                    playersIG = {},
                    coffreOpen = false,
                    interphone = {},
                    entrepot = v.entrepot == 1,
                    pound = v.pound,
                    time = v.time
                }

                ::continue::
            end
        end

        self.Loaded = true
        -- print(("^2Successfully loaded %d properties^7"):format(#result))
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
    Wait(1000)
    Properties:Load()
    Properties.Loaded = true
end)

RegisterNetEvent('sunny:properties:load', function()
    local source = source
    TriggerClientEvent('sunny:properties:load', source, Properties.PropertiesList)
end)

RegisterServerEvent('Achat:Maison')
AddEventHandler('Achat:Maison', function(Infos)

    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local IdUnique = xPlayer.UniqueID
    local IdMaison = Infos.id    
    local PrixMaison = Infos.price


    if xPlayer.getMoney() >= PrixMaison then

        xPlayer.removeAccountMoney('cash', PrixMaison)

        MySQL.Async.execute('UPDATE properties SET propertiesOWNER = @propertiesOwner WHERE propertiesID = @propertiesID', {
            ['@propertiesOwner'] = IdUnique,
            ['@propertiesID'] = IdMaison
        }, function(affectedRows)
            if affectedRows > 0 then
                TriggerClientEvent('esx:showNotification', _src, 'Vous avez acheté la maison avec succès !')
        
                MySQL.Async.fetchAll('SELECT * FROM properties WHERE propertiesID = @propertiesID', {
                    ['@propertiesID'] = IdMaison
                }, function(result)
                    if result[1] then
                        TriggerClientEvent('sunny:properties:updateProperties', -1, IdMaison, {
                            id = result[1].propertiesID,
                            owner = result[1].propertiesOWNER,
                            ownerName = result[1].ownerName,
                            name = result[1].name,
                            label = result[1].label,
                            price = result[1].price,
                            enter = json.decode(result[1].enter),
                            exit = json.decode(result[1].exit),
                            street_name = result[1].street,
                            trunkPos = json.decode(result[1].trunkPos),
                            garage = result[1].garage,
                            garagePos = json.decode(result[1].garagePos),
                            garageSpawn = json.decode(result[1].garageSpawn),
                            garageRotation = result[1].garageRotation,
                            garageType = result[1].garageType,
                            players = json.decode(result[1].players),
                            type = result[1].type,
                            logementType = result[1].logementType,
                            open = false,
                            playersIG = {},
                            coffreOpen = false,
                            interphone = {},
                            entrepot = result[1].entrepot,
                            pound = result[1].pound
                        })


                    end
                end)
            else
                TriggerClientEvent('esx:showNotification', _src, 'Une erreur est survenue lors de l\'achat de la maison.')
            end
        end)
        

    else
        TriggerClientEvent('esx:showNotification', _src, 'Vous n\'avez pas assez d\'argent pour acheter cette maison.')
    end


end)

-- Optimize INSERT
RegisterNetEvent('sunny:properties:createProperties', function(name, label, price, enter, exit, garage, posGarage, posGarageSpawn, rotGarageSpawn, garageType, type, trunkPos, logementType, current_zone, entrepot, pound)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local society = Society:getSociety(xPlayer.job.name)
    if not society then return end

    -- Validate data
    if not name or not label or not price then
        return TriggerClientEvent('esx:showNotification', source, 'Données invalides')
    end

    MySQL.Async.execute('INSERT INTO properties (propertiesOWNER, name, label, price, enter, exitPos, garage, garagePos, garageSpawn, garageRotation, garageType, type, trunk, logementType, street, entrepot, pound, ownerName, time) VALUES (@owner, @name, @label, @price, @enter, @exit, @garage, @garagePos, @garageSpawn, @garageRotation, @garageType, @type, @trunk, @logementType, @street, @entrepot, @pound, @ownerName, @time)', {
        ['@owner'] = 'none',
        ['@name'] = name,
        ['@label'] = label,
        ['@price'] = price,
        ['@enter'] = json.encode(enter),
        ['@exit'] = json.encode(exit),
        ['@garage'] = garage and 1 or 0,
        ['@garagePos'] = json.encode(posGarage),
        ['@garageSpawn'] = json.encode(posGarageSpawn),
        ['@garageRotation'] = rotGarageSpawn,
        ['@garageType'] = garageType,
        ['@type'] = type,
        ['@trunk'] = json.encode(trunkPos),
        ['@logementType'] = logementType,
        ['@street'] = current_zone,
        ['@entrepot'] = entrepot and 1 or 0,
        ['@pound'] = pound or 0,
        ['@ownerName'] = 'none',
        ['@time'] = 0
    }, function(affectedRows)
        if affectedRows == 0 then
            return TriggerClientEvent('esx:showNotification', source, 'Erreur lors de la création')
        end

        -- Get the inserted ID
        MySQL.Async.fetchAll('SELECT LAST_INSERT_ID() as id', {}, function(result)
            if not result[1] then return end
            
            local insertId = result[1].id

            -- Update society money
            society.removeSocietyMoney(price/100*75)

            -- Cache the new property
            Properties.PropertiesList[insertId] = {
                id = insertId,
                owner = 'none',
                ownerName = 'none',
                name = name,
                label = label,
                price = price,
                enter = enter,
                exit = exit,
                street_name = current_zone,
                trunkPos = trunkPos,
                garage = garage == 1,
                garagePos = posGarage,
                garageSpawn = posGarageSpawn,
                garageRotation = rotGarageSpawn,
                garageType = garageType,
                players = {},
                type = type,
                logementType = logementType,
                trunk = {
                    items = {},
                    weapons = {},
                    accounts = {
                        cash = 0,
                        black_money = 0
                    },
                    code = {
                        active = false,
                        blocked = false,
                        code = nil
                    }
                },
                entrepot = entrepot == 1,
                pound = pound,
                open = false,
                time = 0
            }

            TriggerClientEvent('sunny:properties:add', -1, insertId, Properties.PropertiesList[insertId])
            TriggerClientEvent('esx:showNotification', source, ('Propriété %s créée'):format(name))
        end)
    end)
end)

RegisterNetEvent('sunny:properties:addPlayer', function(target, value, pId, players)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not Properties.PropertiesList[pId] then return end

    if value == 'me' then
        Properties:addPlayer(source, pId)
        TriggerClientEvent('sunny:properties:teleport', source, vector3(Properties.PropertiesList[pId].exit.x, Properties.PropertiesList[pId].exit.y, Properties.PropertiesList[pId].exit.z))

        TriggerClientEvent('sunny:properties:changePlayerSate', source, pId, true)
    end

    if not Properties.PropertiesList[pId].playersIG then
        Properties.PropertiesList[pId].playersIG = {}
    end

    Properties.PropertiesList[pId].playersIG[source] = {
        source = source,
        UniqueID = xPlayer.UniqueID
    }

    Properties.PropertiesList[pId].players = players

    Properties:DbPlayerSync(pId)
end)

RegisterNetEvent('sunny:properties:removePlayer', function(target, value, pId, players)
    local source = source

    if not Properties.PropertiesList[pId] then return end

    if value == 'me' then
        Properties:addPlayer(source, 0)
        TriggerClientEvent('sunny:properties:teleport', source, vector3(Properties.PropertiesList[pId].enter.x, Properties.PropertiesList[pId].enter.y, Properties.PropertiesList[pId].enter.z))

        TriggerClientEvent('sunny:properties:changePlayerSate', source, pId, false)
    elseif value == 'all' then
        for k,v in pairs(Properties.PropertiesList[pId].playersIG) do
            -- print(v.UniqueID)
            Properties:addPlayer(v.source, 0)
            TriggerClientEvent('sunny:properties:teleport', v.source, vector3(Properties.PropertiesList[pId].enter.x, Properties.PropertiesList[pId].enter.y, Properties.PropertiesList[pId].enter.z))

            Properties:updatePlayers(v.UniqueID,pId,false)
        end
    end

    Properties.PropertiesList[pId].players = players

    Properties:DbPlayerSync(pId)
end)

AddEventHandler('esx:playerLoaded', function(source)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    Properties.garage.count2[xPlayer.UniqueID] = 0
end)

RegisterNetEvent('sunny:properties:locked', function(k, statut)
    Properties.PropertiesList[k].open = statut

    TriggerClientEvent('sunny:properties:locked', -1, k, statut)
end)

RegisterNetEvent('sunny:properties:lockedCoffre', function(k, statut)
    Properties.PropertiesList[k].coffreOpen = statut

    TriggerClientEvent('sunny:properties:lockedCoffre', -1, k, statut)
end)

RegisterNetEvent('sunny:properties:sell', function(propertiesID)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    MySQL.Async.execute('UPDATE properties SET propertiesOWNER = @owner, ownerName = @ownerName, time = @time WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = propertiesID,
        ['@owner'] = 'none',
        ['@ownerName'] = 'none',
        ['@time'] = 0
    }, function()
        for k,v in pairs(Properties.PropertiesList[propertiesID].playersIG) do
            Properties:addPlayer(v.source, 0)
            TriggerClientEvent('sunny:properties:teleport', v.source, vector3(Properties.PropertiesList[pId].enter.x, Properties.PropertiesList[pId].enter.y, Properties.PropertiesList[pId].enter.z))
        end

        TriggerClientEvent('esx:showNotification', source, '🏠 Propriété vendue avec succès')

        xPlayer.addAccountMoney('bank', Properties.PropertiesList[propertiesID].price/100*50)
    end)
end)

RegisterNetEvent('sunny:properties:interphone:call', function(propertiesData, time)
    if not propertiesData then return end
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if not Properties.PropertiesList[propertiesData.id] then return end

    propertiesData = Properties.PropertiesList[propertiesData.id]

    if not propertiesData then return end

    if not propertiesData.interphone then
        propertiesData.interphone = {}
    end

    propertiesData.interphone[xPlayer.UniqueID] = {
        UniqueID = xPlayer.UniqueID,
        name = xPlayer.name,
        firstname = xPlayer.firstname,
        lastname = xPlayer.lastname,
        playerCoords = GetEntityCoords(GetPlayerPed(source)),
        at =os.date(('%sh%s'):format('%H', '%M')),
    }

    for k,v in pairs(propertiesData.players) do
        local player = ReturnPlayerId(k)

        if player then
            TriggerClientEvent('sunny:properties:interphone:call:requestCall', player.id, propertiesData)
        end
    end
end)

RegisterNetEvent('sunny:properties:interphone:call:validateEnter', function(propertiesData, playerData)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    
    local player = ReturnPlayerId(playerData.UniqueID)

    if not player then return end

    for k,v in pairs(propertiesData.interphone) do
        if v.UniqueID == playerData.UniqueID then
            Properties.PropertiesList[propertiesData.id].interphone[k] = nil
            TriggerClientEvent('sunny:properties:updateCallWithPlayerCall', player.id, propertiesData)
        end
    end

    TriggerClientEvent('sunny:properties:interphone:update', -1, Properties.PropertiesList[propertiesData.id])

    if #(GetEntityCoords(GetPlayerPed(player.id))-vector3(propertiesData.enter.x, propertiesData.enter.y, propertiesData.enter.z)) > 5 then return TriggerClientEvent('esx:showNotification', source, 'La personne est trop éloignée de la portre d\'entrée') end

    Properties:addPlayer(player.UniqueID, propertiesData.id)
    TriggerClientEvent('sunny:properties:teleport', player.id, vector3(Properties.PropertiesList[propertiesData.id].exit.x, Properties.PropertiesList[propertiesData.id].exit.y, Properties.PropertiesList[propertiesData.id].exit.z))

    Properties.PropertiesList[propertiesData.id].playersIG[player.id] = {
        source = player.id
    }

    Properties.PropertiesList[propertiesData.id].playersIG[player.id] = {
        source = player.id,
        UniqueID = player.UniqueID
    }

    Properties.PropertiesList[propertiesData.id].players = Properties.PropertiesList[propertiesData.id].players

    Properties:DbPlayerSync(propertiesData.id)

    TriggerClientEvent('sunny:properties:interphone:update', -1, Properties.PropertiesList[propertiesData.id])
    Properties:updatePlayers(player.UniqueID,propertiesData.id,true)
end)

RegisterNetEvent('sunny:properties:interphone:call:refuseEnter', function(propertiesData, playerData)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local player = ReturnPlayerId(playerData.UniqueID)

    if not player then return end

    for k,v in pairs(propertiesData.interphone) do
        if v.UniqueID == playerData.UniqueID then
            Properties.PropertiesList[propertiesData.id].interphone[k] = nil
            TriggerClientEvent('sunny:properties:updateCallWithPlayerCall', player.id, propertiesData)
        end
    end

    Properties.PropertiesList[propertiesData.id].players = Properties.PropertiesList[propertiesData.id].players

    TriggerClientEvent('sunny:properties:interphone:update', -1, Properties.PropertiesList[propertiesData.id])
    TriggerClientEvent('sunny:propeties:updatePlayers', -1, Properties.PropertiesList[propertiesData.id])
end)


-- Systeme de location : 

-- -- CreateThread(function()
-- --     while true do 
-- --         Wait(3600000)
-- --         MySQL.Async.fetchAll('SELECT * FROM properties', {}, function(result)
-- --             for k,v in pairs(result) do 
-- --                 if v.type == 'location' then
-- --                     if v.propertiesOWNER == 'none' then goto continue end
-- --                     if tonumber(v.time) <= 0 then goto continue end

-- --                     Properties.PropertiesList[v.propertiesID].time -= 1

-- --                     if tonumber(Properties.Properties[v.propertiesID].time) > 0 then
-- --                         MySQL.Async.execute('UPDATE properties SET time = @time WHRE propertiesID = @p', {
-- --                             ['@p'] = v.propertiesID,
-- --                             ['@time'] = Properties.PropertiesList[v.propertiesID].time
-- --                         }, function()
-- --                             TriggerClientEvent('sunny:properties:updateProperties', -1, v.propertiesID, Properties.PropertiesList[v.propertiesID])
-- --                         end)
-- --                     else
-- --                         MySQL.Async.execute('UPDATE properties SET time = @time, @propertiesOWNER = @o, @ownerName = @on WHRE propertiesID = @p', {
-- --                             ['@p'] = v.propertiesID,
-- --                             ['@time'] = Properties.PropertiesList[v.propertiesID].time,
-- --                             ['@o'] = 'none',
-- --                             ['@on'] = 'none'
-- --                         }, function()
-- --                             TriggerClientEvent('sunny:properties:updateProperties', -1, v.propertiesID, Properties.PropertiesList[v.propertiesID])
-- --                         end)
-- --                     end

-- --                     -- if v.propertiesOWNER ~= 'none' then
-- --                     --     local player = ReturnPlayerId(v.propertiesOWNER)

-- --                     --     if player then
-- --                     --         local xPlayer = ESX.GetPlayerFromId(player.id)
-- --                     --         xPlayer.removeAccountMoney('bank', v.price)
-- --                     --         TriggerClientEvent('esx:showNotification', player.id, ('Vous avez payé votre loyer pour un montant de ~y~%s$~s~'):format(v.price))   
-- --                     --     else
-- --                     --         MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
-- --                     --             ['@UniqueID'] = Properties.PropertiesList[v.propertiesID].owner
-- --                     --         }, function(result)
-- --                     --             local accounts;
-- --                     --             for k,v in pairs(result) do
-- --                     --                 accounts = json.decode(v.accounts)
    
-- --                     --                 for i,p in pairs(accounts) do
-- --                     --                     if p.name == 'bank' then
-- --                     --                         accounts[i].money -= tonumber(v.price)
-- --                     --                     end
-- --                     --                 end
-- --                     --             end
    
-- --                     --             MySQL.Async.execute('UPDATE users SET accounts = @accounts WHERE UniqueID = @UniqueID', {
-- --                     --                 ['@UniqueID'] = v.propertiesOWNER,
-- --                     --                 ['@accounts'] = json.encode(accounts)
-- --                     --             }, function()
                                  
-- --                     --             end)
-- --                     --         end)      
-- --                     --     end
-- --                     -- end

-- --                     if Properties.Properties[v.propertiesID].time <= 0 then
-- --                         Properties.Properties[v.propertiesID].owner = 'none'
-- --                         Properties.Properties[v.propertiesID].ownerName = 'none'

-- --                         MySQL.Async.execute('UPDATE properties SET propertiesOWNER = @propertiesOWNER, ownerName = @ownerName WHERE propertiesID = @propertiesID', {
-- --                             ['@propertiesID'] = v.propertiesID,
-- --                             ['@propertiesOWNER'] = Properties.Properties[v.propertiesID].owner,
-- --                             ['@ownerName'] = Properties.Properties[v.propertiesID].ownerName
-- --                         }, function()
                            
-- --                         end)
-- --                     end
-- --                 end
-- --             end

-- --             ::continue::
-- --         end)
-- --     end
-- -- end)

-- Ajouter cet event
AddEventHandler('playerDropped', function(reason)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Parcourir toutes les propriétés pour trouver où le joueur était
    for k,v in pairs(Properties.PropertiesList) do
        if v.players and v.players[tostring(xPlayer.UniqueID)] then
            -- Sauvegarder la dernière position connue (l'entrée de la propriété)
            MySQL.Async.execute('UPDATE users SET position = @position WHERE identifier = @identifier', {
                ['@identifier'] = xPlayer.identifier,
                ['@position'] = json.encode({x = v.enter.x, y = v.enter.y, z = v.enter.z})
            })
            break
        end
    end
end)