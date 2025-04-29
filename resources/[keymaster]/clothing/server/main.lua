CreateCallback('clothing:getClothingUrl:server', function(source, cb, default)
    if default then
        local url = exports["0r-imagegenerator"]:getDefaultClothingUrl()
        cb(url)
    else
        local url = exports["0r-imagegenerator"]:getClothingUrl()
        cb(url)
    end
end)

CreateCallback('clothing:getSkin:server', function(source, cb)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return print("There is a problem with player data.") end
    if CoreName == "qb" then
        local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {Player.PlayerData.citizenid, 1})
        if result[1] ~= nil then
            local skin = json.decode(result[1].skin)
            skin.model = result[1].model
            cb(skin)
        else
            cb({})
        end
    elseif CoreName == "esx" then
        local result = MySQL.query.await('SELECT skin, sex FROM users WHERE identifier = ?', {Player.identifier})
        if result[1] ~= nil and result[1].skin then
            local skin = json.decode(result[1].skin)
            if not skin.model then
                if result[1].sex == 0 then
                    skin.model = "mp_m_freemode_01"
                else
                    skin.model = "mp_m_freemode_01"
                end
            end
            cb(skin)
        else
            cb({})
        end
    end
end)

RegisterNetEvent('clothing:saveSkin:server', function(model, skin)
    local src = source
    local player = GetPlayer(src)
    if not player then return print("There is a problem with player data.") end
    if CoreName == "qb" then
        MySQL.query('DELETE FROM playerskins WHERE citizenid = ?', {player.PlayerData.citizenid}, function()
            MySQL.insert('INSERT INTO playerskins (citizenid, model, skin, active) VALUES (?, ?, ?, ?)', {
                player.PlayerData.citizenid,
                model,
                json.encode(skin),
                1
            })
        end)
    elseif CoreName == "esx" then
        MySQL.Async.execute('UPDATE users SET `skin` = @skin WHERE identifier = @identifier', {
            ['@skin'] = json.encode(skin),
            ['@identifier'] = player.identifier
        })
    end
end)

RegisterNetEvent('illenium-appearance:server:saveAppearance', function(skin)
    local src = source
    local player = GetPlayer(src)
    if not player then return print("There is a problem with player data.") end
    if CoreName == "qb" then
        TriggerClientEvent('clothing:saveSkin:client', src, skin)
    elseif CoreName == "esx" then
        MySQL.Async.execute('UPDATE users SET `skin` = @skin WHERE identifier = @identifier', {
            ['@skin'] = json.encode(skin),
            ['@identifier'] = player.identifier
        })
    end
end)

RegisterServerEvent("qb-clothing:saveSkin", function(model, skin)
    local src = source
    local player = GetPlayer(src)
    if not player then return print("There is a problem with player data.") end
    TriggerClientEvent('clothing:saveSkin:client', src, skin)
end)

RegisterServerEvent("clothing:loadPlayerSkin:server", function(lsInv)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return print("There is a problem with player data.") end
    if CoreName == "qb" then
        local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {Player.PlayerData.citizenid, 1})
        if result[1] ~= nil then
            TriggerClientEvent("clothing:loadSkin:client", src, false, result[1].model, result[1].skin)
        else
            TriggerClientEvent("clothing:loadSkin:client", src, true)
        end
    elseif CoreName == "esx" then
        local result = MySQL.query.await('SELECT skin, sex FROM users WHERE identifier = ?', {Player.identifier})
        if result[1] ~= nil and result[1].skin then
            local skin = json.decode(result[1].skin)
            if not skin.model then
                if result[1].sex == 0 then
                    skin.model = "mp_m_freemode_01"
                else
                    skin.model = "mp_m_freemode_01"
                end
            end
            TriggerClientEvent("clothing:loadSkin:client", src, false, skin.model, result[1].skin)
        else
            TriggerClientEvent("clothing:loadSkin:client", src, true)
        end
    end
end)

CreateCallback('clothing:buyClothing:server', function(source, cb, paymentType, amount)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return print("There is a problem with player data.") end
    if Config.CashAsItem.Enable then
        if HasItem(src, Config.CashAsItem.Name) >= amount then
            RemoveItem(src, Config.CashAsItem.Name, amount)
            cb(true)
        else
            cb(false)
        end
    else
        if GetPlayerMoney(src, paymentType) >= amount then
            RemoveMoney(src, paymentType, amount, "clothing-market-purchasement")
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterNetEvent('clothing:disableAllDefaultImages:server', function()
    MySQL.insert('INSERT INTO 0r_clothing_image_data (data) VALUES (:data)', {
        data = "all"
    })
end)

RegisterNetEvent('clothing:disableFaceDefaultImages:server', function()
    MySQL.insert('INSERT INTO 0r_clothing_image_data (data) VALUES (:data)', {
        data = "face"
    })
end)

RegisterNetEvent('clothing:disableBodyDefaultImages:server', function()
    MySQL.insert('INSERT INTO 0r_clothing_image_data (data) VALUES (:data)', {
        data = "body"
    })
end)

RegisterNetEvent('clothing:disableClothingDefaultImages:server', function()
    MySQL.insert('INSERT INTO 0r_clothing_image_data (data) VALUES (:data)', {
        data = "clothing"
    })
end)

RegisterNetEvent('clothing:disableAccessoriesDefaultImages:server', function()
    MySQL.insert('INSERT INTO 0r_clothing_image_data (data) VALUES (:data)', {
        data = "accessories"
    })
end)

Citizen.CreateThread(function()
    while not CoreReady do Citizen.Wait(500) end
    if CoreName == "qb" then
        Core.Functions.CreateCallback('clothing:getSkinByCID:server', function(source, cb, cid)
            local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {cid, 1})
            if result[1] ~= nil then
                local skin = json.decode(result[1].skin)
                skin.model = result[1].model
                cb(skin)
            else
                cb(nil)
            end
        end)
        Core.Functions.CreateCallback('clothing:getSkin:server', function(source, cb)
            local Player = GetPlayer(source)
            local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {Player.PlayerData.citizenid, 1})
            if result[1] ~= nil then
                local skin = json.decode(result[1].skin)
                skin.model = result[1].model
                cb(skin)
            else
                cb(nil)
            end
        end)
        Core.Functions.CreateCallback('qb-clothing:server:getOutfits', function(source, cb)
            local src = source
            local Player = Core.Functions.GetPlayer(src)
            local anusVal = {}
        
            local result = MySQL.query.await('SELECT * FROM player_outfits WHERE citizenid = ?', { Player.PlayerData.citizenid })
            if result[1] ~= nil then
                for k, v in pairs(result) do
                    result[k].skin = json.decode(result[k].skin)
                    anusVal[k] = v
                end
                cb(anusVal)
            end
            cb(anusVal)
        end)
        RegisterServerEvent("qb-clothes:loadPlayerSkin", function()
            local src = source
            local Player = Core.Functions.GetPlayer(src)
            if not Player then return print("There is a problem with player data.") end
            local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {Player.PlayerData.citizenid, 1})
            if result[1] ~= nil then
                TriggerClientEvent("clothing:loadSkin:client", src, false, result[1].model, result[1].skin)
            else
                TriggerClientEvent("clothing:loadSkin:client", src, true)
            end
        end)
    end
    if CoreName == "esx" then
        Core.RegisterServerCallback('clothing:getSkinByIdentifier:server', function(source, cb, identifier)
            local result = MySQL.query.await('SELECT skin, sex FROM users WHERE identifier = ?', {identifier})
            if result[1] ~= nil and result[1].skin then
                local skin = json.decode(result[1].skin)
                if not skin.model then
                    if result[1].sex == 0 then
                        skin.model = "mp_m_freemode_01"
                    else
                        skin.model = "mp_m_freemode_01"
                    end
                end
                cb(skin)
            else
                cb(nil)
            end
        end)
        Core.RegisterServerCallback('clothing:getSkin:server', function(source, cb)
            local result = MySQL.query.await('SELECT skin, sex FROM users WHERE identifier = ?', {identifier})
            if result[1] ~= nil and result[1].skin then
                local skin = json.decode(result[1].skin)
                if not skin.model then
                    if result[1].sex == 0 then
                        skin.model = "mp_m_freemode_01"
                    else
                        skin.model = "mp_m_freemode_01"
                    end
                end
                cb(skin)
            else
                cb(nil)
            end
        end)
        Core.RegisterServerCallback("esx_skin:getPlayerSkin", function(source, cb)
            local result = MySQL.query.await('SELECT skin, sex FROM users WHERE identifier = ?', {identifier})
            if result[1] ~= nil and result[1].skin then
                local skin = json.decode(result[1].skin)
                if not skin.model then
                    if result[1].sex == 0 then
                        skin.model = "mp_m_freemode_01"
                    else
                        skin.model = "mp_m_freemode_01"
                    end
                end
                cb(skin)
            else
                cb(nil)
            end
        end)
        RegisterServerEvent("esx_skin:save")
        AddEventHandler("esx_skin:save", function(skin)
            local xPlayer = GetPlayer(source)
            if not Core.GetConfig().OxInventory then
                local defaultMaxWeight = Core.GetConfig().MaxWeight
                BackpackWeight = {
                    [40] = 16,
                    [41] = 20,
                    [44] = 25,
                    [45] = 23,
                }
                local backpackModifier = BackpackWeight[skin.bags_1]
                if backpackModifier then
                    xPlayer.setMaxWeight(defaultMaxWeight + backpackModifier)
                else
                    xPlayer.setMaxWeight(defaultMaxWeight)
                end
            end
            MySQL.update("UPDATE users SET skin = @skin WHERE identifier = @identifier", {
                ["@skin"] = json.encode(skin),
                ["@identifier"] = xPlayer.identifier,
            })
        end)
    end
end)

RegisterServerEvent("qb-clothes:saveOutfit", function(outfitName, model, skinData)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if model ~= nil and skinData ~= nil then
        local outfitId = "outfit-"..math.random(1, 10).."-"..math.random(1111, 9999)
        MySQL.insert('INSERT INTO player_outfits (citizenid, outfitname, model, skin, outfitId) VALUES (?, ?, ?, ?, ?)', {
            Player.PlayerData.citizenid,
            outfitName,
            model,
            json.encode(skinData),
            outfitId
        }, function()
            local result = MySQL.query.await('SELECT * FROM player_outfits WHERE citizenid = ?', { Player.PlayerData.citizenid })
            if result[1] ~= nil then
                TriggerClientEvent('qb-clothing:client:reloadOutfits', src, result)
            else
                TriggerClientEvent('qb-clothing:client:reloadOutfits', src, nil)
            end
        end)
    end
end)

RegisterServerEvent("qb-clothing:server:removeOutfit", function(outfitName, outfitId)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    MySQL.query('DELETE FROM player_outfits WHERE citizenid = ? AND outfitname = ? AND outfitId = ?', {
        Player.PlayerData.citizenid,
        outfitName,
        outfitId
    }, function()
        local result = MySQL.query.await('SELECT * FROM player_outfits WHERE citizenid = ?', { Player.PlayerData.citizenid })
        if result[1] ~= nil then
            TriggerClientEvent('qb-clothing:client:reloadOutfits', src, result)
        else
            TriggerClientEvent('qb-clothing:client:reloadOutfits', src, nil)
        end
    end)
end)

Citizen.CreateThread(function()
    if GetResourceState("qb-clothing") == "started" then StopResource("qb-clothing") end
    if GetResourceState("skinchanger") == "started" then StopResource("skinchanger") end
    if GetResourceState("esx_skin") == "started" then StopResource("esx_skin") end
end)

CreateCallback('clothing:getPlayerTattoos:server', function(source, cb)
    local src = source
    local Player = GetPlayer(src)
    local PlayerLicense = GetPlayerLicenseCore(src)
    if Player then
        MySQL.query('SELECT data FROM 0r_clothing_tattoos WHERE license = @license', {
            ['@license'] = PlayerLicense
        }, function(result)
            if result and result[1] and result[1].data then
                cb(json.decode(result[1].data))
            else
                cb(nil)
            end
        end)
    else
        cb(nil)
    end
end)

RegisterNetEvent('clothing:updateTattooList:server', function(tattooList)
    local src = source
    local Player = GetPlayer(src)
    if Player then
        local PlayerLicense = GetPlayerLicenseCore(src)
        local result = MySQL.query.await('SELECT * FROM 0r_clothing_tattoos WHERE license = ?', {PlayerLicense})
        if next(result) and result[1] then
            MySQL.query('UPDATE 0r_clothing_tattoos SET data = @data WHERE license = @license', {
                ['@data'] = json.encode(tattooList),
                ['@license'] = PlayerLicense
            })
        else
            MySQL.insert('INSERT INTO 0r_clothing_tattoos (license, data) VALUES (:license, :data)', {
                license = PlayerLicense,
                data = json.encode(tattooList)
            })
        end
    end
end)

RegisterNetEvent('clothing:loadPlayerTattoos:server', function()
    local src = source
    local Player = GetPlayer(src)
    if Player then
        local PlayerLicense = GetPlayerLicenseCore(src)
        MySQL.query('SELECT data FROM 0r_clothing_tattoos WHERE license = @license', {
            ['@license'] = PlayerLicense
        }, function(result)
            if result and result[1] and result[1].data then
                local tats = result[1].data
                -- print(tats)
                TriggerClientEvent('clothing:loadPlayerTattoos:client', src, tats)
            else
                TriggerEvent('remover:all')
                TriggerClientEvent('remover:tudo', src)
            end
        end)
    end
end)

RegisterNetEvent('clothing:removeAllTattoos:server', function()
    local src = source
    local Player = GetPlayer(src)
    if Player then
        local PlayerLicense = GetPlayerLicenseCore(src)
        MySQL.query('UPDATE 0r_clothing_tattoos SET data = @data WHERE license = @license', {
            ['@data'] = 0,
            ['@license'] = PlayerLicense
        })
    end
end)