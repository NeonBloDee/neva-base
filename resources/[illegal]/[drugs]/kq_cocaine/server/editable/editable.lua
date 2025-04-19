
local function OnCementUse(player, item)
    TriggerClientEvent('kq_cocaine:client:cementUsed', player)
end

local function OnLeafUse(player, item)
    TriggerClientEvent('kq_cocaine:client:leafUsed', player)
end

exports.kq_link:RegisterUsableItem(Config.items.cocaLeaf, function(source)
    OnLeafUse(source)
end)
exports.kq_link:RegisterUsableItem(Config.items.cement, function(source)
    OnCementUse(source)
end)

--
---- OX Inventory solution
exports('UseCement', function(event, item, inventory)
    if event == 'usingItem' then
        local player = inventory.id
        OnCementUse(player)
        return true
    end
end)
exports('UseLeaf', function(event, item, inventory)
    if event == 'usingItem' then
        local player = inventory.id
        OnLeafUse(player)
        return true
    end
end)
---

function ValidateMaxDistance(player, originCoords, maxDistance)
    local playerPed = GetPlayerPed(player)
    
    local distance = #(originCoords - GetEntityCoords(playerPed))
    
    if distance > maxDistance then
        print('^1Action executed from impossible distance. Possible lua injection. Player ID: ' .. player .. '. Distance: '.. distance .. 'm^0')
        return false
    end
    
    return true
end
