local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_illenium-appearance_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

exportHandler('startPlayerCustomization', function(cb)
    if CoreName == "qb" then
        Core.Functions.GetPlayerData(function(pData)
            local gender = "male"
            if pData.charinfo.gender == 1 then
                gender = "female"
            end
            createFirstCharacter(gender, Config.CharacterCreationMenuCategories.Normal, true, true)
        end)
    else
        local pData = GetPlayerData()
        if pData.sex == 0 then
            createFirstCharacterWithoutReset("male", Config.CharacterCreationMenuCategories.Normal, true, true)
        else
            createFirstCharacterWithoutReset("female", Config.CharacterCreationMenuCategories.Normal, true, true)
        end
    end
end)

exportHandler('setPedComponent', function(var1, var2)
    local ped, component = nil
    if type(var1) == "table" then
        component = var1
        ped = var2
    end
    if type(var2) == "table" then
        component = var2
        ped = var1
    end
    SetPedComponentVariation(ped, component.component_id, component.drawable, component.texture, 0)
end)

exportHandler('setPedProp', function(var1, var2)
    local ped, prop = nil
    if type(var1) == "table" then
        prop = var1
        ped = var2
    end
    if type(var2) == "table" then
        prop = var2
        ped = var1
    end
    if prop.drawable == -1 then
        ClearPedProp(ped, prop.prop_id)
    else
        SetPedPropIndex(ped, prop.prop_id, prop.drawable, prop.texture, false)
    end
end)

exportHandler('getPedAppearance', function(ped)
    local mySkin = nil
    TriggerCallback('clothing:getSkin:server', function(skin)
        mySkin = skin
    end)
    while mySkin == nil do Citizen.Wait(500) end
    local model = GetEntityModel(ped)
    mySkin.model = model
    if Config.ModelSaveType == "modelname" then
        mySkin.model = GetEntityArchetypeName(ped)
    end
    return mySkin
end)

exportHandler('setPedAppearance', function(var1, var2)
    local ped, data = nil
    if type(var1) == "table" then
        data = var1
        ped = var2
    end
    if type(var2) == "table" then
        data = var2
        ped = var1
    end
    if data.headBlend or data.components or data.faceFeatures or data.headOverlays then
        local newData = ConvertIlleniumToQB(data)
        TriggerEvent('clothing:client:loadPlayerClothing', newData, ped)
    else
        TriggerEvent('clothing:client:loadPlayerClothing', data, ped)
    end
end)

exportHandler('setPlayerAppearance', function(appearance)
    if appearance.headBlend or appearance.components or appearance.faceFeatures or appearance.headOverlays then
        local newData = ConvertIlleniumToQB(appearance)
        TriggerEvent('clothing:client:loadPlayerClothing', newData, PlayerPedId())
    else
        TriggerEvent('clothing:client:loadPlayerClothing', appearance, ped)
    end
end)

RegisterNetEvent('illenium-appearance:client:migration:load-qb-clothing-clothes', function(data, ped)
    if data.headBlend or data.components or data.faceFeatures or data.headOverlays then
        local newData = ConvertIlleniumToQB(data)
        TriggerEvent('clothing:client:loadPlayerClothing', newData, ped)
    else
        TriggerEvent('clothing:client:loadPlayerClothing', data, ped)
    end
end)

function ConvertIlleniumToQB(illeniumData)
    local qbData = {}
    qbData.model = illeniumData.model == "mp_m_freemode_01" and 1885233650 or 1885233651
    if illeniumData.headBlend then
        face = {item = illeniumData.headBlend.shapeFirst, texture = illeniumData.headBlend.skinFirst}
        face2 = {item = illeniumData.headBlend.shapeSecond, texture = illeniumData.headBlend.skinSecond}
        face3 = {item = illeniumData.headBlend.shapeThird, texture = illeniumData.headBlend.skinThird}
        qbData.facemix = {
            shapeMix = illeniumData.headBlend.shapeMix,
            thirdMix = illeniumData.headBlend.thirdMix,
            skinMix = illeniumData.headBlend.skinMix * 10.0
        }
    else
        face = {item = -1, texture = 0}
        face2 = {item = -1, texture = 0}
        face3 = {item = -1, texture = 0}
        qbData.facemix = {
            shapeMix = 0.0,
            thirdMix = 0.0,
            skinMix = 1.0
        }
    end

    qbData.eye_color = { item = illeniumData.eyeColor }

    local componentMapping = {
        [1] = "mask",
        [3] = "arms",
        [4] = "pants",
        [5] = "bag",
        [6] = "shoes",
        [7] = "accessory",
        [8] = "undershirt",
        [9] = "vest",
        [10] = "decals",
        [11] = "torso2"
    }

    for _, component in ipairs(illeniumData.components) do
        local qbKey = componentMapping[component.component_id]
        if qbKey then
            qbData[qbKey] = { item = component.drawable, texture = component.texture }
        end
    end

    if illeniumData.hair then
        qbData.hair = {
            item = illeniumData.hair.style,
            texture = illeniumData.hair.texture
        }
    else
        for _, component in ipairs(illeniumData.components) do
            if component.component_id == 2 then
                qbData.hair = {
                    item = component.drawable,
                    texture = component.texture
                }
            end
        end
    end

    local overlayMapping = {
        eyebrows = "eyebrows",
        beard = "beard",
        ageing = "ageing",
        blush = "blush",
        complexion = "complexion",
        lipstick = "lipstick",
        moleAndFreckles = "molesfreckles",
        bodyBlemishes = "bodyblemishes",
        blemishes = "blemishes",
        chestHair = "chesthair",
        sunDamage = "sundamage",
        makeUp = "makeup"
    }

    for illeniumKey, qbKey in pairs(overlayMapping) do
        if illeniumData.headOverlays[illeniumKey] then
            if illeniumData.headOverlays[illeniumKey].style == 0 then
                illeniumData.headOverlays[illeniumKey].style = -1
            end
            qbData[qbKey] = {
                item = illeniumData.headOverlays[illeniumKey].style,
                texture = illeniumData.headOverlays[illeniumKey].color,
                opacity = illeniumData.headOverlays[illeniumKey].opacity + 0.0
            }
        end
    end

    local propMapping = {
        [0] = "hat",
        [1] = "glass",
        [2] = "ear",
        [6] = "watch",
        [7] = "bracelet"
    }

    for _, prop in ipairs(illeniumData.props) do
        local qbKey = propMapping[prop.prop_id]
        if qbKey then
            qbData[qbKey] = { item = prop.drawable, texture = prop.texture }
        end
    end

    local featureMapping = {
        noseWidth = "nose_0",
        nosePeakHigh = "nose_1",
        nosePeakSize = "nose_2",
        noseBoneHigh = "nose_3",
        nosePeakLowering = "nose_4",
        noseBoneTwist = "nose_5",
        eyeBrownHigh = "eyebrown_high",
        eyeBrownForward = "eyebrown_forward",
        cheeksBoneHigh = "cheek_1",
        cheeksBoneWidth = "cheek_2",
        cheeksWidth = "cheek_3",
        eyesOpening = "eye_opening",
        lipsThickness = "lips_thickness",
        jawBoneWidth = "jaw_bone_width",
        jawBoneBackSize = "jaw_bone_back_lenght",
        chinBoneLowering = "chimp_bone_lowering",
        chinBoneLenght = "chimp_bone_lenght",
        chinBoneSize = "chimp_bone_width",
        chinHole = "chimp_hole",
        neckThickness = "neck_thikness"
    }

    for illeniumKey, qbKey in pairs(featureMapping) do
        if illeniumData.faceFeatures and illeniumData.faceFeatures[illeniumKey] then
            qbData[qbKey] = { item = illeniumData.faceFeatures[illeniumKey] }
        else
            qbData[qbKey] = { item = -1 }
        end
    end

    return qbData
end