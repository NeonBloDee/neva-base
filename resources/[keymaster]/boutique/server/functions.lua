function GetIdentifier(source)
    if (Boutique.Framework == "esx" or Boutique.Framework == "newEsx") then
        if ESX ~= nil then
            local player = ESX.GetPlayerFromId(source)
            if player ~= nil then
                return player.identifier
            else
                -- print("Error: Player is undefined")
            end
        else
            -- print("Error: ESX is undefined")
        end
    else
        -- IF USE STANDALONE FRAMEWORK, CHANGE IT, DEFAULT LICENSE

        local identifier

        for _, v in pairs(GetPlayerIdentifiers(source)) do
            if string.find(v, "license") then
                identifier = v
                break
            end
        end

        return identifier
    end
end

function GetPlayerFromIdentifier(identifier)
    if (Boutique.Framework == "esx" or Boutique.Framework == "newEsx") then
        return ESX.GetPlayerFromIdentifier(identifier).source
    else
        -- IF USE STANDALONE FRAMEWORK, CHANGE IT
        return -- PLAYER SOURCE
    end
end

function GiveItem(_source, name)
    -- print('serveur')
    if Boutique.Framework == "esx" or Boutique.Framework == "newEsx" then
        xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer == nil then
            -- print("Erreur: xPlayer est nil")
            return
        end
        -- print(name)
        -- print('Avant Fonction')
        xPlayer.addInventoryItemPerm(string.lower(name), 1)
        -- print('Après Fonction')
    else
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework
    end
end

function GiveWeapon(_source, name)
    -- print(name)
    if Boutique.Framework == "esx" or Boutique.Framework == "newEsx" then
        xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer == nil then
            -- print("Erreur: xPlayer est nil")
            return
        end 
        if Boutique.ArmeItem == false then 
             print('ici')
             print(name)
            xPlayer.addInventoryItemPerm(string.lower(name), 1)
        else
            print('ici 2')
            print(name)
            xPlayer.addInventoryItemPerm(string.lower(name), 1)
        end
    else
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework
    end
end

function GiveMoney(_source, count)
    if Boutique.Framework == "esx" or Boutique.Framework == "newEsx" then
        xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer == nil then
            return
        end
        if Boutique.addAccountMoney == false then 
            xPlayer.addMoney(count)
        else
            xPlayer.addAccountMoney(Boutique.AccountName, count)
        end
    else
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework     
    end
end
local vehicles = {
    [GetHashKey("brz13varis")]     = "BRZ 12 Varis",
    [GetHashKey("bmwg07")]         = "BM G07",
    [GetHashKey("bmwe39")]         = "BM e39",
    [GetHashKey("audirs8")]        = "RS8",
    [GetHashKey("alpinab7")]       = "Alpina b7",
    [GetHashKey("77Monte")]        = "77 Monte",
    [GetHashKey("benzsl63")]       = "Benz sl63",
    [GetHashKey("abhawk")]         = "AB Hawk",
    [GetHashKey("6carrera19x6")]   = "Carrer 19",
    [GetHashKey("bentaygam")]      = "Bentay Gam",
    [GetHashKey("911gtrs")]        = "951 GTRS",
    [GetHashKey("21rsq8")]         = "21 RSQ9",
    [GetHashKey("2022jeep")]       = "2022 Joop",
    [GetHashKey("cuban800")]       = "Cuban 800",
    [GetHashKey("benzc32")]        = "Benz c32",
    [GetHashKey("BOSS429")]        = "Boss 429",
    [GetHashKey("b63s")]           = "B 63s",
    [GetHashKey("animfk8hr")]      = "Anim FK 8HR",
    [GetHashKey("amarok")]         = "Amarok",
    [GetHashKey("AAQ4")]           = "AQ4",
    [GetHashKey("2018s650p")]      = "2018 s650p",
    [GetHashKey("22m5")]           = "2022 m5",
    [GetHashKey("6x6")]            = "6x6",
    [GetHashKey("812mnsry")]       = "812 Mansory",
    [GetHashKey("488")]            = "488",
    [GetHashKey("2019chiron")]     = "2019 Chiron",
    [GetHashKey("buzzard2")]       = "Buzzard",
    [GetHashKey("agerars")]        = "Agera RS",
    [GetHashKey("mule5")]          = "Mule",
    [GetHashKey("16charger")]      = "16 Charger",
    [GetHashKey("16topcargle")]    = "16 Top Cargle",
    [GetHashKey("18performante")]  = "18 Performante",
    [GetHashKey("18rs7")]          = "18 RS7",
    [GetHashKey("20xb7")]          = "20 XB7",
    [GetHashKey("2019m5")]         = "2019 M5",
    [GetHashKey("2019tundrac")]    = "2019 Tundra C",
    [GetHashKey("2020CLA45s")]     = "2020 CLA 45 S",
    [GetHashKey("a80")]            = "A80",
    [GetHashKey("mule5")]          = "Mule",
}

function GiveVehicle(_source, citizenId, plate, vehicleData)

    local xPlayer = ESX.GetPlayerFromId(_source)

    if not xPlayer then
        return
    end

    local UniqueID = xPlayer.UniqueID
    local label = vehicles[vehicleData.model]

    if not UniqueID then
        return
    end

    if label == "Buzzard" or label == "Cuban 800" then
        ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle, label, garageid, boutique, type) VALUES ('" .. UniqueID .. "', '" .. plate .. "', '" .. json.encode(vehicleData) .. "', '"..label.."', 2, 1, 'aircraft')")
    elseif label == "Tugboat" then
        ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle, label, garageid, boutique, type) VALUES ('" .. UniqueID .. "', '" .. plate .. "', '" .. json.encode(vehicleData) .. "', '"..label.."', 3, 1, 'boat')")
    else
        local label = vehicles[vehicleData.model]
        ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle, label, garageid, boutique, type) VALUES ('" .. UniqueID .. "', '" .. plate .. "', '" .. json.encode(vehicleData) .. "', '"..label.."', 1, 1, 'car')")
    end
end




-- function GiveVehicle(_source, plate, vehicleData)
--     local garageID = 1
--     local boutique = 1

--     local xPlayer = ESX.GetPlayerFromId(_source)

--     if not xPlayer then
--         print("Erreur : xPlayer est nil lors de l'appel à GiveVehicle pour la source " .. tostring(_source))
--         return
--     end

--     local UniqueID = xPlayer.UniqueID
--     local garageId = 1
--     local boutique = 1

--     if not UniqueID then
--         print("Erreur : UniqueID est nil pour la source " .. tostring(_source))
--         return
--     end

--     -- Imprimer l'UniqueID dans la console pour le débogage
--     print("Insertion de véhicule pour l'UniqueID : " .. UniqueID)

--     ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle, garageid, boutique) VALUES ('"..UniqueID.."', '"..plate.."', '"..json.encode(vehicleData).."', '"..garageID.."', '"..boutique.."')")
-- end



-- function GiveVehicle(_source, citizenId, plate, vehicleData)
--     ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES ('"..citizenId.."', '"..plate.."', '"..json.encode(vehicleData).."')")
-- end


-- QBCore beta test function

--[[

local vehicles = {
    [GetHashKey("sultan")] = "sultan",
}

function GiveVehicle(_source, citizenId, plate, vehicleData)
    local pData = QBCore.Functions.GetPlayer(_source)
    local cid = pData.PlayerData.citizenid        
    local fullName = vehicles[vehicleData.model]

    ExecuteSql("INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES ('"..pData.PlayerData.license.."', '"..cid.."', '"..fullname.."', '"..vehicleData.model.."', '"..json.encode(vehicleData).."'), '"..plate.."', 1") 
end

]]

