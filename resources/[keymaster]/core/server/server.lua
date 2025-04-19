RegisterNetEvent('sunny:admin:executeServerCommand')
AddEventHandler('sunny:admin:executeServerCommand', function(command)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'fondateur' then
        ExecuteCommand(command)
    end
end)