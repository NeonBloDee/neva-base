RegisterNetEvent("esx:playerLoaded", function(xPlayer)
    Citizen.Wait(1000)
    TriggerServerEvent('clothing:loadPlayerSkin:server')
    PlayerData = GetPlayerData()
end)

RegisterNetEvent('esx_skin:openMenu')
AddEventHandler('esx_skin:openMenu', function(submitCb, cancelCb, nottp)
    if submitCb ~= nil then
        submitCb()
    end
    Citizen.Wait(3000)
    local pData = GetPlayerData()
    if pData.sex == 0 or pData.sex == "m" then
	    createFirstCharacter("male", Config.CharacterCreationMenuCategories.Normal, true, nottp)
    else
        createFirstCharacter("female", Config.CharacterCreationMenuCategories.Normal, true, nottp)
    end
end)

RegisterNetEvent('esx_skin:playerRegistered')
AddEventHandler('esx_skin:playerRegistered', function()
    Citizen.Wait(3000)
    TriggerCallback('clothing:getSkin:server', function(skin)
        if next(skin) then
            TriggerServerEvent('clothing:loadPlayerSkin:server')
        else
            local pData = GetPlayerData()
            if pData.sex == 0 or pData.sex == "m" then
                createFirstCharacter("male", Config.CharacterCreationMenuCategories.Normal, true, false)
            else
                createFirstCharacter("female", Config.CharacterCreationMenuCategories.Normal, true, false)
            end
        end
    end)
end)

RegisterNetEvent('esx_skin:openRestrictedMenu')
AddEventHandler('esx_skin:openRestrictedMenu', function(submitCb, cancelCb, restrict, nottp)
    if submitCb and submitCb ~= nil then
        submitCb()
    end
    Citizen.Wait(3000)
    local pData = GetPlayerData()
    if pData.sex == 0 or pData.sex == "m" then
	    createFirstCharacter("male", Config.CharacterCreationMenuCategories.Restricted, false, nottp)
    else
        createFirstCharacter("female", Config.CharacterCreationMenuCategories.Restricted, false, nottp)
    end
end)

RegisterNetEvent('esx_skin:openSaveableMenu')
AddEventHandler('esx_skin:openSaveableMenu', function(submitCb, cancelCb, nottp)
    if submitCb and submitCb ~= nil then
        submitCb()
    end
    Citizen.Wait(3000)
    local pData = GetPlayerData()
    if pData.sex == 0 or pData.sex == "m" then
	    createFirstCharacter("male", Config.CharacterCreationMenuCategories.Normal, true, nottp)
    else
        createFirstCharacter("female", Config.CharacterCreationMenuCategories.Normal, true, nottp)
    end
end)

RegisterNetEvent('esx_skin:openSaveableRestrictedMenu')
AddEventHandler('esx_skin:openSaveableRestrictedMenu', function(submitCb, cancelCb, restrict, nottp)
    if submitCb and submitCb ~= nil then
        submitCb()
    end
    Citizen.Wait(3000)
    local pData = GetPlayerData()
    if pData.sex == 0 or pData.sex == "m" then
	    createFirstCharacter("male", Config.CharacterCreationMenuCategories.Restricted, true, nottp)
    else
        createFirstCharacter("female", Config.CharacterCreationMenuCategories.Restricted, true, nottp)
    end
end)

RegisterNetEvent('esx_skin:requestSaveSkin')
AddEventHandler('esx_skin:requestSaveSkin', function()
	local model = GetEntityModel(PlayerPedId())
    skinData.model = model
    TriggerServerEvent("clothing:saveSkin:server", model, skinData)
end)

AddEventHandler('esx_skin:getLastSkin', function(cb)
	cb(currentPlayerSkin)
end)

RegisterNetEvent('skinchanger:loadSkin', function(data, cb)
    TriggerEvent('clothing:client:loadPlayerClothing', data, PlayerPedId())
    if cb and cb ~= nil then
        cb()
    end
end)