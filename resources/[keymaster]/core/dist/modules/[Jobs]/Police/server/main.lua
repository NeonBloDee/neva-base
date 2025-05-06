ESX.RegisterServerCallback('sunny:police:search', function(source, cb, player)
    local targetPlayer = ESX.GetPlayerFromId(player)

    if targetPlayer then
        local data = {}
        data[player] = {
            inventory = targetPlayer.inventory,
            loadout = targetPlayer.loadout,
            cash = targetPlayer.getAccount('cash').money,
            black_money = targetPlayer.getAccount('black_money').money,
            id = targetPlayer.source
        }
        cb(data[player])

        TriggerClientEvent('esx:showNotification', targetPlayer.source, '👮 La police vous fouille')
    else
        cb(false)
    end
end)

local codeCooldowns = {} -- Stocker les cooldowns des joueurs

-- Fonction pour ajouter un blip
local function AddPoliceBlip(coords, code)
    TriggerClientEvent('sunny:client:addPoliceBlip', -1, coords, code) -- Diffuse un événement pour ajouter un blip
end

-- Fonction pour envoyer une notification uniquement aux policiers
local function NotifyPolice(msg)
    for _, playerId in ipairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(playerId) -- Modifier pour QBCore/QBOX si nécessaire
        if xPlayer and xPlayer.job and xPlayer.job.name == 'police' then
            TriggerClientEvent('esx:showNotification', playerId, msg) -- Notifie uniquement les policiers
        end
    end
end


RegisterNetEvent('Police:ForcerId')
AddEventHandler('Police:ForcerId', function(id)
    local _src = source
    TriggerClientEvent('montrer:identity', id)
end)

RegisterNetEvent('Police:ForcerDrive')
AddEventHandler('Police:ForcerDrive', function(id)
    local _src = source
    TriggerClientEvent('montrer:drive', id)
end)

-- Événement pour gérer les codes de police
RegisterNetEvent('sunny:codes')
AddEventHandler('sunny:codes', function(code)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src) -- Modifier pour QBCore/QBOX si nécessaire

    if not xPlayer or xPlayer.job.name ~= 'police' then
        TriggerClientEvent('esx:showNotification', src, "Vous n'êtes pas un policier.") -- Notifie l'émetteur s'il n'est pas policier
        return
    end

    -- Vérifie le cooldown
    local cooldown = codeCooldowns[src] or {}
    local currentTime = os.time()
    if cooldown[code] and (currentTime - cooldown[code]) < 15 then -- Délai de 60 secondes
        TriggerClientEvent('esx:showNotification', src, "Vous devez attendre avant de réutiliser ce code.")
        return
    end

    -- Met à jour le cooldown pour ce code
    codeCooldowns[src] = codeCooldowns[src] or {}
    codeCooldowns[src][code] = currentTime

    -- Ajoute un blip sur la carte
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    AddPoliceBlip(playerCoords, code)

    -- Envoie une notification aux policiers
    NotifyPolice("~b~Code " .. code .. " ~s~signalé par " .. GetPlayerName(src) .. ".")
end)

ESX.RegisterServerCallback('sunny:getVehiculehInfos', function(source, cb, plate, model)
	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		local VehiculeInfos = {plate = plate, model = model}
		if result[1] then
            MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE UniqueID = @UniqueID',  {
                ['@UniqueID'] = result[1].owner
            }, function(result2)
                if result2[1] then
                    VehiculeInfos.owner = ('%s %s'):format(result2[1].firstname, result2[1].lastname)
                    cb(VehiculeInfos)
                else
                    cb(VehiculeInfos)
                end
            end)
        else
            cb(VehiculeInfos)
		end
	end)
end)


RegisterNetEvent('sunny:Service:delVeh', function(veh)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name ~= "police" and xPlayer.job.name ~= "bcso" and xPlayer.job.name ~= "mecano" and xPlayer.job.name ~= "lscustom" then return end
    DeleteEntity(NetworkGetEntityFromNetworkId(veh))
end)

RegisterNetEvent('sunny:police:menotter', function(target)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end

    local targetPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent('sunny:police:menotter', targetPlayer.source)
end)

RegisterNetEvent('sunny:police:putinvehicule', function(target)
    local sourcePlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    if not sourcePlayer or not targetPlayer then return end

    TriggerClientEvent('sunny:police:putinvehicule', targetPlayer.source)
end)

RegisterNetEvent('sunny:police:plainte:register', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx:showNotification', source, '📝 Plainte enregistrée avec succès')
    MySQL.Async.execute('INSERT INTO police_plainte (name, date, numberphone, reason, author) VALUES (@name, @date, @numberphone, @reason, @author)', {
        ['@name'] = data.name, 
        ['@date'] = data.date,
        ['@numberphone'] = data.numberphone, 
        ['@reason'] = data.reason,
        ['@author'] = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname),
    }, function()
    end)
end)

ESX.RegisterServerCallback('sunny:police:plainte:get', function(source, cb)
    local plaintes = {}

    MySQL.Async.fetchAll('SELECT * FROM police_plainte', {}, function(result)
        for k,v in pairs(result) do
            table.insert(plaintes, v)
        end

        cb(plaintes)
    end)
end)

RegisterNetEvent('sunny:police:plainte:delete', function(id)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    MySQL.Async.execute('DELETE FROM police_plainte WHERE id = @id', {
        ['@id'] = id
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'Plainte supprimée avec succès')
    end)
end)

RegisterNetEvent('sunny:police:plainte:editReason', function(id, newReason)
        local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('UPDATE police_plainte SET reason = @reason WHERE id = @id', {
        ['@id'] = id,
        ['@reason'] = newReason
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'La raison de la plainte a bien était modifiée')
    end)
end)

RegisterNetEvent('sunny:police:escoter', function(target)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    TriggerClientEvent('sunny:police:escoter', target, source)
end)

RegisterNetEvent('sunny:police:playerVehicle', function(target, vehicle, value)
            local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    TriggerClientEvent('sunny:police:playerVehicle', target, vehicle, value)
end)

ESX.RegisterServerCallback('sunny:police:vehicle:searchPlate', function(source, cb, plate)
    local vehicle = {}
    vehicle[plate] = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        if result[1] == nil then
            vehicle[plate] = {
                plate = plate,
                owner = 'Inconnu'
            }
            cb(vehicle[plate])
            return
        end
        for k,v in pairs(result) do
            MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
                ['@UniqueID'] = v.owner
            }, function(reuslt2)
                vehicle[plate] = {
                    plate = plate,
                    owner = ('%s %s'):format(reuslt2[1].firstname, reuslt2[1].lastname)
                }
                cb(vehicle[plate])
            end)
        end
    end)
end)


LSPD = {
    inService = {}
}

RegisterNetEvent('sunny:LSPD:service', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    if xPlayer.job.name ~= "police" then return end

    if not LSPD.inService[xPlayer.identifier] then
        LSPD.inService[xPlayer.identifier] = true
        for id, _ in pairs(LSPD.inService) do
            local targetPlayer = ESX.GetPlayerFromIdentifier(id)
            if targetPlayer and targetPlayer.job.name == xPlayer.job.name then
                TriggerClientEvent('esx:showNotification', targetPlayer.source, ('L\'employé ~y~%s~s~ a pris son service'):format(xPlayer.name))
            end
        end
    else
        LSPD.inService[xPlayer.identifier] = nil
        for id, _ in pairs(LSPD.inService) do
            local targetPlayer = ESX.GetPlayerFromIdentifier(id)
            if targetPlayer and targetPlayer.job.name == xPlayer.job.name then
                TriggerClientEvent('esx:showNotification', targetPlayer.source, ('L\'employé ~y~%s~s~ a fini son service'):format(xPlayer.name))
            end
        end
    end
end)

RegisterNetEvent('sunny:sendappel:jobLSPD', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    MySQL.Async.execute('INSERT INTO appel_jobs (job, raison, pos, plate) VALUES (@a, @b, @c, @d)', {
        ['@a'] = data.job,
        ['@b'] = data.raison,
        ['@c'] = json.encode(data.pos),
        ['@d'] = data.plate
    }, function() end)

    local message = ('Un nouvel appel a été fait : %s, Plaque : %s'):format(data.raison, data.plate)

    for id, _ in pairs(LSPD.inService) do
        local targetPlayer = ESX.GetPlayerFromIdentifier(id)
        if targetPlayer then
            if targetPlayer.job.name == 'police' then
                if SunnyLSPD.Police.Service then
                    TriggerClientEvent('esx:showNotification', targetPlayer.source, message)
                    TriggerClientEvent('soundmecano:playSound', source)
                end
            end
        end
    end
end)


RegisterNetEvent('sunny:police:giveweapon', function(name, label)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    if xPlayer.job.name ~= "police" and xPlayer.job.name ~= "gouvernement" then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'êtes pas policier')
        logsACJob.SendLogsACJob('weapon', ('%s a tenté de se give une arme ID Unique: **%s** (trigger: policegiveweapon)'):format(xPlayer.name, xPlayer.UniqueID))
        return
    end

    -- Vérifie si le joueur possède déjà l'arme
    if xPlayer.getInventoryItem(string.lower(name)).count > 0 then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez déjà pris cette arme de service')
        return
    end

    -- Donne l'arme au joueur
    xPlayer.addInventoryItem(string.lower(name), 1)
    TriggerClientEvent('esx:showNotification', source, 'Vous avez pris ' .. label)
    LogsJobFunc.SendLogsArmurie('LSPD_armu', ('**%s** vient de prendre une arme dans le casier x1 *%s*'):format(xPlayer.firstname .. " " .. xPlayer.lastname, label), 'take')
end)

AddEventHandler('playerDropped', function(reason)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if not xPlayer then return end

    -- Liste des armes à supprimer
    local weaponList = {
        'stungun',
        'kevlar',
        'nightstick',
        'flashlight',
        'combatpistolpol',
        'carbinerifle',
        'smg',
        'assaultsmg',
        'pumpshotgun',
        'bullpupshotgun'
    }

    for _, weapon in ipairs(weaponList) do
        if xPlayer.getInventoryItem(weapon).count > 0 then
            xPlayer.removeInventoryItem(weapon, xPlayer.getInventoryItem(weapon).count)
        end
    end

    LogsJobFunc.SendLogsArmurie('LSPD_armu', ('**%s %s** a été déconnecté et ses armes ont été retirées'):format(xPlayer.firstname, xPlayer.lastname), 'disconnect')
end)


RegisterNetEvent('sunny:police:renforts', function(coords, value)
     local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    local players = ESX.GetExtendedPlayers('job', 'police')
    for k,v in pairs(players) do
        TriggerClientEvent('sunny:police:renforts', v.source, coords, value)
    end
end)

RegisterNetEvent('sunny:police:removeItem', function(count, name, player, label)
        local xPlayer = ESX.GetPlayerFromId(source)
        local xPlayerTarget = ESX.GetPlayerFromId(player)
    if xPlayer.job.name ~= "police" and xPlayer.job.name ~= "gouvernement" then return end
    local m = ESX.GetPlayerFromId(source)
    if not SunnyConfigServ.PermanantWeapon[name] then
    if not m.canCarryItem(name, 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end	
    xPlayerTarget.removeInventoryItem(name, count)
    m.addInventoryItem(name, count)

    TriggerClientEvent('esx:showNotification', player, ('La police vous a saisis ~r~x%s~s~ %s'):format(count, label))
    end
end)

RegisterNetEvent('sunny:police.removeWeaponPerm', function(name, player, label)
        local xPlayer = ESX.GetPlayerFromId(source)
        local xPlayerTarget = ESX.GetPlayerFromId(player)
    if xPlayer.job.name ~= "police" then return end
    local m = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    if not SunnyConfigServ.PermanantWeapon[name] then
        if not xPlayerTarget then return end
    xPlayerTarget.removeWeapon(name)
    m.addInventoryItem(string.lower(name), 1)


    TriggerClientEvent('esx:showNotification', player, ('La police vous a saisis ~r~x%s~s~ %s'):format(1, label))
    end
end)

RegisterNetEvent('sunny:police:removeMoney', function(count, player)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerTarget = ESX.GetPlayerFromId(player)
    if xPlayer.job.name ~= "police" then return end
    local m = ESX.GetPlayerFromId(source)

    xPlayerTarget.removeAccountMoney('black_money', count)
    m.addAccountMoney('black_money', count)

    TriggerClientEvent('esx:showNotification', player, ('La police vous a saisis ~r~x%s~s~ %s'):format(count, 'd\'argent sale'))
end)

RegisterNetEvent('sunny:police:ppa', function(player)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    local targetPlayer = ESX.GetPlayerFromId(player)

    if targetPlayer.getAccount('bank').money < 25000 then return TriggerClientEvent('esx:showNotification', source, 'La personne n\'a a pas les sous néccéssaires') end

    targetPlayer.removeAccountMoney('bank', 25000)

    MySQL.Async.execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", {
        ['@type'] = 'weapon',
        ['@owner'] = targetPlayer.identifier
    })

    local society = Society:getSociety(xPlayer.job.name)

    if not society then return end

    society.addSocietyMoney(25000)
end)




RegisterNetEvent('sunny:police:sendCode', function(message)
            local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    local players = ESX.GetExtendedPlayers('job', 'police')

    for k,v in pairs(players) do
        TriggerClientEvent('esx:showNotification', v.source, ('~y~Code LSPD~s~\n%s'):format(message))

        TriggerClientEvent('sunny:police:sendCode', v.source)
    end
end)

ESX.RegisterServerCallback('sunny:police:amendes', function(source, cb, player)
    local xPlayer = ESX.GetPlayerFromId(source)
    local target = ESX.GetPlayerFromId(player)
    
    if not xPlayer or (xPlayer.job.name ~= "police" and xPlayer.job.name ~= "bcso") then 
        cb({})
        return 
    end

    if not target then 
        cb({})
        return 
    end

    MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier AND target = @target AND paid = 0', {
        ['@identifier'] = target.identifier,
        ['@target'] = 'society_police'
    }, function(result)
        if result and #result > 0 then
            cb(result)
        else
            cb({})
        end
    end)
end)

RegisterNetEvent('sunny:police.removeWeapon', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" and xPlayer.job.name ~= "gouvernement" then return end
    local xPlayerName = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname)

    -- Liste des armes à vérifier et à supprimer
    local weaponList = {
        {required_grade = 0, name = 'stungun'},
        {required_grade = 0, name = 'kevlar'},
        {required_grade = 0, name = 'nightstick'},
        {required_grade = 0, name = 'flashlight'},
        {required_grade = 1, name = 'combatpistolpol'},
        {required_grade = 4, name = 'carbinerifle'},
        {required_grade = 5, name = 'smg'},
        {required_grade = 6, name = 'assaultsmg'},
        {required_grade = 7, name = 'pumpshotgun'},
        {required_grade = 8, name = 'bullpupshotgun'}
    }

    -- Vérification et suppression des armes
    for _, weapon in ipairs(weaponList) do
        if xPlayer.getInventoryItem(weapon.name).count > 0 then
            xPlayer.removeInventoryItem(weapon.name, xPlayer.getInventoryItem(weapon.name).count)
        end
    end

    TriggerClientEvent('esx:showNotification', source, 'Vous avez rendu vos armes de service')
    LogsJobFunc.SendLogsArmurie('LSPD_armu', ('**%s** vient de rendre ses armes de service'):format(xPlayerName), 'pose')
end)



AddEventHandler('playerDropped', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if (not xPlayer) then return; end

    for k,v in pairs(SunnyLSPD.Police.weapons) do
        xPlayer.removeWeapon(v.name)
    end
end)

AddEventHandler('playerDropped', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if (not xPlayer) then return; end

    xPlayer.removeWeapon("WEAPON_MUSKET")
end)

RegisterNetEvent('sunny:police:radar', function(y)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    local xPlayerName = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname)

    if xPlayer.job.name ~= 'police' then return end

    if y == true then
        LogsJobFunc.SendLogsRadar(('**%s** vient de poser le radar'):format(xPlayerName), 'pose')
    else
        LogsJobFunc.SendLogsRadar(('**%s** vient de prendre le radar'):format(xPlayerName), 'pose')
    end

end)





RegisterNetEvent('sunny:police:saisi:perm', function(target)

    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)
   
    if not xPlayer then return end
    if xPlayer.job.name ~= "police" then return end
    local xPlayerName = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname)

    local time = os.time()

   
    MySQL.Async.fetchAll('SELECT * FROM weapon_confiscate WHERE uniqueid = @uniqueid', {
        ['@uniqueid'] = xTarget.UniqueID
    }, function(result)
        if result[1] then
            TriggerClientEvent('esx:showNotification', source, 'Ses armes sont déjà saisies')
        else
            MySQL.Async.execute(' INSERT INTO weapon_confiscate (uniqueid, weapon_name, time) VALUES (@a, @b, @c)', {
                ['@a'] = xTarget.UniqueID,
                ['@b'] = 'blc_enfaite',
                ['@c'] = time
            }, function()

                TriggerClientEvent('esx:showNotification', xTarget.source, 'Vos armes PERM ont été saisies')
               -- TriggerClientEvent('esx:showNotification', source, 'Vous avez saisi les armes PERM de la personne')
                TriggerEvent('sunny:inventory:getWeaponTime', xTarget.source)
            end)
            
        end
    end)

   

    --LogsJobFunc.SendLogsRadar(('**%s** vient de confisquer une arme perm'):format(xPlayerName), '')
end)

--RegisterCommand('checktime', function()
--    TriggerEvent('CheckTime')
--end)

RegisterNetEvent('CheckTime', function ()
  

    MySQL.Async.fetchAll('SELECT * FROM weapon_confiscate WHERE uniqueid = @uniqueid', {
        ['@uniqueid'] = 'xPlayer.UniqueID'
    }, function(result)
        for k,v in pairs(result) do
            if os.time() - v.time >  3600 then
                MySQL.Async.execute('DELETE FROM weapon_confiscate WHERE uniqueid = @uniqueid', {
                    ['@uniqueid'] = xPlayer.UniqueID
                }, function()
                end)
            else
            end
        end
    end)
end)

local JobsCam = {}
local bodyCams = {}
local carCams  = {}

-----------------------------------------------------------------------------------------
-- EVENT'S --
-----------------------------------------------------------------------------------------

RegisterNetEvent('wais:playerLoaded:bodycam', function()
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if Player.job.name == "police" or Player.job.name == "bcso" then
        if JobsCam[tostring(src)] == nil then
            JobsCam[tostring(src)] = false
        end
        TriggerClientEvent('wais:body:pload', src, bodyCams, carCams)
    end
end)

RegisterNetEvent('wais:jobCheck', function()
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if Player.job.name == "police" or Player.job.name == "bcso" then
        if JobsCam[tostring(src)] == nil then
            JobsCam[tostring(src)] = false
        end
    else
        if JobsCam[tostring(src)] ~= nil then
            JobsCam[tostring(src)] = nil
            if bodyCams[tostring(src)] ~= nil then
                bodyCams[tostring(src)] = nil
                TriggerJob(true, tostring(src), false)
            end
        end
    end
end)

RegisterNetEvent('wais:closeBodyCam:Inventory', function(source)
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if JobsCam[tostring(src)] then
        JobsCam[tostring(src)] = false
        if bodyCams[tostring(src)] ~= nil then
            bodyCams[tostring(src)] = nil
            TriggerJob(true, tostring(src), false)
            TriggerClientEvent('esx:showNotification', src, SunnyLSPD.Police.Camera.Lang["bodycam-off"])
        end
    end
end)

RegisterNetEvent('wais:addDashCam', function(carId, plate, boneId)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    
    if carCams[carId] == nil then
        TriggerClientEvent('esx:showNotification', src, SunnyLSPD.Police.Camera.Lang["dashcam-on"])
        carCams[carId] = {bone = boneId, plate = plate, names = Player.variables.firstName .. ' ' .. Player.variables.lastName}
        TriggerJob(false, carId, true)
    else
        TriggerClientEvent('esx:showNotification', src, SunnyLSPD.Police.Camera.Lang["dashcam-off"])
        TriggerEvent('wais:removeTable:DashCam:s', tostring(carId))
    end
end)

RegisterNetEvent('wais:removeTable:DashCam:s', function(tableId)
    if carCams[tableId] ~= nil then
        carCams[tableId] = nil
        TriggerJob(false, tableId, false)
    end
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    if JobsCam[tostring(src)] ~= nil then
        JobsCam[tostring(src)] = nil
        if bodyCams[tostring(src)] ~= nil then
            bodyCams[tostring(src)] = nil
            TriggerJob(true, tostring(src), false)
        end
    end
end)

-----------------------------------------------------------------------------------------
-- CALLBACK'S --
-----------------------------------------------------------------------------------------

ESX.RegisterServerCallback('wais:getCoords', function(source, cb, id)
    local ped = GetPlayerPed(id)
    local playerCoords = GetEntityCoords(ped)
    cb(playerCoords)
end)

ESX.RegisterServerCallback('wais:getCoordsCar', function(source, cb, id)
    local coords = GetEntityCoords(NetworkGetEntityFromNetworkId(id))
    cb(coords)
end)

ESX.RegisterUsableItem(SunnyLSPD.Police.Camera.Items.bodycam, function(source, item)
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if JobsCam[tostring(src)] ~= nil then
        if not JobsCam[tostring(src)] then
            JobsCam[tostring(src)] = true
            if bodyCams[tostring(src)] == nil then
                bodyCams[tostring(src)] = {gradeLabel = Player.job.grade_label, names = Player.variables.firstName .. ' ' .. Player.variables.lastName}
                TriggerJob(true, tostring(src), true)
                TriggerClientEvent('esx:showNotification', src, SunnyLSPD.Police.Camera.Lang["bodycam-on"])
            end
        else
            JobsCam[tostring(src)] = false
            if bodyCams[tostring(src)] ~= nil then
                bodyCams[tostring(src)] = nil
                TriggerJob(true, tostring(src), false)
                TriggerClientEvent('esx:showNotification', src, SunnyLSPD.Police.Camera.Lang["bodycam-off"])
            end
        end
    end
end)

ESX.RegisterUsableItem(SunnyLSPD.Police.Camera.Items.dashcam, function(source, item)
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if JobsCam[tostring(src)] ~= nil then
        TriggerClientEvent('wais:AddOrRemove:DashCam', src)
    end
end)

-----------------------------------------------------------------------------------------
-- FUNCTION'S --
-----------------------------------------------------------------------------------------

function TriggerJob(bodyCam, tableId, add)
    if bodyCam then
        for k, v in pairs(JobsCam) do
            if add then
                TriggerClientEvent('wais:addTable:BodyCam', k, tableId, bodyCams[tableId])
            else
                TriggerClientEvent('wais:removeTable:BodyCam', k, tableId)
            end
        end
    else
        for k, v in pairs(JobsCam) do
            if add then
                TriggerClientEvent('wais:addTable:DashCam', k, tableId, carCams[tableId])
            else
                TriggerClientEvent('wais:removeTable:DashCam', k, tableId)
            end
        end
    end
end

-----------------------------------------------------------------------------------------
-- COMMAND'S --
-----------------------------------------------------------------------------------------