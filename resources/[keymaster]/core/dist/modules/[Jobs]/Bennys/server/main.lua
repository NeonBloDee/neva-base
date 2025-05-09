Bennys = {
    inService = {}
}

RegisterNetEvent('sunny:bennys:service', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    if ESX.PlayerData.job.name == 'garage_octacyp'
        or ESX.PlayerData.job.name == 'garage_lscustom'
        or ESX.PlayerData.job.name == 'garage_speedhunters'
        or ESX.PlayerData.job.name == 'garage_paletocustoms'
        or ESX.PlayerData.job.name == 'garage_eastcustoms'
        or ESX.PlayerData.job.name == 'garage_driveline' then return end

    if not Bennys.inService[xPlayer.identifier] then
        Bennys.inService[xPlayer.identifier] = true
        for id, _ in pairs(Bennys.inService) do
            local targetPlayer = ESX.GetPlayerFromIdentifier(id)
            if targetPlayer and targetPlayer.job.name == xPlayer.job.name then
                TriggerClientEvent('esx:showNotification', targetPlayer.source, ('L\'employé ~y~%s~s~ a pris son service'):format(xPlayer.name))
            end
        end
    else
        Bennys.inService[xPlayer.identifier] = nil
        for id, _ in pairs(Bennys.inService) do
            local targetPlayer = ESX.GetPlayerFromIdentifier(id)
            if targetPlayer and targetPlayer.job.name == xPlayer.job.name then
                TriggerClientEvent('esx:showNotification', targetPlayer.source, ('L\'employé ~y~%s~s~ a fini son service'):format(xPlayer.name))
            end
        end
    end
end)

RegisterNetEvent('sunny:checkVehiclePlate', function(plate)
    local source = source

    MySQL.Async.fetchScalar('SELECT 1 FROM appel_jobs WHERE plate = @plate LIMIT 1', {
        ['@plate'] = plate
    }, function(result)
        local exists = result ~= nil
        TriggerClientEvent('sunny:checkVehiclePlateResult', source, plate, exists)
    end)
end)

RegisterNetEvent('sunny:sendappel:job', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    MySQL.Async.execute('INSERT INTO appel_jobs (job, raison, pos, plate) VALUES (@a, @b, @c, @d)', {
        ['@a'] = data.job,
        ['@b'] = data.raison,
        ['@c'] = json.encode(data.pos),
        ['@d'] = data.plate
    }, function() end)

    local message = ('Un nouvel appel a été fait : %s '):format(data.raison, data.plate)

    for id, _ in pairs(Bennys.inService) do
        local targetPlayer = ESX.GetPlayerFromIdentifier(id)
        if targetPlayer and Bennys.inService[id] and (
            targetPlayer.job.name == "garage_octacyp"
            or targetPlayer.job.name == "garage_lscustom"
            or targetPlayer.job.name == "garage_speedhunters"
            or targetPlayer.job.name == "garage_paletocustoms"
            or targetPlayer.job.name == "garage_eastcustoms"
            or targetPlayer.job.name == "garage_driveline"
        ) then
            TriggerClientEvent('esx:showNotification', targetPlayer.source, message)
            TriggerClientEvent('soundmecano:playSound', source)
        end
    end
end)

-- ESX.RegisterServerCallback('sunny:custom:getVehiclesPrices', function(source, cb)
--     local vehicle = {}

--     MySQL.Async.fetchAll('SELECT * FROM vehicules', {}, function(result)
--         for k,v in pairs(result) do
--             table.insert(vehicle, v)
--         end

--         cb(vehicle)
--     end)
-- end)

RegisterNetEvent('sunny:bennys:repairVehicle', function(plate)
    local xPlayer = ESX.GetPlayerFromId(source)

    if ESX.PlayerData.job.name == 'garage_octacyp'
        or ESX.PlayerData.job.name == 'garage_lscustom'
        or ESX.PlayerData.job.name == 'garage_speedhunters'
        or ESX.PlayerData.job.name == 'garage_paletocustoms'
        or ESX.PlayerData.job.name == 'garage_eastcustoms'
        or ESX.PlayerData.job.name == 'garage_driveline' then
            DropPlayer(source, 'Tu cheat pour repair ??')
        return 
    end

    if not xPlayer then return end

    sendLog(('Réparation de véhicule bennys (%s - %s)'):format(xPlayer.name, xPlayer.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Plaque du véhicule', subtitle = plate},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'bennys_repair_vehicle'
    })
end)




ESX.RegisterServerCallback('sunny:appelRetreive:job', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        -- print("Erreur: xPlayer est nul")
        cb({})
        return
    end

    local job = xPlayer.job.name
    local query = 'SELECT * FROM appel_jobs WHERE job = @job'

    MySQL.Async.fetchAll(query, {['@job'] = job}, function(result)
        local calls = {}
        for k, v in pairs(result) do
            table.insert(calls, {
                job = v.job,
                raison = v.raison,
                pos = json.decode(v.pos),
                id = v.id,
            })
        end
        cb(calls)
    end)
end)




RegisterNetEvent('sunny:bande:clearlatable')
AddEventHandler('sunny:bande:clearlatable', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then 
        -- print('Erreur : Joueur non trouvé.')
        return 
    end

    local job = xPlayer.job.name
    local query = ''

    if job == 'police' then
        query = 'DELETE FROM appel_jobs WHERE job = @job'
    elseif job == 'garage_octacyp'
        or job == 'garage_lscustom'
        or job == 'garage_speedhunters'
        or job == 'garage_paletocustoms'
        or job == 'garage_eastcustoms'
        or job == 'garage_driveline' then
        query = 'DELETE FROM appel_jobs WHERE job = @job'
    else
        DropPlayer(source, "Accès refusé : Vous n'avez pas les autorisations nécessaires.")
        return
    end

    MySQL.Async.execute(query, {['@job'] = job}, function(rowsChanged)
        if rowsChanged then
            TriggerClientEvent('esx:showNotification', source, 'Les lignes de la table appel_jobs correspondant à votre job ont été supprimées avec succès.')
        else
            -- print('Erreur lors de la suppression des lignes dans la table appel_jobs')
        end
    end)
end)


RegisterNetEvent('sunny:appelDelete:job')
AddEventHandler('sunny:appelDelete:job', function(id)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    local job = xPlayer.job.name
    local query = ''

    if job == 'police' then
        query = 'DELETE FROM appel_jobs WHERE id = @id AND job = @job'
    elseif job == 'garage_octacyp'
        or job == 'garage_lscustom'
        or job == 'garage_speedhunters'
        or job == 'garage_paletocustoms'
        or job == 'garage_eastcustoms'
        or job == 'garage_driveline' then
            query = 'DELETE FROM appel_jobs WHERE id = @id AND job = @job'
    else
        -- print("Erreur: xPlayer n'a pas le bon job")
        return
    end

    MySQL.Async.execute(query, {['@id'] = id, ['@job'] = job}, function(rowsChanged)
        if rowsChanged > 0 then
            -- print("Nombre de lignes supprimées:", rowsChanged)
        else
            -- print("Erreur: Aucune ligne supprimée. Assurez-vous que l'ID et le job sont corrects.")
        end
    end)

    sendLog(('Delete Appel (%s - %s)'):format(xPlayer.name, xPlayer.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = "ID de l'appel", subtitle = id},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'bennys_delete_appel'
    })
end)
