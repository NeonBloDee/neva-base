function SunnyDrugs.IsOnPoint(playerCoords, points)
    for _, point in ipairs(points) do
        if #(playerCoords - point) < 5.0 then 
            return true
        end
    end
    return false
end

RegisterNetEvent('sunny:drugs:drugs')
AddEventHandler('sunny:drugs:drugs', function(item, type)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local playerCoords = GetEntityCoords(GetPlayerPed(source))

    local validPoints = SunnyDrugs.Drugs[item][type]
    if not SunnyDrugs.IsOnPoint(playerCoords, validPoints) then
        DropPlayer(source, "Vous avez été déconnecté pour avoir tenté d'utiliser les triggers sans être sur les points.")
        return
    end

    local count = 0
    local total = 1

    if boost_farm.have(xPlayer.UniqueID) then
        total = total * 2 
    end

    if type == 'recolte' then
        count = math.random(1, 3) * total

        if not xPlayer.canCarryItem(SunnyDrugs.Items[item][type].name, 1) then 
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") 
            return 
        end

        xPlayer.addInventoryItem(SunnyDrugs.Items[item][type].name, count)
        TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez récolté ~y~+%s~s~ %s'):format(count, SunnyDrugs.Items[item][type].label))
        sendLog(('Le Joueur (%s - %s) récolte la drogue (x%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, count, SunnyDrugs.Items[item][type].label), {
            author = 'Drogues',
            fields = {
                {title = 'Player', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'reco_drogue'
        })
    elseif type == 'recolte1' then
        count = math.random(1, 3) * total

        if not xPlayer.canCarryItem(SunnyDrugs.Items[item][type].name, 1) then 
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") 
            return 
        end

        xPlayer.addInventoryItem(SunnyDrugs.Items[item][type].name, count)
        TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez récolté ~y~+%s~s~ %s'):format(count, SunnyDrugs.Items[item][type].label))
        sendLog(('Le Joueur (%s - %s) récolte la drogue (x%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, count, SunnyDrugs.Items[item][type].label), {
            author = 'Drogues',
            fields = {
                {title = 'Player', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'reco_drogue'
        })
    elseif type == 'recolte2' then
        count = math.random(1, 3) * total

        if not xPlayer.canCarryItem(SunnyDrugs.Items[item][type].name, 1) then 
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") 
            return 
        end

        xPlayer.addInventoryItem(SunnyDrugs.Items[item][type].name, count)
        TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez récolté ~y~+%s~s~ %s'):format(count, SunnyDrugs.Items[item][type].label))
        sendLog(('Le Joueur (%s - %s) récolte la drogue (x%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, count, SunnyDrugs.Items[item][type].label), {
            author = 'Drogues',
            fields = {
                {title = 'Player', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'reco_drogue'
        })
    elseif type == 'recolte3' then
        count = math.random(1, 3) * total

        if not xPlayer.canCarryItem(SunnyDrugs.Items[item][type].name, 1) then 
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") 
            return 
        end

        xPlayer.addInventoryItem(SunnyDrugs.Items[item][type].name, count)
        TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez récolté ~y~+%s~s~ %s'):format(count, SunnyDrugs.Items[item][type].label))
        sendLog(('Le Joueur (%s - %s) récolte la drogue (x%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, count, SunnyDrugs.Items[item][type].label), {
            author = 'Drogues',
            fields = {
                {title = 'Player', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'reco_drogue'
        })
    elseif type == 'recolte4' then
        count = math.random(1, 3) * total

        if not xPlayer.canCarryItem(SunnyDrugs.Items[item][type].name, 1) then 
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") 
            return 
        end

        xPlayer.addInventoryItem(SunnyDrugs.Items[item][type].name, count)
        TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez récolté ~y~+%s~s~ %s'):format(count, SunnyDrugs.Items[item][type].label))
        sendLog(('Le Joueur (%s - %s) récolte la drogue (x%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, count, SunnyDrugs.Items[item][type].label), {
            author = 'Drogues',
            fields = {
                {title = 'Player', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'reco_drogue'
        })
    elseif type == 'traitement' then
        local requiredAmount = 3 * total
        local itemsRecolte = {} -- Liste des récoltes
        local totalRecoltes = 5 -- Nombre de récoltes (recolte, recolte1, recolte2, etc.)
    
        -- Récupère toutes les récoltes définies
        for i = 0, totalRecoltes - 1 do
            local key = i == 0 and 'recolte' or 'recolte' .. i
            if SunnyDrugs.Items[item][key] then
                table.insert(itemsRecolte, SunnyDrugs.Items[item][key])
            end
        end
    
        -- Vérifie si le joueur possède assez de chaque récolte
        for _, recolte in ipairs(itemsRecolte) do
            if xPlayer.getInventoryItem(recolte.name).count < requiredAmount then
                TriggerClientEvent('esx:showNotification', source, ('⚠️ Vous ne possédez pas assez de ~y~%s~s~ pour traiter'):format(recolte.label))
                TriggerClientEvent('framework:stopActivity', source) -- Arrêt du farm côté client
                return
            end
        end
    
        -- Vérifie si le joueur peut transporter l'item traité
        if not xPlayer.canCarryItem(SunnyDrugs.Items[item][type].name, total) then 
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") 
            return 
        end
    
        -- Retire les items nécessaires
        for _, recolte in ipairs(itemsRecolte) do
            xPlayer.removeInventoryItem(recolte.name, requiredAmount)
        end
    
        -- Ajoute l'item traité
        xPlayer.addInventoryItem(SunnyDrugs.Items[item][type].name, total)
        TriggerClientEvent('esx:showNotification', source, ('🌿 ~y~x%s~s~ %s'):format(total, SunnyDrugs.Items[item][type].label))
        
        -- Logs
        sendLog(('Le Joueur (%s - %s) traite la drogue (x%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, total, SunnyDrugs.Items[item][type].label), {
            author = 'Drogues',
            fields = {
                {title = 'Player', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'trait_drogue'
        })
    end     
end)

RegisterNetEvent('sunny:drugs:addTable')
AddEventHandler('sunny:drugs:addTable', function(table)
    SunnyDrugs.Items = table
end)
