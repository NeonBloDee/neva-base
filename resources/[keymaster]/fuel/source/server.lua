local ESX = exports['frwk']:getSharedObject()

RegisterNetEvent("dsco_fuel:pay", function(amount, fuel)
    local xPlayer = ESX.GetPlayerFromId(source)
    local source = source

    if xPlayer.getMoney() < amount then
        xPlayer.showNotification('~r~Insuffisant\n~w~Vous n\'avez pas assez d\'argent pour faire le plein.')
        return
    else
        xPlayer.removeAccountMoney("money", amount)
    end

    xPlayer.showNotification('~g~Station-service\n~w~Vous avez payé ~g~' .. math.floor(amount) .. '$~w~ pour mettre de l\'essence.')
end)
