ESX.RegisterServerCallback('sunny:bcso:search', function(source, cb, player)
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

        TriggerClientEvent('esx:showNotification', targetPlayer.source, '👮 La bcso vous fouille')
    else
        cb(false)
    end
end)

RegisterNetEvent('Bcso:ForcerId')
AddEventHandler('Bcso:ForcerId', function(id)
    local _src = source
    TriggerClientEvent('montrer:identity', id)
end)

RegisterNetEvent('Bcso:ForcerDrive')
AddEventHandler('Bcso:ForcerDrive', function(id)
    local _src = source
    TriggerClientEvent('montrer:drive', id)
end)

RegisterNetEvent('sunny:bcso:menotter', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end
    local targetPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent('sunny:bcso:menotter', targetPlayer.source)
end)

RegisterNetEvent('sunny:bcso:plainte:register', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end

    MySQL.Async.execute('INSERT INTO bcso_plainte (name, date, numberphone, reason, author) VALUES (@name, @date, @numberphone, @reason, @author)', {
        ['@name'] = data.name, 
        ['@date'] = data.date,
        ['@numberphone'] = data.numberphone, 
        ['@reason'] = data.reason,
        ['@author'] = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname),
    }, function()
        TriggerClientEvent('esx:showNotification', source, '📝 Plainte enregistrée avec succès')
    end)
end)

ESX.RegisterServerCallback('sunny:bcso:plainte:get', function(source, cb)
    local plaintes = {}

    MySQL.Async.fetchAll('SELECT * FROM bcso_plainte', {}, function(result)
        for k,v in pairs(result) do
            table.insert(plaintes, v)
        end

        cb(plaintes)
    end)
end)

RegisterNetEvent('sunny:bcso:plainte:delete', function(id)
    local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end
    MySQL.Async.execute('DELETE FROM bcso_plainte WHERE id = @id', {
        ['@id'] = id
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'Plainte supprimée avec succès')
    end)
end)

RegisterNetEvent('sunny:bcso:plainte:editReason', function(id, newReason)
    local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end
    MySQL.Async.execute('UPDATE bcso_plainte SET reason = @reason WHERE id = @id', {
        ['@id'] = id,
        ['@reason'] = newReason
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'La raison de la plainte a bien était modifiée')
    end)
end)

RegisterNetEvent('sunny:bcso:escoter', function(target)
    local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end
    TriggerClientEvent('sunny:bcso:escoter', target, source)
end)

RegisterNetEvent('sunny:bcso:playerVehicle', function(target, vehicle, value)
    TriggerClientEvent('sunny:bcso:playerVehicle', target, vehicle, value)
end)

ESX.RegisterServerCallback('sunny:bcso:vehicle:searchPlate', function(source, cb, plate)
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



RegisterNetEvent('sunny:bcso:service', function(value)
    local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end
    local players = ESX.GetExtendedPlayers('job', 'bcso')

    for k,v in pairs(players) do
        if value == true then
            TriggerClientEvent('esx:showNotification', v.source, ('L\'agent ~y~%s~s~ vient de prendre son service ~p~bcso'):format(GetPlayerName(source)))
        else
            TriggerClientEvent('esx:showNotification', v.source, ('L\'agent ~y~%s~s~ vient de finir son service ~p~bcso'):format(GetPlayerName(source)))
        end
    end
end)

AddEventHandler('playerDropped', function(reason)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if not xPlayer then return end

    local weaponList = {
        'stungun',
        'kevlar',
        'nightstick',
        'flashlight',
        'vintagepistol',
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

RegisterNetEvent('sunny:bcso.removeWeapon', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "saspn" and xPlayer.job.name ~= "bcso" then return end
    local xPlayerName = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname)

    local weaponList = {
        {required_grade = 0, name = 'stungun'},
        {required_grade = 0, name = 'kevlar'},
        {required_grade = 0, name = 'nightstick'},
        {required_grade = 0, name = 'flashlight'},
        {required_grade = 1, name = 'vintagepistol'},
        {required_grade = 4, name = 'carbinerifle'},
        {required_grade = 5, name = 'smg'},
        {required_grade = 6, name = 'assaultsmg'},
        {required_grade = 7, name = 'pumpshotgun'},
        {required_grade = 8, name = 'bullpupshotgun'}
    }

    for _, weapon in ipairs(weaponList) do
        if xPlayer.getInventoryItem(weapon.name).count > 0 then
            xPlayer.removeInventoryItem(weapon.name, xPlayer.getInventoryItem(weapon.name).count)
        end
    end

    TriggerClientEvent('esx:showNotification', source, 'Vous avez rendu vos armes de service')
    LogsJobFunc.SendLogsArmurie('LSPD_armu', ('**%s** vient de rendre ses armes de service'):format(xPlayerName), 'pose')
end)

RegisterNetEvent('sunny:bcso:giveweapon', function(name, label)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.job.name ~= "saspn" and xPlayer.job.name ~= "bcsosandy" then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'êtes pas BCSO')
        logsACJob.SendLogsACJob('weapon', ('%s a tenté de se give une arme ID Unique: **%s** (trigger: policegiveweapon)'):format(xPlayer.name, xPlayer.UniqueID))
        return
    end

    if xPlayer.getInventoryItem(string.lower(name)).count > 0 then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez déjà pris cette arme de service')
        return
    end

    xPlayer.addInventoryItem(string.lower(name), 1)
    TriggerClientEvent('esx:showNotification', source, 'Vous avez pris ' .. label)
    LogsJobFunc.SendLogsArmurie('LSPD_armu', ('**%s** vient de prendre une arme dans le casier x1 *%s*'):format(xPlayer.firstname .. " " .. xPlayer.lastname, label), 'take')
end)

RegisterNetEvent('sunny:bcso:giveammo', function(name, label, quantity)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.job.name ~= "saspn" and xPlayer.job.name ~= "bcsosandy" then
        LogsJobFunc.SendLogsArmurie('BCSO_AntiCheat', ('**%s %s** a tenté de récupérer des munitions sans être en service BCSO'):format(xPlayer.firstname, xPlayer.lastname), 'anticheat')
        return
    end

    xPlayer.addInventoryItem(string.lower(name), quantity)
    TriggerClientEvent('esx:showNotification', source, ('Vous avez pris x%s %s'):format(quantity, label))
    LogsJobFunc.SendLogsArmurie('BCSO_armu', ('**%s %s** vient de prendre des munitions x%s *%s*'):format(xPlayer.firstname, xPlayer.lastname, quantity, label), 'take')
end)


RegisterNetEvent('sunny:bcso:renforts', function(coords, value)
        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end
    local players = ESX.GetExtendedPlayers('job', 'bcso')
    for k,v in pairs(players) do
        TriggerClientEvent('sunny:bcso:renforts', v.source, coords, value)
    end
end)

RegisterNetEvent('sunny:bcso:removeItem', function(count, name, player, label)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerTarget = ESX.GetPlayerFromId(player)
    if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end
    local m = ESX.GetPlayerFromId(source)
    if not SunnyConfigServ.PermanentItem[name] then
    if not m.canCarryItem(name, 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end
    xPlayerTarget.removeInventoryItem(name, count)
    m.addInventoryItem(name, count)

    TriggerClientEvent('esx:showNotification', player, ('La bcso vous a saisis ~r~x%s~s~ %s'):format(count, label))
    end
end)

RegisterNetEvent('sunny:bcso.removeWeapon', function(name, player, label)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerTarget = ESX.GetPlayerFromId(player)
    if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end
    local m = ESX.GetPlayerFromId(source)
    if not SunnyConfigServ.PermanantWeapon[name] then
    xPlayerTarget.removeWeapon(name)
    m.addInventoryItem(string.lower(name), 1)


    TriggerClientEvent('esx:showNotification', player, ('La bcso vous a saisis ~r~x%s~s~ %s'):format(1, label))
    end
end)

RegisterNetEvent('sunny:bcso:removeMoney', function(count, player)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerTarget = ESX.GetPlayerFromId(player)
    if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end
    local m = ESX.GetPlayerFromId(source)

    xPlayerTarget.removeAccountMoney('black_money', count)
    m.addAccountMoney('black_money', count)

    TriggerClientEvent('esx:showNotification', player, ('La bcso vous a saisis ~r~x%s~s~ %s'):format(count, 'd\'argent sale'))
end)

RegisterNetEvent('sunny:bcso:ppa', function(player)
    
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end
    local targetPlayer = ESX.GetPlayerFromId(player)

    if targetPlayer.getAccount('bank') < 25000 then TriggerClientEvent('esx:showNotification', source, 'La personne n\'a a pas les sous néccéssaires') return end

    targetPlayer.removeAccountMoney('bank', 25000)

    local society = Society:getSociety(xPlayer.job.name)

    if not society then return end

    society.addSocietyMoney(25000)
end)

RegisterNetEvent('sunny:bcso:sendCode', function(message)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer.job.name == "saspn" or not xPlayer.job.name == "bcsosandy" then return end
    local players = ESX.GetExtendedPlayers('job', 'bcso')

    for k,v in pairs(players) do
        TriggerClientEvent('esx:showNotification', v.source, ('~y~Code bcso~s~\n%s'):format(message))

        TriggerClientEvent('sunny:bcso:sendCode', v.source)
    end
end)