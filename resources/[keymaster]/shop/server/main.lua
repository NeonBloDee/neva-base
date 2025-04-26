ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

function OpenShopForPlayer(source, shopType)
    local filteredItems = {}
    for _, item in pairs(Config.Items) do
        if item.shop == shopType then
            local itemData = {
                label = item.label,
                name = item.name,
                price = item.price,
                categorie = item.categorie,
                shop = item.shop,
                type = item.type,
                image = item.image,
                defaultQuantity = item.defaultQuantity or 1
            }
            table.insert(filteredItems, itemData)
        end
    end

    TriggerClientEvent('shop:openMenu', source, filteredItems, shopType)
end

RegisterServerEvent('shop:requestItems')
AddEventHandler('shop:requestItems', function(shopType)
    local _source = source
    OpenShopForPlayer(_source, shopType)
end)

RegisterServerEvent('shop:checkMoney')
AddEventHandler('shop:checkMoney', function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local total = tonumber(data.total)
    local items = data.items

    if xPlayer.getMoney() >= total then
        for _, item in pairs(items) do
            if item.type == "item" then
                local isAmmo = string.match(item.itemName, "_ammo$")
                if isAmmo then
                    for _, configItem in pairs(Config.Items) do
                        if configItem.name == item.itemName then
                            local finalQuantity = (configItem.defaultQuantity or 1) * item.quantity
                            xPlayer.addInventoryItem(item.itemName, finalQuantity)
                            xPlayer.removeAccountMoney('cash', total)
                            TriggerClientEvent('shop:checkoutResult', src, true)
                            TriggerClientEvent('esx:showNotification', src, ('Vous avez acheté %sx %s pour ~g~%s$'):format(finalQuantity, item.label, total))
                            goto continue
                        end
                    end
                else
                    if item.itemName == "snspistol" then
                        if exports['core']:haveVip(xPlayer.UniqueID) then
                            xPlayer.removeAccountMoney('cash', total)
                            xPlayer.addInventoryItem(item.itemName, item.quantity)
                            TriggerClientEvent('shop:checkoutResult', src, true)
                            TriggerClientEvent('esx:showNotification', src, 'Vous avez acheté '..item.quantity..'x '..item.label.. ' pour ~g~'..total..'$')
                        else
                            TriggerClientEvent('esx:showNotification', src, "~r~Vous n'êtes pas VIP")
                        end
                    else
                        xPlayer.addInventoryItem(item.itemName, item.quantity)
                        xPlayer.removeAccountMoney('cash', total)
                        TriggerClientEvent('shop:checkoutResult', src, true)
                        TriggerClientEvent('esx:showNotification', src, 'Vous avez acheté '..item.quantity..'x '..item.label.. ' pour ~g~'..total..'$')
                    end
                end
            elseif item.type == "weapon" then
                xPlayer.addInventoryItem(string.lower(item.itemName), 1)
                xPlayer.removeAccountMoney('cash', total)
                TriggerClientEvent('shop:checkoutResult', src, true)
                TriggerClientEvent('esx:showNotification', src, 'Vous avez acheté '..item.itemName..' pour ~g~'..total..'$')
            elseif item.type == "props" then
                print('Adding Props:', item.label, 'Quantity:', item.quantity)
                MySQL.Async.execute('INSERT INTO players_props (UniqueID, data, name) VALUES (@UniqueID, @data, @name)', {
                    ['@UniqueID'] = xPlayer.UniqueID,
                    ['@data'] = json.encode({label = item.label, name = item.itemName, owner = xPlayer.UniqueID, count = item.quantity}),
                    ['@name'] = item.itemName
                })
                xPlayer.removeAccountMoney('cash', total)
                TriggerClientEvent('shop:checkoutResult', src, true)
                TriggerClientEvent('esx:showNotification', src, 'Vous avez acheté des articles pour ~g~'..total..'$')

            else
                print('Unknown item type:', item.type)
            end
            ::continue::
        end
    else
        TriggerClientEvent('shop:checkoutResult', src, false)
        TriggerClientEvent('esx:showNotification', src, 'Vous n\'avez pas assez d\'argent.')
    end
end)