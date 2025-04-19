CreateThread(function()
    for k,v in pairs(SunnyConfigServ.Fishing.fishList.FishingLures) do
        ESX.RegisterUsableItem(v.name, function(source)
            TriggerClientEvent('SunnyServ:fishing:lures:activate', source, {k, v.name, v.label})
        end)
    end

    RegisterNetEvent('SunnyServ:fishing:lures:remove', function(lures)
        local source = source
        local player = ESX.GetPlayerFromId(source)

        if not player then return end

        player.removeInventoryItem(lures, 1)
    end)

    RegisterNetEvent('SunnyServ:fishing:fish:give', function(fish, fishLabel, canName)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer then return end
        if not xPlayer.canCarryItem(fish, 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end
        xPlayer.addInventoryItem(fish, 1)

        fishing.players[xPlayer.UniqueID].level += 1

        for k,v in pairs(SunnyConfigServ.Fishing.fishList.FishingRod) do
            if v.name == canName then
                if v.boutique == false then
                    xPlayer.updateItemMetadata(v.name, {
                        fish = xPlayer.getInventoryItem(v.name).extra.fish or 0 + 1
                    })

                    TriggerClientEvent('SunnyServ:fishing:updateRod', source, xPlayer.getInventoryItem(v.name).extra.fish or 0 + 1)

                    if xPlayer.getInventoryItem(v.name).extra.fish >= v.fish then
                        xPlayer.removeInventoryItem(v.name, 1)
                        xPlayer.showNotification('Votre canne à pêche s\'est cassée')
                        TriggerClientEvent('SunnyServ:fishing:client:stop', source)
                    end

                    return
                end
            end
        end

        MySQL.Async.execute('UPDATE fishing SET level = @level WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = xPlayer.UniqueID,
            ['@level'] = fishing.players[xPlayer.UniqueID].level
        }, function()
            TriggerClientEvent('SunnyServ:fishing:client:updateLevel', source, fishing.players[xPlayer.UniqueID].level)

            xPlayer.showNotification(('Vous avez pêché un poisson: ~p~%s~s~'):format(fishLabel))
            xPlayer.showNotification('+1 XP de pêche. Continue comme sa Pêcheur!')
        end)
    end)
end)