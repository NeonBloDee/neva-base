local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_qb-clothing_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

exportHandler('reloadSkin', function()
    return reloadSkin()
end)

exportHandler('IsCreatingCharacter', function()
    local var = creatingChar or clothingStoreOpen
    return var
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('clothing:loadPlayerSkin:server')
    PlayerData = GetPlayerData()
end)

RegisterNetEvent("qb-clothes:loadSkin", function(_, model, data)
    model = model ~= nil and tonumber(model) or false
    Citizen.CreateThread(function()
        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)
        data = json.decode(data)
        TriggerEvent('clothing:client:loadPlayerClothing', data, PlayerPedId())
    end)
end)

RegisterNetEvent('qb-clothing:client:loadPlayerClothing', function(data, ped)
    TriggerEvent('clothing:client:loadPlayerClothing', data, ped)
end)