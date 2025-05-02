local cameras = {}

RegisterNetEvent('camera:initializeCameras')
AddEventHandler('camera:initializeCameras', function()
    local src = source
    TriggerClientEvent('camera:createCam', src, cameras)
end)

CreateThread(function()
    for k, v in pairs(FRKN.Camera) do
        cameras[k] = {
            image = v.image,
            code = v.code,
            name = v.name,
            street = v.street,
            coords = v.coords,
            heading = v.heading,
            propName = v.propName,
            broken = false
        }
    end
end)

RegisterNetEvent('camera:breakCamera')
AddEventHandler('camera:breakCamera', function(camIndex)
    if cameras[camIndex] then
        cameras[camIndex].broken = true
        RemoveItem(source, FRKN.SignalCutterItem,1,{})
        TriggerClientEvent('camera:updateCamera', -1, camIndex, cameras[camIndex])
    end
end)





RegisterNetEvent("camera:triggerAlarm")
AddEventHandler("camera:triggerAlarm", function(coords)
    TriggerClientEvent("camera:playAlarm", -1, coords)
end)

RegisterUsableItem(FRKN.SignalCutterItem)
