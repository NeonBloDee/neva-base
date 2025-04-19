local isUiOpen = false

function OpenShop(shopType)
    TriggerServerEvent('shop:requestItems', shopType)
end

RegisterNetEvent('shop:openMenu')
AddEventHandler('shop:openMenu', function(items, shopType)
    if not isUiOpen then
        local formattedItems = {}
        for _, item in pairs(items) do
            local displayQuantity = item.quantity or 1
            if item.defaultQuantity then
                displayQuantity = displayQuantity * item.defaultQuantity
            end
            
            local itemData = {
                label = item.label,
                name = item.name,
                price = item.price,
                categorie = item.categorie,
                type = item.type,
                image = item.image,
                quantity = displayQuantity,
                defaultQuantity = item.defaultQuantity
            }
            table.insert(formattedItems, itemData)
        end

        SetNuiFocus(true, true)
        SendNuiMessage(json.encode({
            action = 'open',
            items = formattedItems,
            shopType = shopType
        }))
        isUiOpen = true
    else   
        SetNuiFocus(false, false)
        SendNuiMessage(json.encode({
            action = 'close'
        }))
        isUiOpen = false
    end
end)

RegisterNetEvent('shop:openShop')
AddEventHandler('shop:openShop', function(shopType)
    OpenShop(shopType)
end)

RegisterNUICallback('focusField', function(data, cb)
    SetNuiFocus(true, true)
    cb('ok')
end)

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    SendNuiMessage(json.encode({
        action = 'close'
    }))
    isUiOpen = false
end)

RegisterNUICallback('closeall', function()
    SetNuiFocus(false, false)
    SendNuiMessage(json.encode({
        action = 'close'
    }))
    isUiOpen = false
end)

CreateThread(function()
    while true do
        Wait(0)
        if isUiOpen then
            if IsControlJustPressed(0, 177) then -- Touche ECHAP
                SetNuiFocus(false, false)
                SendNuiMessage(json.encode({
                    action = 'close'
                }))
                isUiOpen = false
            end
        end
    end
end)

RegisterNUICallback('checkMoney', function(data, cb)
    TriggerServerEvent('shop:checkMoney', data)
    cb('ok')
end)

RegisterNetEvent('shop:checkoutResult')
AddEventHandler('shop:checkoutResult', function(success)
    if success then
        SendNuiMessage(json.encode({
            action = 'clearCart'
        }))
        SetNuiFocus(false, false)
        isUiOpen = false
    else
        TriggerEvent('esx:showNotification', 'Vous n\'avez pas assez d\'argent.')
    end
end)
