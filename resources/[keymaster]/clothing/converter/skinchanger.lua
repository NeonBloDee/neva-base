local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_skinchanger_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

exportHandler('GetSkin', function()
    local mySkin = nil
    TriggerCallback('clothing:getSkin:server', function(skin)
        mySkin = skin
    end)
    while mySkin == nil do Citizen.Wait(500) end
    return mySkin
end)