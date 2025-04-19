-- RegisterNetEvent('sunny:FreezePlayer', function(target)
--     if IsEntityPositionFrozen(NetworkGetEntityFromNetworkId(target)) then
--         TriggerClientEvent('sunny:freeze', target, false)
--     else
--         TriggerClientEvent('sunny:freeze', target, true)
--     end
-- end)

ESX.RegisterServerCallback('sunny:getTargetId', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(target)
    if xPlayer then
        local targetId = xPlayer.UniqueID
        cb(targetId)
    else
        cb(nil)
    end
end)