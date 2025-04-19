currentPlayerSkin = {}
previousSkinData = {}
currentTattoos = {}
RegisterNetEvent('clothing:loadSkin:client', function(_, model, data)
    model = model ~= nil and (tonumber(model) or GetHashKey(model)) or false
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

function DrawInstructionBarNotification(x, y, z, text)
	local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))

	local distance = GetDistanceBetweenCoords(x, y, z, px, py, pz, false)

	if distance <= 6 then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(true)
		AddTextComponentString(text)
		SetDrawOrigin(x,y,z, 0)
		DrawText(0.0, 0.0)
		local factor = (string.len(text)) / 370
		DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
		ClearDrawOrigin()
	end
end

RegisterNetEvent('clothing:loadPlayerTattoos:client', function(tattooList)
    tattooList = json.decode(tattooList)
    for k, v in pairs(tattooList) do
        if GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') then
            SetPedDecoration(PlayerPedId(), v.collection, v.name)
        else
            SetPedDecoration(PlayerPedId(), v.collection, v.name2)
        end
    end
    currentTattoos = tattooList
end)

RegisterCommand('refreshskin', function()
    TriggerServerEvent('clothing:loadPlayerSkin:server')
end)

local currentClothStoreType = nil
local skinData = {}
clothingStoreOpen = false
local headBlendData = {
    firstShape = 0,
    secondShape = 0,
    thirdShape = 0,
    firstSkin = 0,
    secondSkin = 0,
    thirdSkin = 0,
    shapeMix = 0.0,
    skinMix = 1.0,
    thirdMix = 0.0
}

local hairDecor = {
    male = {
        [0] = {"",""},
        [1] = {"multiplayer_overlays", "FM_M_Hair_001_a"},
        [2] = {"multiplayer_overlays", "NG_M_Hair_002"},
        [3] = {"multiplayer_overlays", "FM_M_Hair_003_a"},
        [4] = {"multiplayer_overlays", "NG_M_Hair_004"},
        [5] = {"multiplayer_overlays", "FM_M_Hair_long_a"},
        [6] = {"multiplayer_overlays", "FM_M_Hair_006_a"},
        [8] = {"multiplayer_overlays", "FM_M_Hair_008_a"},
        [9] = {"multiplayer_overlays", "NG_M_Hair_009"},
        [10] = {"multiplayer_overlays", "NG_M_Hair_013"},
        [11] = {"multiplayer_overlays", "NG_M_Hair_002"},
        [12] = {"multiplayer_overlays", "NG_M_Hair_011"},
        [13] = {"multiplayer_overlays", "NG_M_Hair_012"},
        [14] = {"multiplayer_overlays", "NG_M_Hair_014"},
        [15] = {"multiplayer_overlays", "NG_M_Hair_015"},
        [16] = {"multiplayer_overlays", "NGBea_M_Hair_000"},
        [17] = {"multiplayer_overlays", "NGBea_M_Hair_001"},
        [18] = {"mpbusiness_overlays", "FM_Bus_M_Hair_000_a"},
        [19] = {"mpbusiness_overlays", "FM_Bus_M_Hair_001_a"},
        [20] = {"mphipster_overlays", "FM_Hip_M_Hair_000_a"},
        [21] = {"mphipster_overlays", "FM_Hip_M_Hair_001_a"},
        [22] = {"multiplayer_overlays", "NGInd_M_Hair_000"},
        [24] = {"mplowrider_overlays", "LR_M_Hair_000"},
        [25] = {"mplowrider_overlays", "LR_M_Hair_001"},
        [26] = {"mplowrider_overlays", "LR_M_Hair_002"},
        [27] = {"mplowrider_overlays", "LR_M_Hair_003"},
        [28] = {"mplowrider2_overlays", "LR_M_Hair_004"},
        [29] = {"mplowrider2_overlays", "LR_M_Hair_005"},
        [30] = {"mplowrider2_overlays", "LR_M_Hair_006"},
        [31] = {"mpbiker_overlays", "MP_Biker_Hair_000_M"},
        [32] = {"mpbiker_overlays", "MP_Biker_Hair_001_M"},
        [33] = {"mpbiker_overlays", "MP_Biker_Hair_002_M"},
        [34] = {"mpbiker_overlays", "MP_Biker_Hair_003_M"},
        [35] = {"mpbiker_overlays", "MP_Biker_Hair_004_M"},
        [36] = {"mpbiker_overlays", "MP_Biker_Hair_005_M"},

        [72] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_M_000_M"},
        [73] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_M_001_M"},
        [74] = {"mpvinewood_overlays", "MP_Vinewood_Hair_M_000_M"},
        [75] = {"mptuner_overlays", "MP_Tuner_Hair_001_M"},
        [76] = {"mpsecurity_overlays", "MP_Security_Hair_001_M"},
    },
    female = {
        [0] = {"",""},
        [1] = {"multiplayer_overlays", "NG_F_Hair_001"},
        [2] = {"multiplayer_overlays", "NG_F_Hair_002"},
        [3] = {"multiplayer_overlays", "FM_F_Hair_003_a"},
        [4] = {"multiplayer_overlays", "NG_F_Hair_004"},
        [5] = {"multiplayer_overlays", "FM_F_Hair_005_a"},
        [6] = {"multiplayer_overlays", "FM_F_Hair_006_a"},
        [7] = {"multiplayer_overlays", "NG_F_Hair_007"},
        [8] = {"multiplayer_overlays", "NG_F_Hair_008"},
        [9] = {"multiplayer_overlays", "NG_F_Hair_009"},
        [10] = {"multiplayer_overlays", "NG_F_Hair_010"},
        [11] = {"multiplayer_overlays", "NG_F_Hair_011"},
        [12] = {"multiplayer_overlays", "NG_F_Hair_012"},
        [13] = {"multiplayer_overlays", "FM_F_Hair_013_a"},
        [14] = {"multiplayer_overlays", "FM_F_Hair_014_a"},
        [15] = {"multiplayer_overlays", "NG_M_Hair_015"},
        [16] = {"multiplayer_overlays", "NGBea_F_Hair_000"},
        [17] = {"mpbusiness_overlays", "FM_Bus_F_Hair_a"},
        [18] = {"multiplayer_overlays", "NG_F_Hair_007"},
        [19] = {"multiplayer_overlays", "NGBus_F_Hair_000"},
        [20] = {"multiplayer_overlays", "NGBus_F_Hair_001"},
        [21] = {"multiplayer_overlays", "NGBea_F_Hair_001"},
        [22] = {"mphipster_overlays", "FM_Hip_F_Hair_000_a"},
        [23] = {"multiplayer_overlays", "NGInd_F_Hair_000"},
        [25] = {"mplowrider_overlays", "LR_F_Hair_000"},
        [26] = {"mplowrider_overlays", "LR_F_Hair_001"},
        [27] = {"mplowrider_overlays", "LR_F_Hair_002"},
        [29] = {"mplowrider2_overlays", "LR_F_Hair_003"},
        [30] = {"mplowrider2_overlays", "LR_F_Hair_004"},
        [31] = {"mplowrider2_overlays", "LR_F_Hair_006"},
        [32] = {"mpbiker_overlays", "MP_Biker_Hair_000_F"},
        [33] = {"mpbiker_overlays", "MP_Biker_Hair_001_F"},
        [34] = {"mpbiker_overlays", "MP_Biker_Hair_002_F"},
        [35] = {"mpbiker_overlays", "MP_Biker_Hair_003_F"},
        [38] = {"mpbiker_overlays", "MP_Biker_Hair_004_F"},
        [36] = {"mpbiker_overlays", "MP_Biker_Hair_005_F"},
        [37] = {"mpbiker_overlays", "MP_Biker_Hair_005_F"},
        [76] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_F_000_F"},
        [77] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_F_001_F"},
        [78] = {"mpvinewood_overlays", "MP_Vinewood_Hair_F_000_F"},
        [79] = {"mptuner_overlays", "MP_Tuner_Hair_000_F"},
        [80] = {"mpsecurity_overlays", "MP_Security_Hair_000_F"},
    }
}

RegisterNetEvent('clothing:client:loadPlayerClothing', function(data, ped)
    if not next(data) or (data.sex ~= nil and next(data, "sex") == nil) then return end
    if data.headBlend then
        data = ConvertIlleniumToQB(data)
        Citizen.Wait(1000)
    end
    if ped == nil then ped = PlayerPedId() end
    for i = 0, 11 do SetPedComponentVariation(ped, i, 0, 0, 0) end
    for i = 0, 7 do ClearPedProp(ped, i) end
    -- Face
    if not data["facemix"] then
        data["facemix"] = {skinMix = 0.0, shapeMix = 0.0, thirdMix = 0.0}
    end
    if not data["face"] then
        data["face"] = {}
        data["face"].item = 1
        data["face"].texture = 0
    end
    if not data["face2"] then
        data["face2"] = {}
        data["face2"].item = 1
        data["face2"].texture = 0
    end
    if not data["face3"] then
        data["face3"] = {}
        data["face3"].item = 1
        data["face3"].texture = 0
    end
    -- if data["face_md_weight"] then
    --     data["face"] = {item = (data["face_md_weight"] / 100) + 0.0, texture = (data["face_md_weight"] / 100) + 0.0}
    -- end
    -- if data["skin_md_weight"] then
    --     data["face2"] = {item = (data["skin_md_weight"] / 100) + 0.0, texture = (data["skin_md_weight"] / 100) + 0.0}
    -- end
    headBlendData = {
        firstShape = data["face"].item,
        secondShape = data["face2"].item,
        thirdShape = data["face3"].item,
        firstSkin = data["face"].texture,
        secondSkin = data["face2"].texture,
        thirdSkin = data["face3"].texture,
        shapeMix = data["facemix"].shapeMix,
        skinMix = data["facemix"].skinMix,
        thirdMix = data["facemix"].thirdMix
    }
    SetPedHeadBlendData(ped, data["face"].item, data["face2"].item, data["face3"].item, data["face"].texture, data["face2"].texture, data["face3"].texture, data["facemix"].shapeMix, data["facemix"].skinMix, data["facemix"].thirdMix, false)
    --SetPedHeadBlendData(ped, data["face"].item, data["face2"].item, nil, data["face"].texture, data["face2"].texture, nil, data["facemix"].shapeMix, data["facemix"].skinMix, nil, true)

    -- Pants
    if data["pants_1"] then data["pants"] = {} data["pants"].item = data["pants_1"] data["pants_1"] = nil end
    if data["pants_2"] then data["pants"].texture = data["pants_2"] data["pants_2"] = nil end
    SetPedComponentVariation(ped, 4, data["pants"].item, 0, 0)
    SetPedComponentVariation(ped, 4, data["pants"].item, data["pants"].texture, 0)

    -- Hair
    if data["hair_1"] then data["hair"] = {} data["hair"].item = data["hair_1"] data["hair_1"] = nil end
    if data["hair_color_1"] then data["hair"].texture = data["hair_color_1"] data["hair_color_1"] = nil end
    SetPedComponentVariation(ped, 2, data["hair"].item, 0, 0)
    SetPedHairTint(ped, data["hair"].texture, data["hair"].texture)
    if data["hair"].texture and data["hair"].texture2 then
        SetPedHairTint(PlayerPedId(), data["hair"].texture, data["hair"].texture2)
    end

    -- Eyebrows
    if data["eyebrows_1"] then data["eyebrows"] = {} data["eyebrows"].item = data["eyebrows_1"] data["eyebrows_1"] = nil end
    if data["eyebrows_2"] then data["eyebrows"].texture = (data["eyebrows_2"] / 10) + 0.0 data["eyebrows_2"] = nil end
    if not data["eyebrows"] or not data["eyebrows"].item then data["eyebrows"] = {item = -1, texture = -1} end
    SetPedHeadOverlay(ped, 2, data["eyebrows"].item, 1.0)
    SetPedHeadOverlayColor(ped, 2, 1, data["eyebrows"].texture, 0)

    -- Beard
    if data["beard_1"] then data["beard"] = {} data["beard"].item = data["beard_1"] data["beard_1"] = nil end
    if data["beard_2"] then data["beard"].opacity = (data["beard_2"] / 10) + 0.0 data["beard_2"] = nil end
    if data["beard_3"] then data["beard"].texture = data["beard_3"] data["beard_3"] = nil end
    if not data["beard"] or not data["beard"].item then data["beard"] = {item = -1, texture = -1, opacity = 1.0} end
    SetPedHeadOverlay(ped, 1, data["beard"].item, data["beard"].opacity)
    SetPedHeadOverlayColor(ped, 1, 1, data["beard"].texture, 0)

    -- Blush
    if data["blush_1"] and data["blush_2"] then
        data["blush"] = {item = data["blush_1"], texture = (data["blush_2"] / 10) + 0.0}
        data["blush_1"] = nil
        data["blush_2"] = nil
    end
    if not data["blush"] then data["blush"] = {item = -1, texture = -1} end
    SetPedHeadOverlay(ped, 5, data["blush"].item, 1.0)
    SetPedHeadOverlayColor(ped, 5, 2, data["blush"].texture, 0)

    -- Lipstick
    if data["lipstick_1"] and data["lipstick_2"] then
        data["lipstick"] = {item = data["lipstick_1"], texture = (data["lipstick_2"] / 10) + 0.0}
        data["lipstick_1"] = nil
        data["lipstick_2"] = nil
    end
    if not data["lipstick"] then data["lipstick"] = {item = -1, texture = -1} end
    SetPedHeadOverlay(ped, 8, data["lipstick"].item, 1.0)
    SetPedHeadOverlayColor(ped, 8, 2, data["lipstick"].texture, 0)

    -- Makeup
    if data["makeup_1"] and data["makeup_3"] then
        data["makeup"] = {item = data["makeup_1"], texture = data["makeup_3"]}
        data["makeup_1"] = nil
        data["makeup_3"] = nil
    else
        data["makeup"] = {item = -1, texture = 0}
    end
    if not data["makeup"] then data["makeup"] = {item = -1, texture = -1} end
    SetPedHeadOverlay(ped, 4, data["makeup"].item, 1.0)
    SetPedHeadOverlayColor(ped, 4, 1, data["makeup"].texture, 0)

    -- Ageing
    if data["age_1"] then data["ageing"] = {} data["ageing"].item = data["age_1"] data["age_1"] = nil end
    if data["age_2"] then data["ageing"].texture = (data["age_2"] / 10) + 0.0 data["age_2"] = nil end
    SetPedHeadOverlay(ped, 3, data["ageing"].item, 1.0)
    SetPedHeadOverlayColor(ped, 3, 1, data["ageing"].texture, 0)

    -- Arms
    if type(data["arms"]) == "string" or type(data["arms"]) == "number" then local num = tonumber(data["arms"]) data["arms"] = {} data["arms"].item = num end
    --if type(data["arms"]) == "table" then local nda = data["arms"] data["arms"] = {} data["arms"].item = end
    if data["arms_2"] then data["arms"].texture = data["arms_2"] data["arms_2"] = nil end
    if data["arms/gloves"] then data["arms"] = {} data["arms"] = data["arms/gloves"] data["arms/gloves"] = nil end
    SetPedComponentVariation(ped, 3, data["arms"].item, 0, 2)
    SetPedComponentVariation(ped, 3, data["arms"].item, data["arms"].texture, 0)
    
    -- T-Shirt
    if data["undershirt"] then data["t-shirt"] = data["undershirt"] end
    if data["tshirt_1"] then data["t-shirt"] = {} data["t-shirt"].item = data["tshirt_1"] data["tshirt_1"] = nil end
    if data["tshirt_2"] then data["t-shirt"].texture = data["tshirt_2"] data["tshirt_2"] = nil end
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, 0, 2)
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, data["t-shirt"].texture, 0)
    -- Vest
    if data["bproof_1"] then data["vest"] = {} data["vest"].item = data["bproof_1"] data["bproof_1"] = nil end
    if data["bproof_2"] then data["vest"].texture = data["bproof_2"] data["bproof_2"] = nil end
    SetPedComponentVariation(ped, 9, data["vest"].item, 0, 2)
    SetPedComponentVariation(ped, 9, data["vest"].item, data["vest"].texture, 0)
    -- Torso 2
    if data["jacket"] then data["torso2"] = data["jacket"] end
    if data["torso_1"] then data["torso2"] = {} data["torso2"].item = data["torso_1"] data["torso_1"] = nil end
    if data["torso_2"] then data["torso2"].texture = data["torso_2"] data["torso_2"] = nil end
    SetPedComponentVariation(ped, 11, data["torso2"].item, 0, 2)
    SetPedComponentVariation(ped, 11, data["torso2"].item, data["torso2"].texture, 0)
    -- Shoes
    if data["shoes_1"] then data["shoes"] = {} data["shoes"].item = data["shoes_1"] data["shoes_1"] = nil end
    if data["shoes_2"] then data["shoes"].texture = data["shoes_2"] data["shoes_2"] = nil end
    SetPedComponentVariation(ped, 6, data["shoes"].item, 0, 2)
    SetPedComponentVariation(ped, 6, data["shoes"].item, data["shoes"].texture, 0)

    -- Mask
    if data["masks"] then data["mask"] = data["masks"] end
    if data["mask_1"] then data["mask"] = {} data["mask"].item = data["mask_1"] data["mask_1"] = nil end
    if data["mask_2"] then data["mask"].texture = data["mask_2"] data["mask_2"] = nil end
    SetPedComponentVariation(ped, 1, data["mask"].item, 0, 2)
    SetPedComponentVariation(ped, 1, data["mask"].item, data["mask"].texture, 0)

    -- Badge
    if data["decals_1"] then data["decals"] = {} data["decals"].item = data["decals_1"] data["decals_1"] = nil end
    if data["decals_2"] then data["decals"].texture = data["decals_2"] data["decals_2"] = nil end
    SetPedComponentVariation(ped, 10, data["decals"].item, 0, 2)
    SetPedComponentVariation(ped, 10, data["decals"].item, data["decals"].texture, 0)

    -- Accessory
    if data["scarfs/necklaces"] then data["accessory"] = data["scarfs/necklaces"] end
    if data["chain_1"] then data["accessory"] = {} data["accessory"].item = data["chain_1"] data["chain_1"] = nil end
    if data["chain_2"] then data["accessory"].texture = data["chain_2"] data["chain_2"] = nil end
    SetPedComponentVariation(ped, 7, data["accessory"].item, 0, 2)
    SetPedComponentVariation(ped, 7, data["accessory"].item, data["accessory"].texture, 0)

    -- Bag
    if data["bags_1"] then data["bag"] = {} data["bag"].item = data["bags_1"] data["bags_1"] = nil end
    if data["bags_2"] then data["bag"].texture = data["bags_2"] data["bags_2"] = nil end
    SetPedComponentVariation(ped, 5, data["bag"].item, 0, 2)
    SetPedComponentVariation(ped, 5, data["bag"].item, data["bag"].texture, 0)

    -- Hat
    if data["helmet_1"] then data["hat"] = {} data["hat"].item = data["helmet_1"] data["helmet_1"] = nil end
    if data["helmet_2"] then data["hat"].texture = data["helmet_2"] data["helmet_2"] = nil end
    if data["hat"].item ~= -1 then
        SetPedPropIndex(ped, 0, data["hat"].item, data["hat"].texture, true)
    else
        ClearPedProp(ped, 0)
    end
    -- Glass
    if data["glasses"] then data["glass"] = data["glasses"] end
    if data["glasses_1"] then data["glass"] = {} data["glass"].item = data["glasses_1"] data["glasses_1"] = nil end
    if data["glasses_2"] then data["glass"].texture = data["glasses_2"] data["glasses_2"] = nil end
    if data["glass"].item == 0 then data["glass"].item = -1 end
    if data["glass"].item ~= -1 and data["glass"].item ~= 0 then
        SetPedPropIndex(ped, 1, data["glass"].item, data["glass"].texture, true)
    else
        ClearPedProp(ped, 1)
    end
    
    -- Ear
    if data["earrings"] then data["ear"] = data["earrings"] end
    if data["ears_1"] then data["ear"] = {} data["ear"].item = data["ears_1"] data["ears_1"] = nil end
    if data["ears_2"] then data["ear"].texture = data["ears_2"] data["ears_2"] = nil end
    if data["ear"].item ~= -1 and data["ear"].item ~= 0 then
        SetPedPropIndex(ped, 2, data["ear"].item, data["ear"].texture, true)
    else
        ClearPedProp(ped, 2)
    end

    -- Watch
    if data["watches"] then data["watch"] = data["watches"] end
    if data["watches_1"] then data["watch"] = {} data["watch"].item = data["watches_1"] data["watches_1"] = nil end
    if data["watches_2"] then data["watch"].texture = data["watches_2"] data["watches_2"] = nil end
    if data["watch"].item ~= -1 and data["watch"].item ~= 0 then
        SetPedPropIndex(ped, 6, data["watch"].item, data["watch"].texture, true)
    else
        ClearPedProp(ped, 6)
    end

    -- Bracelet
    if data["bracelets"] then data["bracelet"] = data["bracelets"] end
    if data["bracelets_1"] then data["bracelet"] = {} data["bracelet"].item = data["bracelets_1"] data["bracelets_2"] = nil end
    if data["bracelets_2"] then data["bracelet"].texture = data["bracelets_2"] data["bracelets_2"] = nil end
    if data["bracelet"].item ~= -1 and data["bracelet"].item ~= 0 then
        SetPedPropIndex(ped, 7, data["bracelet"].item, data["bracelet"].texture, true)
    else
        ClearPedProp(ped, 7)
    end
    -- Eye Color
    if data["eye_color"] and type(data["eye_color"]) == "number" then
        data["eye_color"] = {item = data["eye_color"]}
    end
    if data["eye_color"].item ~= -1 and data["eye_color"].item ~= 0 then
        SetPedEyeColor(ped, data['eye_color'].item)
    end

    -- Moles / Freckles
    if data["molesfreckles"] then data["moles"] = data["molesfreckles"] end
    if data["moles_1"] then data["moles"] = {} data["moles"].item = data["moles_1"] data["moles_1"] = nil end
    if data["moles_2"] then data["moles"].texture = data["moles_2"] data["moles_2"] = nil end
    if data["moles"].item ~= -1 and data["moles"].item ~= 0 then
        SetPedHeadOverlay(ped, 9, data['moles'].item, (data['moles'].texture / 10) + 0.0)
    end

    -- Nose
    if data['nose_0'] then
        SetPedFaceFeature(ped, 0, (data['nose_0'].item / 10) + 0.0)
        SetPedFaceFeature(ped, 1, (data['nose_1'].item / 10) + 0.0)
        SetPedFaceFeature(ped, 2, (data['nose_2'].item / 10) + 0.0)
        SetPedFaceFeature(ped, 3, (data['nose_3'].item / 10) + 0.0)
        SetPedFaceFeature(ped, 4, (data['nose_4'].item / 10) + 0.0)
        SetPedFaceFeature(ped, 5, (data['nose_5'].item / 10) + 0.0)
    else
        SetPedFaceFeature(ped, 0, (data['nose_1'] / 10) + 0.0)
        SetPedFaceFeature(ped, 1, (data['nose_2'] / 10) + 0.0)
        SetPedFaceFeature(ped, 2, (data['nose_3'] / 10) + 0.0)
        SetPedFaceFeature(ped, 3, (data['nose_4'] / 10) + 0.0)
        SetPedFaceFeature(ped, 4, (data['nose_5'] / 10) + 0.0)
        SetPedFaceFeature(ped, 5, (data['nose_6'] / 10) + 0.0)
    end

    -- Eyebrows
    if data['eyebrows_5'] then data['eyebrown_high'] = {} data['eyebrown_high'].item = data['eyebrows_5'] data['eyebrows_5'] = nil end
    if data['eyebrows_6'] then data['eyebrown_forward'] = {} data['eyebrown_forward'].item = data['eyebrows_6'] data['eyebrows_6'] = nil end
    SetPedFaceFeature(ped, 6, (data['eyebrown_high'].item / 10))
    SetPedFaceFeature(ped, 7, (data['eyebrown_forward'].item / 10) + 0.0)

    -- Cheeks
    if data['cheeks_1'] then data['cheek_1'] = {} data['cheek_1'].item = data['cheeks_1'] data['cheeks_1'] = nil end
    if data['cheeks_2'] then data['cheek_2'] = {} data['cheek_2'].item = data['cheeks_2'] data['cheeks_2'] = nil end
    if data['cheeks_3'] then data['cheek_3'] = {} data['cheek_3'].item = data['cheeks_3'] data['cheeks_3'] = nil end
    SetPedFaceFeature(ped, 8, (data['cheek_1'].item / 10) + 0.0)
    SetPedFaceFeature(ped, 9, (data['cheek_2'].item / 10) + 0.0)
    SetPedFaceFeature(ped, 10,(data['cheek_3'].item / 10) + 0.0)

    -- Eye Squint
    if data['eye_squint'] then data['eye_opening'] = {} data['eye_opening'].item = data['eye_squint'] data['eye_squint'] = nil end
    SetPedFaceFeature(ped, 11, (data['eye_opening'].item / 10) + 0.0)

    -- Lip Thickness
    if data['lip_thickness'] then data['lips_thickness'] = {} data['lips_thickness'].item = data['lip_thickness'] data['lip_thickness'] = nil end
    SetPedFaceFeature(ped, 12, (data['lips_thickness'].item / 10) + 0.0)

    -- Jaw
    if data['jaw_1'] then data['jaw_bone_width'] = {} data['jaw_bone_width'].item = data['jaw_1'] data['jaw_1'] = nil end
    if data['jaw_2'] then data['jaw_bone_back_lenght'] = {} data['jaw_bone_back_lenght'].item = data['jaw_2'] data['jaw_2'] = nil end
    SetPedFaceFeature(ped, 13, (data['jaw_bone_width'].item / 10) + 0.0)
    SetPedFaceFeature(ped, 14, (data['jaw_bone_back_lenght'].item / 10) + 0.0)

    -- Chimp
    if data['chin_1'] then data['chimp_bone_lowering'] = {} data['chimp_bone_lowering'].item = data['chin_1'] data['chin_1'] = nil end
    if data['chin_2'] then data['chimp_bone_lenght'] = {} data['chimp_bone_lenght'].item = data['chin_2'] data['chin_2'] = nil end
    if data['chin_3'] then data['chimp_bone_width'] = {} data['chimp_bone_width'].item = data['chin_3'] data['chin_3'] = nil end
    if data['chin_4'] then data['chimp_hole'] = {} data['chimp_hole'].item = data['chin_4'] end
    if not data['chimp_bone_lowering'] then data['chimp_bone_lowering'] = {} data['chimp_bone_lowering'].item = -1 end 
    SetPedFaceFeature(ped, 15, (data['chimp_bone_lowering'].item / 10) + 0.0)
    if not data['chimp_bone_lenght'] then data['chimp_bone_lenght'] = {} data['chimp_bone_lenght'].item = -1 end 
    SetPedFaceFeature(ped, 16, (data['chimp_bone_lenght'].item / 10) + 0.0)
    if not data['chimp_bone_width'] then data['chimp_bone_width'] = {} data['chimp_bone_width'].item = -1 end 
    SetPedFaceFeature(ped, 17, (data['chimp_bone_width'].item / 10) + 0.0)
    if not data['chimp_hole'] then data['chimp_hole'] = {} data['chimp_hole'].item = -1 end 
    SetPedFaceFeature(ped, 18, (data['chimp_hole'].item / 10) + 0.0)

    -- Neck
    if data['neck_thickness'] then data['neck_thikness'] = {} data['neck_thikness'].item = data['neck_thickness'] data['neck_thickness'] = nil end
    SetPedFaceFeature(ped, 19, (data['neck_thikness'].item / 10) + 0.0)

    -- Hair Fade
    if data["hairFade"] and data["hairFade"].item == 1 then
        ClearPedDecorationsLeaveScars(PlayerPedId())
        local gender = "female"
        if GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') then
            gender = "male"
        end
        AddPedDecorationFromHashes(PlayerPedId(), hairDecor[gender][data["hair"].item][1], hairDecor[gender][data["hair"].item][2])
    end

    -- Chest Hair
    if not data['chesthair'] then data['chesthair'] = {item = -1, opacity = 1.0} end
    --SetPedHeadBlendData(PlayerPedId(), headBlendData.firstShape, headBlendData.secondShape, headBlendData.thirdShape, headBlendData.firstSkin, headBlendData.secondSkin, headBlendData.thirdSkin, headBlendData.shapeMix / 10.0, headBlendData.skinMix / 10.0, headBlendData.thirdMix / 10.0, false)
    SetPedHeadOverlay(PlayerPedId(), 10, data['chesthair'].item, data['chesthair'].opacity)
    skinData = data
    currentPlayerSkin = data
    Citizen.Wait(500)
    TriggerServerEvent('clothing:loadPlayerTattoos:server')
end)

creatingChar = false
local charCreateGender = nil
function createFirstCharacter(charGender, menuType, saveable, tp)
    if not menuType then
        menuType = Config.CharacterCreationMenuCategories.Normal
    end
    local lastReady = false
    creatingChar = true
    charCreateGender = charGender
    gender = charGender
    local defaultPedModel = GetHashKey("mp_m_freemode_01")
    if charGender == "female" then
        defaultPedModel = GetHashKey("mp_f_freemode_01")
    end
    RequestModel(defaultPedModel)
    while not HasModelLoaded(defaultPedModel) do
        RequestModel(defaultPedModel)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), defaultPedModel)
    SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)
    SetPedDefaultComponentVariation(PlayerPedId())
    local uuid = nil
    -- if Config.UseDefaultClothImages then
    --     TriggerCallback('clothing:getClothingUrl:server', function(urlData)
    --         uuid = urlData
    --     end, true)
    -- else
    --     TriggerCallback('clothing:getClothingUrl:server', function(urlData)
    --         uuid = urlData
    --     end, false)
    -- end
    TriggerCallback('clothing:getClothingUrl:server', function(urlData)
        uuid = urlData
    end, false)
    local startTime = GetGameTimer()
    while uuid == nil do 
        Citizen.Wait(0)  
        if GetGameTimer() - startTime > 5000 then
            uuid = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6"
            break
        end 
    end
    local generalData = {}
    local myPed = GetEntityModel(PlayerPedId())
    -- Male Peds
    local malePeds = {}
    for k, v in pairs(ManPlayerModels) do
        if myPed == GetHashKey(v) then
            myPed = v
        end
        table.insert(malePeds, {
            num = GetHashKey(v),
            model = v,
            image = 'https://docs.fivem.net/peds/' .. v .. '.webp?v=2'
        })
    end
    for k, v in pairs(CustomManPlayerModels) do
        if myPed == GetHashKey(v) then
            myPed = v
        end
        table.insert(malePeds, {
            num = GetHashKey(v),
            model = v,
            image = uuid .. "_" .. GetHashKey(v) ..  '_PED.webp?v=2',
            style = "width: 125%;"
        })
    end
    table.insert(generalData, {
        action = "MalePeds",
        data = malePeds,
        imgType = "",
        btnClick = true,
        variationNumber = 111
    })
    -- Female Peds
    local femalePeds = {}
    for k, v in pairs(WomanPlayerModels) do
        if myPed == GetHashKey(v) then
            myPed = v
        end
        table.insert(femalePeds, {
            num = GetHashKey(v),
            model = v,
            image = 'https://docs.fivem.net/peds/' .. v .. '.webp?v=2'
        })
    end
    for k, v in pairs(CustomWomanPlayerModels) do
        if myPed == GetHashKey(v) then
            myPed = v
        end
        table.insert(femalePeds, {
            num = GetHashKey(v),
            model = v,
            image = uuid .. "_" .. GetHashKey(v) ..  '_PED.webp?v=2',
            style = "width: 0%;"
        })
    end
    table.insert(generalData, {
        action = "FemalePeds",
        data = femalePeds,
        imgType = "",
        btnClick = true,
        variationNumber = 222
    })
    -- Faces
    local faces = {}
    for i = 0, 9 do
        table.insert(faces, {num = i, image = 'files/faces/SKEL_ROOT.00' .. i .. '.webp?v=2'})
    end
    for i = 10, 45 do
        table.insert(faces, {num = i, image = 'files/faces/SKEL_ROOT.0' .. i .. '.webp?v=2'})
    end
    table.insert(generalData, {
        action = "FaceOne",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    table.insert(generalData, {
        action = "SkinOne",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    table.insert(generalData, {
        action = "FaceTwo",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    table.insert(generalData, {
        action = "SkinTwo",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    table.insert(generalData, {
        action = "FaceThree",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    table.insert(generalData, {
        action = "SkinThree",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    -- Eye Color
    local eyeColors = {}
    for i = 0, 31 do
        table.insert(eyeColors, {num = i, image = 'files/eyes/' .. i .. '.webp?v=2'})
    end
    table.insert(generalData, {
        action = "EyeColor",
        data = eyeColors,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    -- Eyebrows
    local eyebrows = {}
    for i = -1, GetPedHeadOverlayNum(2) - 1 do
        table.insert(eyebrows, {num = i, image = 'files/eyebrows/' .. i .. '.webp?v=2'})
    end
    table.insert(generalData, {
        action = "Eyebrows",
        data = eyebrows,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true,
        variationNumber = 2
    })
    local colors = {
        {r = 29, g = 30, b = 32},
        {r = 42, g = 42, b = 44},
        {r = 48, g = 46, b = 49},
        {r = 52, g = 39, b = 30},
        {r = 70, g = 51, b = 34},
        {r = 91, g = 58, b = 39},
        {r = 108, g = 77, b = 57},
        {r = 105, g = 79, b = 62},
        {r = 113, g = 93, b = 69},
        {r = 126, g = 104, b = 83},
        {r = 153, g = 129, b = 93},
        {r = 166, g = 146, b = 109},
        {r = 175, g = 156, b = 114},
        {r = 183, g = 162, b = 99},
        {r = 211, g = 185, b = 128},
        {r = 216, g = 194, b = 145},
        {r = 158, g = 125, b = 90},
        {r = 156, g = 126, b = 90},
        {r = 101, g = 43, b = 32},
        {r = 93, g = 20, b = 13},
        {r = 97, g = 17, b = 10},
        {r = 122, g = 20, b = 16},
        {r = 158, g = 46, b = 26},
        {r = 180, g = 76, b = 41},
        {r = 158, g = 82, b = 50},
        {r = 171, g = 78, b = 44},
        {r = 98, g = 98, b = 98},
        {r = 128, g = 128, b = 128},
        {r = 170, g = 170, b = 170},
        {r = 197, g = 197, b = 198},
        {r = 71, g = 57, b = 83},
        {r = 90, g = 63, b = 108},
        {r = 118, g = 60, b = 119},
        {r = 237, g = 117, b = 225},
        {r = 232, g = 75, b = 144},
        {r = 239, g = 155, b = 189},
        {r = 6, g = 149, b = 157},
        {r = 5, g = 95, b = 130},
        {r = 5, g = 57, b = 114},
        {r = 63, g = 160, b = 109},
        {r = 37, g = 123, b = 96},
        {r = 23, g = 93, b = 85},
        {r = 180, g = 191, b = 52},
        {r = 113, g = 69, b = 10},
        {r = 70, g = 156, b = 21},
        {r = 219, g = 185, b = 88},
        {r = 230, g = 178, b = 0},
        {r = 233, g = 144, b = 2},
        {r = 244, g = 135, b = 50},
        {r = 250, g = 128, b = 87},
        {r = 225, g = 139, b = 88},
        {r = 205, g = 90, b = 61},
        {r = 209, g = 47, b = 36},
        {r = 166, g = 12, b = 2},
        {r = 137, g = 2, b = 6}
    }
    table.insert(generalData, {
        action = "EyebrowColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "EyebrowHighlightColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    -- Facial Hairs
    local facialHairs = {}
    if Config.UseDefaultClothImages.Hair then
        for i = -1, GetPedHeadOverlayNum(1) - 1 do
            table.insert(facialHairs, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_1_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(1) - 1 do
            table.insert(facialHairs, {num = i, image = uuid .. "_" .. gender .."_HEAD_1_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "FacialHairs",
        data = facialHairs,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 1
    })
    table.insert(generalData, {
        action = "FacialHairsColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "FacialHairsHighlightColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    -- Hairs
    local hairs = {}
    if Config.UseDefaultClothImages.Hair then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1 do
            table.insert(hairs, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_2_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1 do
            table.insert(hairs, {num = i, image = uuid .. "_" .. gender .."_HEAD_2_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Hairs",
        data = hairs,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = false,
        variationNumber = 2
    })
    table.insert(generalData, {
        action = "HairsColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "HairsHighlightColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    -- Blemishes
    local blemishes = {}
    if Config.UseDefaultClothImages.Skin then
        for i = -1, 23 do
            table.insert(blemishes, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_0_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, 23 do
            table.insert(blemishes, {num = i, image = uuid .. "_" .. gender .."_HEAD_0_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Blemishes",
        data = blemishes,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 0
    })
    -- Ageing
    local ageing = {}
    if Config.UseDefaultClothImages.Skin then
        for i = -1, GetPedHeadOverlayNum(3) - 1 do
            table.insert(ageing, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_3_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(3) - 1 do
            table.insert(ageing, {num = i, image = uuid .. "_" .. gender .."_HEAD_3_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Ageing",
        data = ageing,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 3
    })
    -- Complexion
    local complexion = {}
    if Config.UseDefaultClothImages.Skin then
        for i = -1, GetPedHeadOverlayNum(6) - 1 do
            table.insert(complexion, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_6_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(6) - 1 do
            table.insert(complexion, {num = i, image = uuid .. "_" .. gender .."_HEAD_6_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Complexion",
        data = complexion,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 6
    })
    -- Complexion
    local sunDamage = {}
    if Config.UseDefaultClothImages.Skin then
        for i = -1, GetPedHeadOverlayNum(7) - 1 do
            table.insert(sunDamage, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_7_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(7) - 1 do
            table.insert(sunDamage, {num = i, image = uuid .. "_" .. gender .."_HEAD_7_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "SunDamage",
        data = sunDamage,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 7
    })
    -- Moles/Freckles
    local molesFreckles = {}
    if Config.UseDefaultClothImages.Skin then
        for i = -1, GetPedHeadOverlayNum(9) - 1 do
            table.insert(molesFreckles, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_9_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(9) - 1 do
            table.insert(molesFreckles, {num = i, image = uuid .. "_" .. gender .."_HEAD_9_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "MolesFreckles",
        data = molesFreckles,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 9
    })
    -- Chest Hair
    local chestHair = {}
    if Config.UseDefaultClothImages.Body then
        for i = -1, GetPedHeadOverlayNum(10) - 1 do
            table.insert(chestHair, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_BODY_10_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(10) - 1 do
            table.insert(chestHair, {num = i, image = uuid .. "_" .. gender .."_BODY_10_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "ChestHair",
        data = chestHair,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG3",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 10
    })
    -- Body Blemishes
    local bodyBlemishes = {}
    if Config.UseDefaultClothImages.Body then
        for i = -1, GetPedHeadOverlayNum(11) - 1 do
            table.insert(bodyBlemishes, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_BODY_11_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(11) - 1 do
            table.insert(bodyBlemishes, {num = i, image = uuid .. "_" .. gender .."_BODY_11_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "BodyBlemishes",
        data = bodyBlemishes,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG3",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 11
    })
    -- Add Body Blemishes
    local addBodyBlemishes = {}
    if Config.UseDefaultClothImages.Body then
        for i = -1, GetPedHeadOverlayNum(12) - 1 do
            table.insert(addBodyBlemishes, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_BODY_12_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(12) - 1 do
            table.insert(addBodyBlemishes, {num = i, image = uuid .. "_" .. gender .."_BODY_12_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "AddBodyBlemishes",
        data = addBodyBlemishes,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG3",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 12
    })
    -- Makeup
    local makeup = {}
    if Config.UseDefaultClothImages.Makeup then
        for i = -1, GetPedHeadOverlayNum(4) - 1 do
            table.insert(makeup, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_4_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(4) - 1 do
            table.insert(makeup, {num = i, image = uuid .. "_" .. gender .."_HEAD_4_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Makeup",
        data = makeup,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 4
    })
    -- Jacket
    local jackets = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) do
            table.insert(jackets, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_11_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) do
            table.insert(jackets, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_11_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Jacket",
        data = jackets,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 11,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 11)
    })
    -- Undershirt
    local undershirts = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) do
            table.insert(undershirts, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_8_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) do
            table.insert(undershirts, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_8_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Undershirt",
        data = undershirts,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 8,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 8)
    })
    -- Arms/Gloves
    local armsgloves = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) do
            table.insert(armsgloves, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_3_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) do
            table.insert(armsgloves, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_3_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Arms/Gloves",
        data = armsgloves,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 3,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 3)
    })
    -- Pants
    local pants = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) do
            table.insert(pants, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_4_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) do
            table.insert(pants, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_4_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Pants",
        data = pants,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 4,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 4)
    })
    -- Shoes
    local shoes = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) do
            table.insert(shoes, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_6_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) do
            table.insert(shoes, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_6_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Shoes",
        data = shoes,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 6,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 6)
    })
    -- Decals
    local decals = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 10) do
            table.insert(decals, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_10_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 10) do
            table.insert(decals, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_10_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Decals",
        data = decals,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 10,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 10)
    })
    -- Masks
    local masks = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) do
            table.insert(masks, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_1_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) do
            table.insert(masks, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_1_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Masks",
        data = masks,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 1,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 1)
    })
    -- Scarfs/Necklaces
    local scarfsNecklaces = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 7) do
            table.insert(scarfsNecklaces, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_7_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 7) do
            table.insert(scarfsNecklaces, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_7_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Scarfs/Necklaces",
        data = scarfsNecklaces,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 7,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 7)
    })
    -- Vest
    local vests = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 9) do
            table.insert(vests, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_9_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 9) do
            table.insert(vests, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_9_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Vest",
        data = vests,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 9,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 9)
    })
    -- Bag
    local bags = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 5) do
            table.insert(bags, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_5_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 5) do
            table.insert(bags, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_5_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Bag",
        data = bags,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 5,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 5)
    })
    -- Hat
    local hat = {}
    if Config.UseDefaultClothImages.Accessories then
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0) - 1 do
            table.insert(hat, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_0_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0) - 1 do
            table.insert(hat, {num = i, image = uuid .. "_" .. gender .."_PROPS_0_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Hat",
        data = hat,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 0,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0)
    })
    -- Glasses
    local glasses = {}
    local minGlassesNumber = -1
    if gender == "male" then minGlassesNumber = 0 end
    if Config.UseDefaultClothImages.Accessories then
        for i = minGlassesNumber, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) - 1 do
            table.insert(glasses, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_1_" .. i .. '.webp?v=2'})
        end
    else
        for i = minGlassesNumber, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) - 1 do
            table.insert(glasses, {num = i, image = uuid .. "_" .. gender .."_PROPS_1_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Glasses",
        data = glasses,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGGlasses",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 1,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1)
    })
    -- Earrings
    local earrings = {}
    if Config.UseDefaultClothImages.Accessories then
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 2) - 1 do
            table.insert(earrings, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_2_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 2) - 1 do
            table.insert(earrings, {num = i, image = uuid .. "_" .. gender .."_PROPS_2_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Earrings",
        data = earrings,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 2,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 2)
    })
    -- Watches
    local watches = {}
    if Config.UseDefaultClothImages.Accessories then
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 6) - 1 do
            table.insert(watches, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_6_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 6) - 1 do
            table.insert(watches, {num = i, image = uuid .. "_" .. gender .."_PROPS_6_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Watches",
        data = watches,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 6,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 6)
    })
    -- Bracelets
    local bracelets = {}
    if Config.UseDefaultClothImages.Accessories then
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 7) - 1 do
            table.insert(bracelets, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_7_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 7) - 1 do
            table.insert(bracelets, {num = i, image = uuid .. "_" .. gender .."_PROPS_7_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Bracelets",
        data = bracelets,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 7,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 7)
    })
    -- Makeup Colors
    local makeUpColors = {
        {r = 153, g = 38, b = 51},
        {r = 197, g = 57, b = 92},
        {r = 188, g = 82, b = 105},
        {r = 184, g = 87, b = 123},
        {r = 167, g = 81, b = 106},
        {r = 176, g = 69, b = 79},
        {r = 128, g = 47, b = 53},
        {r = 164, g = 99, b = 97},
        {r = 193, g = 133, b = 123},
        {r = 204, g = 159, b = 154},
        {r = 199, g = 145, b = 145},
        {r = 172, g = 112, b = 101},
        {r = 174, g = 94, b = 80},
        {r = 167, g = 75, b = 52},
        {r = 179, g = 114, b = 118},
        {r = 201, g = 128, b = 145},
        {r = 238, g = 157, b = 190},
        {r = 230, g = 117, b = 163},
        {r = 224, g = 64, b = 128},
        {r = 181, g = 75, b = 111},
        {r = 111, g = 40, b = 56},
        {r = 78, g = 30, b = 44},
        {r = 170, g = 34, b = 48},
        {r = 223, g = 32, b = 50},
        {r = 207, g = 5, b = 19},
        {r = 232, g = 81, b = 112},
        {r = 219, g = 61, b = 180},
        {r = 194, g = 39, b = 177},
        {r = 160, g = 29, b = 171},
        {r = 113, g = 24, b = 114},
        {r = 111, g = 20, b = 100},
        {r = 83, g = 22, b = 91},
        {r = 107, g = 27, b = 158},
        {r = 24, g = 54, b = 114},
        {r = 26, g = 80, b = 168},
        {r = 28, g = 116, b = 187},
        {r = 34, g = 162, b = 207},
        {r = 41, g = 194, b = 210},
        {r = 36, g = 206, b = 167},
        {r = 40, g = 191, b = 124},
        {r = 26, g = 158, b = 48},
        {r = 16, g = 133, b = 1},
        {r = 110, g = 207, b = 68},
        {r = 199, g = 232, b = 55},
        {r = 223, g = 228, b = 47},
        {r = 255, g = 221, b = 35},
        {r = 250, g = 190, b = 40},
        {r = 245, g = 139, b = 39},
        {r = 255, g = 88, b = 13},
        {r = 192, g = 110, b = 28},
        {r = 248, g = 200, b = 128},
        {r = 251, g = 228, b = 197},
        {r = 247, g = 243, b = 244},
        {r = 179, g = 179, b = 181},
        {r = 144, g = 144, b = 144},
        {r = 86, g = 77, b = 78},
        {r = 23, g = 15, b = 13},
        {r = 87, g = 150, b = 155},
        {r = 77, g = 111, b = 138},
        {r = 25, g = 42, b = 85},
        {r = 159, g = 127, b = 106},
        {r = 131, g = 99, b = 88},
        {r = 110, g = 82, b = 70},
        {r = 62, g = 44, b = 40}
    }
    table.insert(generalData, {
        action = "FirstMakeupColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "SecondMakeupColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    -- Blush
    local blush = {}
    if Config.UseDefaultClothImages.Makeup then
        for i = -1, GetPedHeadOverlayNum(5) - 1 do
            table.insert(blush, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_5_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(5) - 1 do
            table.insert(blush, {num = i, image = uuid .. "_" .. gender .."_HEAD_5_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Blush",
        data = blush,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 5
    })
    table.insert(generalData, {
        action = "FirstBlushColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "SecondBlushColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    -- Lipstick
    local lipstick = {}
    if Config.UseDefaultClothImages.Makeup then
        for i = -1, GetPedHeadOverlayNum(8) - 1 do
            table.insert(lipstick, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_8_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(8) - 1 do
            table.insert(lipstick, {num = i, image = uuid .. "_" .. gender .."_HEAD_8_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Lipstick",
        data = lipstick,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 8
    })
    table.insert(generalData, {
        action = "FirstLipstickColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "SecondLipstickColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    lastReady = true
    while not lastReady do Citizen.Wait(500) end
    local translations = {}
    for k in pairs(Lang.fallback and Lang.fallback.phrases or Lang.phrases) do
        if k:sub(0, ('menu.'):len()) then
            translations[k:sub(('menu.'):len() + 1)] = Lang:t(k)
        end
    end
    SendNUIMessage({action = "openCreateCharMenu", generalData = generalData, myPed = myPed, gender = gender, ShowAllPeds = Config.ShowAllPeds, saveable = saveable, menuType = menuType, translations = translations})
    Config.HideHUD()
    if not tp then
        if Config.TeleportWhenCreatingChar.Enable then
            SetEntityCoords(PlayerPedId(), Config.TeleportWhenCreatingChar.Coords)
            SetEntityHeading(PlayerPedId(), Config.TeleportWhenCreatingChar.w)
        end
    end
    FreezeEntityPosition(PlayerPedId(), true)
    SetNuiFocus(true, true)
    Citizen.Wait(500)
    Citizen.CreateThread(function()
        SetEntityVisible(PlayerPedId(), false, 0)
        while creatingChar do
            Citizen.Wait(0)
            SetEntityLocallyVisible(PlayerPedId())
        end
    end)
    charCam(true)
end

function createFirstCharacterWithoutReset(charGender, menuType, saveable, tp)
    TriggerServerEvent('clothing:loadPlayerSkin:server')
    if not menuType then
        menuType = Config.CharacterCreationMenuCategories.Normal
    end
    local lastReady = false
    creatingChar = true
    local gender = "male"
    for k, v in pairs(ManPlayerModels) do
        if myPed == GetHashKey(v) then
            gender = "male"
        end
    end
    for k, v in pairs(WomanPlayerModels) do
        if myPed == GetHashKey(v) then
            gender = "female"
        end
    end
    charCreateGender = gender
    local uuid = nil
    TriggerCallback('clothing:getClothingUrl:server', function(urlData)
        uuid = urlData
    end, false)
    local startTime = GetGameTimer()
    while uuid == nil do 
        Citizen.Wait(0)  
        if GetGameTimer() - startTime > 5000 then
            uuid = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6"
            break
        end 
    end
    local generalData = {}
    local myPed = GetEntityModel(PlayerPedId())
    -- Male Peds
    local malePeds = {}
    for k, v in pairs(ManPlayerModels) do
        if myPed == GetHashKey(v) then
            myPed = v
        end
        table.insert(malePeds, {
            num = GetHashKey(v),
            model = v,
            image = 'https://docs.fivem.net/peds/' .. v .. '.webp?v=2'
        })
    end
    for k, v in pairs(CustomManPlayerModels) do
        if myPed == GetHashKey(v) then
            myPed = v
        end
        table.insert(malePeds, {
            num = GetHashKey(v),
            model = v,
            image = uuid .. "_" .. GetHashKey(v) ..  '_PED.webp?v=2',
            style = "width: 125%;"
        })
    end
    table.insert(generalData, {
        action = "MalePeds",
        data = malePeds,
        imgType = "",
        btnClick = true,
        variationNumber = 111
    })
    -- Female Peds
    local femalePeds = {}
    for k, v in pairs(WomanPlayerModels) do
        if myPed == GetHashKey(v) then
            myPed = v
        end
        table.insert(femalePeds, {
            num = GetHashKey(v),
            model = v,
            image = 'https://docs.fivem.net/peds/' .. v .. '.webp?v=2'
        })
    end
    for k, v in pairs(CustomWomanPlayerModels) do
        if myPed == GetHashKey(v) then
            myPed = v
        end
        table.insert(femalePeds, {
            num = GetHashKey(v),
            model = v,
            image = uuid .. "_" .. GetHashKey(v) ..  '_PED.webp?v=2',
            style = "width: 0%;"
        })
    end
    table.insert(generalData, {
        action = "FemalePeds",
        data = femalePeds,
        imgType = "",
        btnClick = true,
        variationNumber = 222
    })
    -- Faces
    local faces = {}
    for i = 0, 9 do
        table.insert(faces, {num = i, image = 'files/faces/SKEL_ROOT.00' .. i .. '.webp?v=2'})
    end
    for i = 10, 45 do
        table.insert(faces, {num = i, image = 'files/faces/SKEL_ROOT.0' .. i .. '.webp?v=2'})
    end
    table.insert(generalData, {
        action = "FaceOne",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    table.insert(generalData, {
        action = "SkinOne",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    table.insert(generalData, {
        action = "FaceTwo",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    table.insert(generalData, {
        action = "SkinTwo",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    table.insert(generalData, {
        action = "FaceThree",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    table.insert(generalData, {
        action = "SkinThree",
        data = faces,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true
    })
    -- Eye Color
    local eyeColors = {}
    for i = 0, 31 do
        table.insert(eyeColors, {num = i, image = 'files/eyes/' .. i .. '.webp?v=2'})
    end
    table.insert(generalData, {
        action = "EyeColor",
        data = eyeColors,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true,
        currentColor = GetPedEyeColor(PlayerPedId())
    })
    -- Eyebrows
    local eyebrows = {}
    for i = -1, GetPedHeadOverlayNum(2) - 1 do
        table.insert(eyebrows, {num = i, image = 'files/eyebrows/' .. i .. '.webp?v=2'})
    end
    local eyebrowNum = currentPlayerSkin["eyebrows"].item
    table.insert(generalData, {
        action = "Eyebrows",
        data = eyebrows,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true,
        variationNumber = 2,
        currentDrawableVariation = eyebrowNum
    })
    local colors = {
        {r = 29, g = 30, b = 32},
        {r = 42, g = 42, b = 44},
        {r = 48, g = 46, b = 49},
        {r = 52, g = 39, b = 30},
        {r = 70, g = 51, b = 34},
        {r = 91, g = 58, b = 39},
        {r = 108, g = 77, b = 57},
        {r = 105, g = 79, b = 62},
        {r = 113, g = 93, b = 69},
        {r = 126, g = 104, b = 83},
        {r = 153, g = 129, b = 93},
        {r = 166, g = 146, b = 109},
        {r = 175, g = 156, b = 114},
        {r = 183, g = 162, b = 99},
        {r = 211, g = 185, b = 128},
        {r = 216, g = 194, b = 145},
        {r = 158, g = 125, b = 90},
        {r = 156, g = 126, b = 90},
        {r = 101, g = 43, b = 32},
        {r = 93, g = 20, b = 13},
        {r = 97, g = 17, b = 10},
        {r = 122, g = 20, b = 16},
        {r = 158, g = 46, b = 26},
        {r = 180, g = 76, b = 41},
        {r = 158, g = 82, b = 50},
        {r = 171, g = 78, b = 44},
        {r = 98, g = 98, b = 98},
        {r = 128, g = 128, b = 128},
        {r = 170, g = 170, b = 170},
        {r = 197, g = 197, b = 198},
        {r = 71, g = 57, b = 83},
        {r = 90, g = 63, b = 108},
        {r = 118, g = 60, b = 119},
        {r = 237, g = 117, b = 225},
        {r = 232, g = 75, b = 144},
        {r = 239, g = 155, b = 189},
        {r = 6, g = 149, b = 157},
        {r = 5, g = 95, b = 130},
        {r = 5, g = 57, b = 114},
        {r = 63, g = 160, b = 109},
        {r = 37, g = 123, b = 96},
        {r = 23, g = 93, b = 85},
        {r = 180, g = 191, b = 52},
        {r = 113, g = 69, b = 10},
        {r = 70, g = 156, b = 21},
        {r = 219, g = 185, b = 88},
        {r = 230, g = 178, b = 0},
        {r = 233, g = 144, b = 2},
        {r = 244, g = 135, b = 50},
        {r = 250, g = 128, b = 87},
        {r = 225, g = 139, b = 88},
        {r = 205, g = 90, b = 61},
        {r = 209, g = 47, b = 36},
        {r = 166, g = 12, b = 2},
        {r = 137, g = 2, b = 6}
    }
    table.insert(generalData, {
        action = "EyebrowColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "EyebrowHighlightColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    -- Facial Hairs
    local facialHairs = {}
    if Config.UseDefaultClothImages.Hair then
        for i = -1, GetPedHeadOverlayNum(1) - 1 do
            table.insert(facialHairs, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_1_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(1) - 1 do
            table.insert(facialHairs, {num = i, image = uuid .. "_" .. gender .."_HEAD_1_" .. i .. '.webp?v=2'})
        end
    end
    local facialHairNum = currentPlayerSkin["beard"].item
    table.insert(generalData, {
        action = "FacialHairs",
        data = facialHairs,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 1,
        currentDrawableVariation = facialHairNum,
        currentTextureDrawableVariation = facialHairsColor
    })
    table.insert(generalData, {
        action = "FacialHairsColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "FacialHairsHighlightColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    -- Hairs
    local hairs = {}
    if Config.UseDefaultClothImages.Hair then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1 do
            table.insert(hairs, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_2_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1 do
            table.insert(hairs, {num = i, image = uuid .. "_" .. gender .."_HEAD_2_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Hairs",
        data = hairs,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = false,
        variationNumber = 2,
        currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 2),
        currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 2)
    })
    table.insert(generalData, {
        action = "HairsColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "HairsHighlightColors",
        data = colors,
        imgType = "",
        btnClick2 = true
    })
    -- Blemishes
    local blemishes = {}
    if Config.UseDefaultClothImages.Skin then
        for i = -1, 23 do
            table.insert(blemishes, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_0_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, 23 do
            table.insert(blemishes, {num = i, image = uuid .. "_" .. gender .."_HEAD_0_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Blemishes",
        data = blemishes,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 0
    })
    -- Ageing
    local ageing = {}
    if Config.UseDefaultClothImages.Skin then
        for i = -1, GetPedHeadOverlayNum(3) - 1 do
            table.insert(ageing, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_3_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(3) - 1 do
            table.insert(ageing, {num = i, image = uuid .. "_" .. gender .."_HEAD_3_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Ageing",
        data = ageing,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 3
    })
    -- Complexion
    local complexion = {}
    if Config.UseDefaultClothImages.Skin then
        for i = -1, GetPedHeadOverlayNum(6) - 1 do
            table.insert(complexion, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_6_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(6) - 1 do
            table.insert(complexion, {num = i, image = uuid .. "_" .. gender .."_HEAD_6_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Complexion",
        data = complexion,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 6
    })
    -- Complexion
    local sunDamage = {}
    if Config.UseDefaultClothImages.Skin then
        for i = -1, GetPedHeadOverlayNum(7) - 1 do
            table.insert(sunDamage, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_7_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(7) - 1 do
            table.insert(sunDamage, {num = i, image = uuid .. "_" .. gender .."_HEAD_7_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "SunDamage",
        data = sunDamage,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 7
    })
    -- Moles/Freckles
    local molesFreckles = {}
    if Config.UseDefaultClothImages.Skin then
        for i = -1, GetPedHeadOverlayNum(9) - 1 do
            table.insert(molesFreckles, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_9_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(9) - 1 do
            table.insert(molesFreckles, {num = i, image = uuid .. "_" .. gender .."_HEAD_9_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "MolesFreckles",
        data = molesFreckles,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 9
    })
    -- Chest Hair
    local chestHair = {}
    if Config.UseDefaultClothImages.Body then
        for i = -1, GetPedHeadOverlayNum(10) - 1 do
            table.insert(chestHair, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_BODY_10_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(10) - 1 do
            table.insert(chestHair, {num = i, image = uuid .. "_" .. gender .."_BODY_10_" .. i .. '.webp?v=2'})
        end
    end
    local chestHairNum = currentPlayerSkin["chesthair"].item
    table.insert(generalData, {
        action = "ChestHair",
        data = chestHair,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG3",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 10,
        currentDrawableVariation = chestHairNum
    })
    -- Body Blemishes
    local bodyBlemishes = {}
    if Config.UseDefaultClothImages.Body then
        for i = -1, GetPedHeadOverlayNum(11) - 1 do
            table.insert(bodyBlemishes, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_BODY_11_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(11) - 1 do
            table.insert(bodyBlemishes, {num = i, image = uuid .. "_" .. gender .."_BODY_11_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "BodyBlemishes",
        data = bodyBlemishes,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG3",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 11
    })
    -- Add Body Blemishes
    local addBodyBlemishes = {}
    if Config.UseDefaultClothImages.Body then
        for i = -1, GetPedHeadOverlayNum(12) - 1 do
            table.insert(addBodyBlemishes, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_BODY_12_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(12) - 1 do
            table.insert(addBodyBlemishes, {num = i, image = uuid .. "_" .. gender .."_BODY_12_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "AddBodyBlemishes",
        data = addBodyBlemishes,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG3",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 12
    })
    -- Makeup
    local makeup = {}
    if Config.UseDefaultClothImages.Makeup then
        for i = -1, GetPedHeadOverlayNum(4) - 1 do
            table.insert(makeup, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_4_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(4) - 1 do
            table.insert(makeup, {num = i, image = uuid .. "_" .. gender .."_HEAD_4_" .. i .. '.webp?v=2'})
        end
    end
    local makeupNum = currentPlayerSkin["makeup"].item
    table.insert(generalData, {
        action = "Makeup",
        data = makeup,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 4,
        currentDrawableVariation = makeupNum
    })
    -- Jacket
    local jackets = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) do
            table.insert(jackets, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_11_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) do
            table.insert(jackets, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_11_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Jacket",
        data = jackets,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 11,
        currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 11),
        currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 11),
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 11)
    })
    -- Undershirt
    local undershirts = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) do
            table.insert(undershirts, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_8_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) do
            table.insert(undershirts, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_8_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Undershirt",
        data = undershirts,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 8,
        currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 8),
        currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 8),
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 8)
    })
    -- Arms/Gloves
    local armsgloves = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) do
            table.insert(armsgloves, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_3_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) do
            table.insert(armsgloves, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_3_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Arms/Gloves",
        data = armsgloves,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 3,
        currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 3),
        currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 3),
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 3)
    })
    -- Pants
    local pants = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) do
            table.insert(pants, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_4_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) do
            table.insert(pants, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_4_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Pants",
        data = pants,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 4,
        minVariationNumber = 0,
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 4)
    })
    -- Shoes
    local shoes = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) do
            table.insert(shoes, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_6_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) do
            table.insert(shoes, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_6_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Shoes",
        data = shoes,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 6,
        currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 6),
        currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 6),
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 6)
    })
    -- Decals
    local decals = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 10) do
            table.insert(decals, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_10_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 10) do
            table.insert(decals, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_10_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Decals",
        data = decals,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 10,
        currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 10),
        currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 10),
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 10)
    })
    -- Masks
    local masks = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) do
            table.insert(masks, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_1_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) do
            table.insert(masks, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_1_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Masks",
        data = masks,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 1,
        currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 1),
        currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 1),
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 1)
    })
    -- Scarfs/Necklaces
    local scarfsNecklaces = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 7) do
            table.insert(scarfsNecklaces, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_7_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 7) do
            table.insert(scarfsNecklaces, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_7_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Scarfs/Necklaces",
        data = scarfsNecklaces,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 7,
        currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 7),
        currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 7),
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 7)
    })
    -- Vest
    local vests = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 9) do
            table.insert(vests, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_9_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 9) do
            table.insert(vests, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_9_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Vest",
        data = vests,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 9,
        currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 9),
        currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 9),
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 9)
    })
    -- Bag
    local bags = {}
    if Config.UseDefaultClothImages.Clothing then
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 5) do
            table.insert(bags, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_5_" .. i .. '.webp?v=2'})
        end
    else
        for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 5) do
            table.insert(bags, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_5_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Bag",
        data = bags,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 5,
        currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 5),
        currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 5),
        maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 5)
    })
    -- Hat
    local hat = {}
    if Config.UseDefaultClothImages.Accessories then
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0) - 1 do
            table.insert(hat, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_0_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0) - 1 do
            table.insert(hat, {num = i, image = uuid .. "_" .. gender .."_PROPS_0_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Hat",
        data = hat,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 0,
        currentDrawableVariation = skinData["hat"].item,
        currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 0),
        maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0)
    })
    -- Glasses
    local glasses = {}
    local minGlassesNumber = -1
    if gender == "male" then minGlassesNumber = 0 end
    if Config.UseDefaultClothImages.Accessories then
        for i = minGlassesNumber, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) - 1 do
            table.insert(glasses, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_1_" .. i .. '.webp?v=2'})
        end
    else
        for i = minGlassesNumber, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) - 1 do
            table.insert(glasses, {num = i, image = uuid .. "_" .. gender .."_PROPS_1_" .. i .. '.webp?v=2'})
        end
    end
    local currentGlasses = GetPedPropIndex(PlayerPedId(), 1)
    if currentGlasses == -1 then currentGlasses = 0 end
    table.insert(generalData, {
        action = "Glasses",
        data = glasses,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGGlasses",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 1,
        currentDrawableVariation = currentGlasses,
        currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 1),
        maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1)
    })
    -- Earrings
    local earrings = {}
    if Config.UseDefaultClothImages.Accessories then
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 2) - 1 do
            table.insert(earrings, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_2_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 2) - 1 do
            table.insert(earrings, {num = i, image = uuid .. "_" .. gender .."_PROPS_2_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Earrings",
        data = earrings,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 2,
        currentDrawableVariation = GetPedPropIndex(PlayerPedId(), 2),
        currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 2),
        maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 2)
    })
    -- Watches
    local watches = {}
    if Config.UseDefaultClothImages.Accessories then
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 6) - 1 do
            table.insert(watches, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_6_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 6) - 1 do
            table.insert(watches, {num = i, image = uuid .. "_" .. gender .."_PROPS_6_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Watches",
        data = watches,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 6,
        currentDrawableVariation = GetPedPropIndex(PlayerPedId(), 6),
        currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 6),
        maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 6)
    })
    -- Bracelets
    local bracelets = {}
    if Config.UseDefaultClothImages.Accessories then
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 7) - 1 do
            table.insert(bracelets, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_7_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 7) - 1 do
            table.insert(bracelets, {num = i, image = uuid .. "_" .. gender .."_PROPS_7_" .. i .. '.webp?v=2'})
        end
    end
    table.insert(generalData, {
        action = "Bracelets",
        data = bracelets,
        btnClick = true,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 7,
        currentDrawableVariation = GetPedPropIndex(PlayerPedId(), 7),
        currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 7),
        maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 7)
    })
    -- Makeup Colors
    local makeUpColors = {
        {r = 153, g = 38, b = 51},
        {r = 197, g = 57, b = 92},
        {r = 188, g = 82, b = 105},
        {r = 184, g = 87, b = 123},
        {r = 167, g = 81, b = 106},
        {r = 176, g = 69, b = 79},
        {r = 128, g = 47, b = 53},
        {r = 164, g = 99, b = 97},
        {r = 193, g = 133, b = 123},
        {r = 204, g = 159, b = 154},
        {r = 199, g = 145, b = 145},
        {r = 172, g = 112, b = 101},
        {r = 174, g = 94, b = 80},
        {r = 167, g = 75, b = 52},
        {r = 179, g = 114, b = 118},
        {r = 201, g = 128, b = 145},
        {r = 238, g = 157, b = 190},
        {r = 230, g = 117, b = 163},
        {r = 224, g = 64, b = 128},
        {r = 181, g = 75, b = 111},
        {r = 111, g = 40, b = 56},
        {r = 78, g = 30, b = 44},
        {r = 170, g = 34, b = 48},
        {r = 223, g = 32, b = 50},
        {r = 207, g = 5, b = 19},
        {r = 232, g = 81, b = 112},
        {r = 219, g = 61, b = 180},
        {r = 194, g = 39, b = 177},
        {r = 160, g = 29, b = 171},
        {r = 113, g = 24, b = 114},
        {r = 111, g = 20, b = 100},
        {r = 83, g = 22, b = 91},
        {r = 107, g = 27, b = 158},
        {r = 24, g = 54, b = 114},
        {r = 26, g = 80, b = 168},
        {r = 28, g = 116, b = 187},
        {r = 34, g = 162, b = 207},
        {r = 41, g = 194, b = 210},
        {r = 36, g = 206, b = 167},
        {r = 40, g = 191, b = 124},
        {r = 26, g = 158, b = 48},
        {r = 16, g = 133, b = 1},
        {r = 110, g = 207, b = 68},
        {r = 199, g = 232, b = 55},
        {r = 223, g = 228, b = 47},
        {r = 255, g = 221, b = 35},
        {r = 250, g = 190, b = 40},
        {r = 245, g = 139, b = 39},
        {r = 255, g = 88, b = 13},
        {r = 192, g = 110, b = 28},
        {r = 248, g = 200, b = 128},
        {r = 251, g = 228, b = 197},
        {r = 247, g = 243, b = 244},
        {r = 179, g = 179, b = 181},
        {r = 144, g = 144, b = 144},
        {r = 86, g = 77, b = 78},
        {r = 23, g = 15, b = 13},
        {r = 87, g = 150, b = 155},
        {r = 77, g = 111, b = 138},
        {r = 25, g = 42, b = 85},
        {r = 159, g = 127, b = 106},
        {r = 131, g = 99, b = 88},
        {r = 110, g = 82, b = 70},
        {r = 62, g = 44, b = 40}
    }
    table.insert(generalData, {
        action = "FirstMakeupColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "SecondMakeupColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    -- Blush
    local blush = {}
    if Config.UseDefaultClothImages.Makeup then
        for i = -1, GetPedHeadOverlayNum(5) - 1 do
            table.insert(blush, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_5_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(5) - 1 do
            table.insert(blush, {num = i, image = uuid .. "_" .. gender .."_HEAD_5_" .. i .. '.webp?v=2'})
        end
    end
    local blushNum = currentPlayerSkin["blush"].item
    table.insert(generalData, {
        action = "Blush",
        data = blush,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 5,
        currentDrawableVariation = blushNum
    })
    table.insert(generalData, {
        action = "FirstBlushColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "SecondBlushColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    -- Lipstick
    local lipstick = {}
    if Config.UseDefaultClothImages.Makeup then
        for i = -1, GetPedHeadOverlayNum(8) - 1 do
            table.insert(lipstick, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_8_" .. i .. '.webp?v=2'})
        end
    else
        for i = -1, GetPedHeadOverlayNum(8) - 1 do
            table.insert(lipstick, {num = i, image = uuid .. "_" .. gender .."_HEAD_8_" .. i .. '.webp?v=2'})
        end
    end
    local lipstickNum = currentPlayerSkin["lipstick"].item
    table.insert(generalData, {
        action = "Lipstick",
        data = lipstick,
        imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
        btnClick = true,
        style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
        search = true,
        variationNumber = 8,
        currentDrawableVariation = lipstickNum
    })
    table.insert(generalData, {
        action = "FirstLipstickColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    table.insert(generalData, {
        action = "SecondLipstickColor",
        data = makeUpColors,
        imgType = "",
        btnClick2 = true
    })
    lastReady = true
    while not lastReady do Citizen.Wait(500) end
    local translations = {}
    for k in pairs(Lang.fallback and Lang.fallback.phrases or Lang.phrases) do
        if k:sub(0, ('menu.'):len()) then
            translations[k:sub(('menu.'):len() + 1)] = Lang:t(k)
        end
    end
    SendNUIMessage({action = "openCreateCharMenuWithoutReset", generalData = generalData, myPed = myPed, gender = gender, ShowAllPeds = Config.ShowAllPeds, saveable = saveable, menuType = menuType, translations = translations})
    Config.HideHUD()
    if not tp then
        if Config.TeleportWhenCreatingChar.Enable then
            SetEntityCoords(PlayerPedId(), Config.TeleportWhenCreatingChar.Coords)
            SetEntityHeading(PlayerPedId(), Config.TeleportWhenCreatingChar.w)
        end
    end
    FreezeEntityPosition(PlayerPedId(), true)
    SetNuiFocus(true, true)
    Citizen.Wait(500)
    Citizen.CreateThread(function()
        SetEntityVisible(PlayerPedId(), false, 0)
        while creatingChar do
            Citizen.Wait(0)
            SetEntityLocallyVisible(PlayerPedId())
        end
    end)
    charCam(true)
end

RegisterNetEvent('qb-clothes:client:CreateFirstCharacter', function(nottp, reset)
    if CoreName == "qb" then
        if reset then
            Core.Functions.GetPlayerData(function(pData)
                local gender = "male"
                if pData.charinfo.gender == 1 then
                    gender = "female"
                end
                createFirstCharacterWithoutReset(gender, Config.CharacterCreationMenuCategories.Normal, true, nottp)
            end)
        else
            Core.Functions.GetPlayerData(function(pData)
                local gender = "male"
                if pData.charinfo.gender == 1 then
                    gender = "female"
                end
                createFirstCharacter(gender, Config.CharacterCreationMenuCategories.Normal, true, nottp)
            end)
        end
    else
        if reset then
            local pData = GetPlayerData()
            if pData.sex == 0 then
                createFirstCharacter("male", Config.CharacterCreationMenuCategories.Normal, true, nottp)
            else
                createFirstCharacter("female", Config.CharacterCreationMenuCategories.Normal, true, nottp)
            end
        else
            local pData = GetPlayerData()
            if pData.sex == 0 then
                createFirstCharacterWithoutReset("male", Config.CharacterCreationMenuCategories.Normal, true, nottp)
            else
                createFirstCharacterWithoutReset("female", Config.CharacterCreationMenuCategories.Normal, true, nottp)
            end
        end
    end
end)

RegisterCommand('ah', function()
    TriggerEvent('qb-clothes:client:CreateRestrictedCharacter', true)
end)

RegisterNetEvent('qb-clothes:client:CreateRestrictedCharacter', function(nottp)
    if CoreName == "qb" then
        Core.Functions.GetPlayerData(function(pData)
            local gender = "male"
            if pData.charinfo.gender == 1 then
                gender = "female"
            end
            createFirstCharacterWithoutReset(gender, Config.CharacterCreationMenuCategories.Restricted, true, nottp)
        end)
    else
        local pData = GetPlayerData()
        if pData.sex == 0 then
            createFirstCharacterWithoutReset("male", Config.CharacterCreationMenuCategories.Restricted, true, nottp)
        else
            createFirstCharacterWithoutReset("female", Config.CharacterCreationMenuCategories.Restricted, true, nottp)
        end
    end
end)

RegisterNetEvent('clothing:openCharacterCreationMenu', function(nottp, reset)
    if CoreName == "qb" then
        if reset then
            Core.Functions.GetPlayerData(function(pData)
                local gender = "male"
                if pData.charinfo.gender == 1 then
                    gender = "female"
                end
                createFirstCharacterWithoutReset(gender, Config.CharacterCreationMenuCategories.Normal, true, nottp)
            end)
        else
            Core.Functions.GetPlayerData(function(pData)
                local gender = "male"
                if pData.charinfo.gender == 1 then
                    gender = "female"
                end
                createFirstCharacter(gender, Config.CharacterCreationMenuCategories.Normal, true, nottp)
            end)
        end
    else
        if reset then
            local pData = GetPlayerData()
            if pData.sex == 0 then
                createFirstCharacter("male", Config.CharacterCreationMenuCategories.Normal, true, nottp)
            else
                createFirstCharacter("female", Config.CharacterCreationMenuCategories.Normal, true, nottp)
            end
        else
            local pData = GetPlayerData()
            if pData.sex == 0 then
                createFirstCharacterWithoutReset("male", Config.CharacterCreationMenuCategories.Normal, true, nottp)
            else
                createFirstCharacterWithoutReset("female", Config.CharacterCreationMenuCategories.Normal, true, nottp)
            end
        end
    end
end)

createdCharCham, createdCharChamPed, camOffset, camHeight, camOffsetX, hairFade = nil, nil, 0, 0, 0, 0
function charCam(state)
    if state then
        if DoesCamExist(createdCharCham) then return end
        while isAnyCamActive() do Citizen.Wait(500) end
        DestroyCam(createdCharCham, false)
        --DestroyAllCams(true)
        RenderScriptCams(false, true, 500, true, false)
        Citizen.Wait(500)
        DestroyCam(createdCharCham, false)
        if not DoesCamExist(createdCharCham) then
            -- Create Ped
            local playerCoords = GetEntityCoords(PlayerPedId())
            RequestModel(GetHashKey("mp_m_freemode_01"))
            while not HasModelLoaded(GetHashKey("mp_m_freemode_01")) do Citizen.Wait(0) end
            createdCharChamPed = CreatePed(2, GetHashKey("mp_m_freemode_01"), playerCoords.x, playerCoords.y, playerCoords.z - 1, GetEntityHeading(PlayerPedId()), false, true)
            FreezeEntityPosition(createdCharChamPed, true)
            SetEntityVisible(createdCharChamPed, false)
            SetEntityNoCollisionEntity(PlayerPedId(), createdCharChamPed, true)
            -- Create Cam
            local coords = GetOffsetFromEntityInWorldCoords(createdCharChamPed, 0.05, 0.6, 0.45)
            createdCharCham = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
            SetCamActive(createdCharCham, true)
            RenderScriptCams(true, true, 500, true, true)
            SetCamCoord(createdCharCham, coords.x, coords.y, coords.z + 0.2)
            SetCamRot(createdCharCham, 0.0, 0.0, GetEntityHeading(createdCharChamPed) + 180)
            if Config.UseBackgroundBlur then
                SetCamUseShallowDofMode(createdCharCham, true)
                SetCamNearDof(createdCharCham, 0.4)
                SetCamFarDof(createdCharCham, 1.1)
                SetCamDofStrength(createdCharCham, 1.0)
            end
        end
        camOffsetX = -0.05
        camOffset = 0.6
        camHeight = 0.45
        if Config.UseBackgroundBlur then
            Citizen.CreateThread(function()
                while DoesCamExist(createdCharCham) do
                    SetUseHiDof()
                    Citizen.Wait(0)
                end
            end)
        end
        Citizen.CreateThread(function()
            while DoesCamExist(createdCharCham) do
                local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.05, camOffset, camHeight)
                SetCamCoord(createdCharCham, coords.x, coords.y, coords.z + 0.2)
                SetCamRot(createdCharCham, 0.0, 0.0, GetEntityHeading(PlayerPedId()) + 180)
                Citizen.Wait(0)
            end
        end)
    else
        DeletePed(createdCharChamPed)
        ClearTimecycleModifier()
        --DestroyAllCams(true)
        RenderScriptCams(false, true, 500, true, false)
        DestroyCam(createdCharCham, false)
        createdCharCham = nil
    end
end

function isAnyCamActive()
    for i = 1, 10 do -- Maksimum 10 kamera kontrol edebiliriz (FiveM'de aşırı fazla kamera oluşturulmaz)
        local cam = GetRenderingCam()
        if cam ~= -1 and IsCamActive(cam) then
            return true
        end
    end
    return false
end

local shopTattoos = {}
RegisterNUICallback('callback', function(data, cb)
    if data.action == "nuiFocus" then
        SetNuiFocus(false, false)
        charCam(false)
        Config.ShowHUD()
    elseif data.action == "updateRotation" then
        local rotationDelta = data.rotationDelta
        local currentHeading = GetEntityHeading(PlayerPedId())
        local newHeading = currentHeading + (rotationDelta * 0.3) 
        SetEntityHeading(PlayerPedId(), newHeading)
    elseif data.action == "updateZoom" then
        if data.type == "zoomIn" then
            if camOffset == 0.6 then
                camOffset = 0.9
                camHeight = 0.25
            elseif camOffset == 0.9 then
                camOffset = 1.2
                camHeight = 0.0
            elseif camOffset == 1.2 then
                camOffset = 1.5
                camHeight = -0.25
            end
        elseif data.type == "zoomOut" then
            if camOffset == 1.5 then
                camOffset = 1.2
                camHeight = 0.0
            elseif camOffset == 1.2 then
                camOffset = 0.9
                camHeight = 0.25
            elseif camOffset == 0.9 then
                camOffset = 0.6
                camHeight = 0.45
            end
        end
        if camOffset == 1.5 then
            SetCamNearDof(createdCharCham, 0.9)
            SetCamFarDof(createdCharCham, 1.5)
        else
            SetCamNearDof(createdCharCham, 0.4)
            SetCamFarDof(createdCharCham, 1.1)
        end
        SetCamDofStrength(createdCharCham, 1.0)
        local coords = GetOffsetFromEntityInWorldCoords(createdCharChamPed, 0.05, camOffset, camHeight)
        SetCamCoord(createdCharCham, coords.x, coords.y, coords.z + 0.2)
    elseif data.action == "changeVariation" then
        if data.action2 == "Hat" or data.action2 == "Glasses" or data.action2 == "Earrings" or data.action2 == "Watches" or data.action2 == "Bracelets" then
            SetPedPreloadPropData(PlayerPedId(), data.num1, data.num2, data.num3)
            while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                Citizen.Wait(50)
            end
            ClearPedProp(PlayerPedId(), data.num1)
            SetPedPropIndex(PlayerPedId(), data.num1, data.num2, data.num3, 0)
            skinData[string.lower(data.action2)] = {}
            skinData[string.lower(data.action2)].item = data.num2
            skinData[string.lower(data.action2)].texture = data.num3
            return
        end
        SetPedPreloadVariationData(PlayerPedId(), data.num1, data.num2, data.num3)
        while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
            Citizen.Wait(50)
        end
        SetPedComponentVariation(PlayerPedId(), data.num1, data.num2, data.num3, 0)
        skinData[string.lower(data.action2)] = {}
        skinData[string.lower(data.action2)].item = data.num2
        skinData[string.lower(data.action2)].texture = data.num3
        SendNUIMessage({action = "setMaxNumForComponentVariation", action2 = data.action2, componentId = data.num1, componentVariation = data.num2, textureMaxNum = GetNumberOfPedTextureVariations(PlayerPedId(), data.num1, data.num2) - 1})
        if data.action2 == "Hairs" then
            if data.num2 == 0 then
                ClearPedDecorationsLeaveScars(PlayerPedId())
            else
                if hairFade == 1 then
                    ClearPedDecorationsLeaveScars(PlayerPedId())
                    AddPedDecorationFromHashes(PlayerPedId(), hairDecor[charCreateGender][data.num2][1], hairDecor[charCreateGender][data.num2][2])
                end
            end
            skinData["hair"] = {}
            skinData["hair"].item = data.num2
            skinData["hair"].texture = GetPedHairColor(PlayerPedId())
        end
    elseif data.action == "changePropVariation" then
        SetPedPreloadPropData(PlayerPedId(), data.num1, data.num2, data.num3)
        while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
            Citizen.Wait(50)
        end
        ClearPedProp(PlayerPedId(), data.num1)
        SetPedPropIndex(PlayerPedId(), data.num1, data.num2, data.num3, 0)
        skinData[string.lower(data.action2)] = {}
        skinData[string.lower(data.action2)].item = data.num2
        skinData[string.lower(data.action2)].texture = data.num3
        SendNUIMessage({action = "setMaxNumForComponentVariation", action2 = data.action2, componentId = data.num1, componentVariation = data.num2, textureMaxNum = GetNumberOfPedPropTextureVariations(PlayerPedId(), data.num1, data.num2) - 1})
    elseif data.action == "changeFace" then
        headBlendData = {
            firstShape = data.firstShape,
            secondShape = data.secondShape,
            thirdShape = data.thirdShape,
            firstSkin = data.firstSkin,
            secondSkin = data.secondSkin,
            thirdSkin = data.thirdSkin,
            shapeMix = data.shapeMix / 10.0,
            skinMix = data.skinMix / 10.0,
            thirdMix = data.thirdMix / 10.0
        }
        skinData["face"] = {}
        skinData["face"].item = data.firstShape
        skinData["face"].texture = data.firstSkin
        skinData["face2"] = {}
        skinData["face2"].item = data.secondShape
        skinData["face2"].texture = data.secondSkin
        skinData["face3"] = {}
        skinData["face3"].item = data.thirdShape
        skinData["face3"].texture = data.thirdSkin
        skinData["facemix"] = {skinMix = data.skinMix / 10.0, shapeMix = data.shapeMix / 10.0, thirdMix = data.thirdMix / 10.0}
        SetPedHeadBlendData(PlayerPedId(), data.firstShape, data.secondShape, data.thirdShape, data.firstSkin, data.secondSkin, data.thirdSkin, data.shapeMix / 100.0, data.skinMix / 100.0, data.thirdMix / 100.0, false)
    elseif data.action == "changeHeadOverlay" then
        data.num1 = tonumber(data.num1)
        data.num2 = tonumber(data.num2)
        data.num3 = tonumber(data.num3)
        data.opacity = tonumber(data.opacity) / 100
        SetPedPreloadVariationData(PlayerPedId(), data.num1, data.num2, data.num3)
        while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
            Citizen.Wait(50)
        end
        SetPedHeadBlendData(PlayerPedId(), headBlendData.firstShape, headBlendData.secondShape, headBlendData.thirdShape, headBlendData.firstSkin, headBlendData.secondSkin, headBlendData.thirdSkin, headBlendData.shapeMix / 10.0, headBlendData.skinMix / 10.0, headBlendData.thirdMix / 10.0, false)
        SetPedHeadOverlay(PlayerPedId(), data.num1, data.num2, data.opacity)
        local colorType = 0
        if data.action2 == "Eyebrows" or data.action2 == "FacialHairs" or data.action2 == "ChestHair" then
            colorType = 1
        elseif data.action2 == "Blush" or data.action2 == "Lipstick" then
            colorType = 2
        end
        if data.action2 == "Hairs" then
            SetPedHairTint(PlayerPedId(), data.num3, data.num4)
            if hairFade == 1 then
                AddPedDecorationFromHashes(PlayerPedId(), hairDecor[charCreateGender][data.num2][1], hairDecor[charCreateGender][data.num2][2])
            end
            skinData["hair"] = {}
            skinData["hair"].item = data.num2
            skinData["hair"].texture = data.num3
            skinData["hair"].texture2 = data.num4
            return
        end
        SetPedHeadOverlayColor(PlayerPedId(), data.num1, colorType, data.num3, data.num4)
        if data.action2 == "FacialHairs" then
            data.action2 = "beard"
        end
        skinData[string.lower(data.action2)] = {}
        skinData[string.lower(data.action2)].item = data.num2
        skinData[string.lower(data.action2)].texture = data.num3
        skinData[string.lower(data.action2)].opacity = data.opacity
    elseif data.action == "setPedEyeColor" then
        SetPedEyeColor(PlayerPedId(), tonumber(data.num1))
        skinData["eye_color"] = {}
        skinData["eye_color"].item = tonumber(data.num1)
        skinData["eye_color"].texture = 0
    elseif data.action == "setHairFade" then
        skinData["hairFade"] = {}
        skinData["hairFade"].item = data.num1
        hairFade = data.num1
        if data.num1 == 0 then
            ClearPedDecorationsLeaveScars(PlayerPedId())
        else
            data.num2 = tonumber(data.num2)
            AddPedDecorationFromHashes(PlayerPedId(), hairDecor[charCreateGender][data.num2][1], hairDecor[charCreateGender][data.num2][2])
        end
    elseif data.action == "removeCloth" then
        local defaultNum = Config.DefaultClothingVaritaions[data.type][charCreateGender]
        if data.type == "Hat" or data.type == "Glasses" then
            SetPedPreloadPropData(PlayerPedId(), data.component, defaultNum, 0)
            while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                Citizen.Wait(50)
            end
            ClearPedProp(PlayerPedId(), data.component)
            SetPedPropIndex(PlayerPedId(), data.component, defaultNum, 0, 0)
            return
        end
        if data.type == "Jacket" then
            SetPedPreloadVariationData(PlayerPedId(), 8, defaultNum, 0)
            while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                Citizen.Wait(50)
            end
            SetPedComponentVariation(PlayerPedId(), 8, defaultNum, 0, 0)
            -- Arms
            SetPedPreloadVariationData(PlayerPedId(), 3, defaultNum, 0)
            while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                Citizen.Wait(50)
            end
            SetPedComponentVariation(PlayerPedId(), 3, defaultNum, 0, 0)
        end
        SetPedPreloadVariationData(PlayerPedId(), data.component, defaultNum, 0)
        while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
            Citizen.Wait(50)
        end
        SetPedComponentVariation(PlayerPedId(), data.component, defaultNum, 0, 0)
        if data.type == "Hairs" then
            ClearPedDecorationsLeaveScars(PlayerPedId())
            TriggerServerEvent('clothing:loadPlayerTattoos:server')
        end
    elseif data.action == "wearCloth" then
        local defaultNum = data.num
        if data.type == "Hat" or data.type == "Glasses" then
            SetPedPreloadPropData(PlayerPedId(), data.num1, data.num2, 0)
            while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                Citizen.Wait(50)
            end
            ClearPedProp(PlayerPedId(), data.num1)
            SetPedPropIndex(PlayerPedId(), data.num1, data.num2, data.num3, 0)
            return
        end
        if data.type == "Jacket" then
            if data.num1 then
                SetPedPreloadVariationData(PlayerPedId(), 8, data.num1, 0)
                while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                    Citizen.Wait(50)
                end
                SetPedComponentVariation(PlayerPedId(), 8, data.num1, 0, 0)
            end
            -- Arms
            if data.num2 then
                SetPedPreloadVariationData(PlayerPedId(), 3, data.num2, 0)
                while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                    Citizen.Wait(50)
                end
                SetPedComponentVariation(PlayerPedId(), 3, data.num2, 0, 0)
            end
            --
            SetPedPreloadVariationData(PlayerPedId(), data.component, defaultNum, 0)
            while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                Citizen.Wait(50)
            end
            SetPedComponentVariation(PlayerPedId(), data.component, defaultNum, 0, 0)
            return
        end
        if data.type == "Hairs" then
            data.num3 = 0
            if skinData["hairFade"].item == 1 then
                ClearPedDecorationsLeaveScars(PlayerPedId())
                AddPedDecorationFromHashes(PlayerPedId(), hairDecor[charCreateGender][defaultNum][1], hairDecor[charCreateGender][defaultNum][2])
            end
            TriggerServerEvent('clothing:loadPlayerTattoos:server')
        end
        SetPedPreloadVariationData(PlayerPedId(), data.component, defaultNum, data.num3)
        while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
            Citizen.Wait(50)
        end
        SetPedComponentVariation(PlayerPedId(), data.component, defaultNum, data.num3, 0)
    elseif data.action == "loadPed" then
        local model = data.model
        if not IsModelValid(model) then return end
        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)
        SetPedDefaultComponentVariation(PlayerPedId())
        if model == "mp_m_freemode_01" then
            Citizen.Wait(500)
            createFirstCharacter("male", Config.CharacterCreationMenuCategories.Normal, true, true)
        end
        if model == "mp_f_freemode_01" then
            Citizen.Wait(500)
            createFirstCharacter("female", Config.CharacterCreationMenuCategories.Normal, true, true)
        end
        Citizen.Wait(1000)
        local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.05, 0.6, 0.45)
        SetCamCoord(createdCharCham, coords.x, coords.y, coords.z + 0.2)
        SetCamRot(createdCharCham, 0.0, 0.0, GetEntityHeading(PlayerPedId()) + 180)
    elseif data.action == "changeFaceFeature" then
        local nameConverters = {
            ["NoseWidth"] = "nose_0",
            ["NosePeak"] = "nose_1",
            ["NoseLength"] = "nose_2",
            ["NoseBoneCurveness"] = "nose_3",
            ["NoseTip"] = "nose_4",
            ["NoseBoneTwist"] = "nose_5",
            ["EyebrowHeight"] = "eyebrown_high",
            ["EyebrowDepth"] = "eyebrown_forward",
            ["CheekBoneHeight"] = "cheek_1",
            ["CheekBoneWidth"] = "cheek_2",
            ["CheekBoneWidth2"] = "cheek_3",
            ["EyesSquint"] = "eye_opening",
            ["LipsThickness"] = "lips_thickness",
            ["JawBoneLength"] = "jaw_bone_width",
            ["JawBoneWidth"] = "jaw_bone_back_lenght",
            ["ChinBoneHeight"] = "chimp_bone_lowering",
            ["ChinBoneLength"] = "chimp_bone_lenght",
            ["ChinBoneWidth"] = "chimp_bone_width",
            ["ChinCleft"] = "chimp_hole",
            ["NeckThickness"] = "neck_thikness"
        }
        skinData[nameConverters[data.name]] = {}
        skinData[nameConverters[data.name]].item = data.value
        SetPedFaceFeature(PlayerPedId(), data.num1, data.value)
    elseif data.action == "finalizeCharacter" then
        Config.ShowHUD()
        creatingChar = false
        SetEntityVisible(PlayerPedId(), true, 0)
        SetNuiFocus(false, false)
        DeletePed(createdCharChamPed)
        ClearTimecycleModifier()
        RenderScriptCams(false, true, 500, 1, 0)
        DestroyCam(createdCharCham, false)
        createdCharCham = nil
        FreezeEntityPosition(PlayerPedId(), false)
        if Config.SetCoordsAfterFinalize.Enable then
            SetEntityCoords(PlayerPedId(), vector3(Config.SetCoordsAfterFinalize.Coords.x, Config.SetCoordsAfterFinalize.Coords.y, Config.SetCoordsAfterFinalize.Coords.z))
            SetEntityHeading(PlayerPedId(), Config.SetCoordsAfterFinalize.Coords.w)
        end
        Config.CharacterFinalized()
        if data.type == "discard" then
            TriggerServerEvent('clothing:loadPlayerSkin:server')
            clothingStoreOpen = false
            Config.ClothStoreClosed()
            return
        end
        local model = GetEntityModel(PlayerPedId())
        skinData.model = model
        if Config.ModelSaveType == "modelname" then
            skinData.model = GetEntityArchetypeName(PlayerPedId())
            model = GetEntityArchetypeName(PlayerPedId())
        end
        TriggerServerEvent("clothing:saveSkin:server", model, skinData)
        TriggerEvent("inventory:c:giveClothesAsItem", skinData, {}, true)
    elseif data.action == "cancelBeforePayment" then
        SetNuiFocus(false, false)
        DeletePed(createdCharChamPed)
        ClearTimecycleModifier()
        RenderScriptCams(false, true, 500, 1, 0)
        DestroyCam(createdCharCham, false)
        createdCharCham = nil
        FreezeEntityPosition(PlayerPedId(), false)
        TriggerServerEvent('clothing:loadPlayerSkin:server')
        clothingStoreOpen = false
        Config.ClothStoreClosed()
        Config.ShowHUD()
    elseif data.action == "buyClothing" then
        TriggerCallback('clothing:buyClothing:server', function(hasMoney)
            cb(hasMoney)
            if hasMoney then
                Config.ShowHUD()
                SetNuiFocus(false, false)
                DeletePed(createdCharChamPed)
                ClearTimecycleModifier()
                RenderScriptCams(false, true, 500, 1, 0)
                DestroyCam(createdCharCham, false)
                createdCharCham = nil
                FreezeEntityPosition(PlayerPedId(), false)
                if currentClothStoreType == "tattoo" then
                    for k, v in pairs(shopTattoos) do
                        table.insert(currentTattoos, {collection = v.collection, name = v.name, name2 = v.name2, mname = k})
                    end
                    shopTattoos = {}
                    TriggerServerEvent('clothing:updateTattooList:server', currentTattoos)
                    TriggerServerEvent('clothing:loadPlayerSkin:server')
                else
                    local model = GetEntityModel(PlayerPedId())
                    skinData.model = model
                    if Config.ModelSaveType == "modelname" then
                        skinData.model = GetEntityArchetypeName(PlayerPedId())
                        model = GetEntityArchetypeName(PlayerPedId())
                    end
                    -- Only give items for the specific clothing type being purchased
                    if data.type == "pants" and skinData.pants then 
                        print('DEBUG: Current pants item:', skinData.pants.item)
                        print('DEBUG: Previous pants item:', previousSkinData.pants and previousSkinData.pants.item)
                        
                        if not previousSkinData.pants or skinData.pants.item ~= previousSkinData.pants.item then
                            local pantsData = {pants_1 = skinData.pants.item, pants_2 = skinData.pants.texture}
                            exports['inv']:addClothes('pants', 'Pantalon', pantsData)
                        end
                    end
                    
                    if data.type == "top" and ((skinData["t-shirt"] and skinData["t-shirt"].item ~= previousSkinData["t-shirt"].item) or 
                       (skinData.torso2 and skinData.torso2.item ~= previousSkinData.torso2.item)) then
                        local topData = {
                            tshirt_1 = skinData["t-shirt"].item,
                            tshirt_2 = skinData["t-shirt"].texture,
                            torso_1 = skinData.torso2.item, 
                            torso_2 = skinData.torso2.texture,
                            bproof_1 = skinData.vest.item,
                            bproof_2 = skinData.vest.texture,
                            arms_2 = skinData.arms.texture
                        }
                        print('Adding top:', json.encode(topData))
                        exports['inv']:addClothes('top', 'Haut', topData)
                    end

                    if data.type == "shoes" and skinData.shoes and skinData.shoes.item ~= previousSkinData.shoes.item then
                        print('Adding shoes:', json.encode({shoes_1 = skinData.shoes.item, shoes_2 = skinData.shoes.texture}))
                        local shoesData = {shoes_1 = skinData.shoes.item, shoes_2 = skinData.shoes.texture}
                        exports['inv']:addClothes('shoes', 'Chaussure', shoesData)
                    end

                    if data.type == "hat" and skinData.hat and skinData.hat.item ~= previousSkinData.hat.item then
                        print('Adding hat:', json.encode({helmet_1 = skinData.hat.item, helmet_2 = skinData.hat.texture}))
                        local helmetData = {helmet_1 = skinData.hat.item, helmet_2 = skinData.hat.texture}
                        exports['inv']:addClothes('helmet', 'Chapeau', helmetData)
                    end

                    if data.type == "glasses" and skinData.glass and skinData.glass.item ~= previousSkinData.glass.item then
                        print('Adding glasses:', json.encode({glasses_1 = skinData.glass.item, glasses_2 = skinData.glass.texture}))
                        local glassesData = {glasses_1 = skinData.glass.item, glasses_2 = skinData.glass.texture}
                        exports['inv']:addClothes('glasses', 'Lunette', glassesData)
                    end

                    if data.type == "ears" and skinData.ear and skinData.ear.item ~= previousSkinData.ear.item then
                        print('Adding ears:', json.encode({ears_1 = skinData.ear.item, ears_2 = skinData.ear.texture}))
                        local earsData = {ears_1 = skinData.ear.item, ears_2 = skinData.ear.texture}
                        exports['inv']:addClothes('ears', 'Oreille', earsData)
                    end

                    if data.type == "watches" and skinData.watch and skinData.watch.item ~= previousSkinData.watch.item then
                        print('Adding watch:', json.encode({watches_1 = skinData.watch.item, watches_2 = skinData.watch.texture}))
                        local watchData = {watches_1 = skinData.watch.item, watches_2 = skinData.watch.texture}
                        exports['inv']:addClothes('watches', 'Montre', watchData)
                    end

                    if data.type == "bracelets" and skinData.bracelet and skinData.bracelet.item ~= previousSkinData.bracelet.item then
                        print('Adding bracelet:', json.encode({bracelets_1 = skinData.bracelet.item, bracelets_2 = skinData.bracelet.texture}))
                        local braceletData = {bracelets_1 = skinData.bracelet.item, bracelets_2 = skinData.bracelet.texture}
                        exports['inv']:addClothes('bracelets', 'Bracelet', braceletData)
                    end

                    if data.type == "chain" and skinData.accessory and skinData.accessory.item ~= previousSkinData.accessory.item then
                        print('Adding chain:', json.encode({chain_1 = skinData.accessory.item, chain_2 = skinData.accessory.texture}))
                        local chainData = {chain_1 = skinData.accessory.item, chain_2 = skinData.accessory.texture}
                        exports['inv']:addClothes('chain', 'Chaine', chainData)
                    end

                    if data.type == "bags" and skinData.bag and skinData.bag.item ~= previousSkinData.bag.item then
                        print('Adding bag:', json.encode({bags_1 = skinData.bag.item, bags_2 = skinData.bag.texture}))
                        local bagData = {bags_1 = skinData.bag.item, bags_2 = skinData.bag.texture}
                        exports['inv']:addClothes('bags', 'Sac', bagData)
                    end

                    TriggerServerEvent("clothing:saveSkin:server", model, skinData)
                end
                Notify(Lang:t("notifications.clothes_paid"), "success", 7500)
                clothingStoreOpen = false
                Config.ClothStoreClosed()
            else
                Config.ShowHUD()
                SetNuiFocus(false, false)
                DeletePed(createdCharChamPed)
                ClearTimecycleModifier()
                RenderScriptCams(false, true, 500, 1, 0)
                DestroyCam(createdCharCham, false)
                createdCharCham = nil
                FreezeEntityPosition(PlayerPedId(), false)
                if currentClothStoreType == "tattoo" then
                    TriggerServerEvent('clothing:loadPlayerSkin:server')
                    shopTattoos = {}
                else
                    TriggerServerEvent('clothing:loadPlayerSkin:server')
                end
                Notify(Lang:t("notifications.not_enough_money"), "error", 7500)
                clothingStoreOpen = false
                Config.ClothStoreClosed()
            end
        end, data.type, data.amount)
        return
    elseif data.action == "changeTattoo" then
        for k, v in pairs(currentTattoos) do
            if v.mname == data.mname then
                currentTattoos[k] = nil
                return drawTattoo()
            end
        end
        if shopTattoos[data.mname] then
            shopTattoos[data.mname] = nil
        else
            shopTattoos[data.mname] = {collection = data.collection, name = data.name, name2 = data.name2}
        end
        drawTattoo()
    end
    cb(true)
end)

function drawTattoo()
    ClearPedDecorations(PlayerPedId())
    for k, v in pairs(currentTattoos) do
        if GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') then
            SetPedDecoration(PlayerPedId(), v.collection, v.name)
        else
            SetPedDecoration(PlayerPedId(), v.collection, v.name2)
        end
    end
    for k, v in pairs(shopTattoos) do
        if GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') then
            SetPedDecoration(PlayerPedId(), v.collection, v.name)
        else
            SetPedDecoration(PlayerPedId(), v.collection, v.name2)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000)
        if not clothingStoreOpen then
            TriggerCallback('clothing:getPlayerTattoos:server', function(tattooList)
                if not tattooList then
                    tattooList = {}
                end
                if tattooList then
                    ClearPedDecorations(PlayerPedId())
                    for k, v in pairs(tattooList) do
                        if GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') then
                            SetPedDecoration(PlayerPedId(), v.collection, v.name)
                        else
                            SetPedDecoration(PlayerPedId(), v.collection, v.name2)
                        end
                    end
                    currentTattoos = tattooList
                end
            end)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    if creatingChar then
        TriggerServerEvent('clothing:loadPlayerSkin:server')
    end
    charCam(false)
end)

Citizen.CreateThread(function()
    while true do
        local interval = 500
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if not menuActive and not clothingStoreOpen then
            for k, v in pairs(Config.Stores) do
                local dist = #(playerCoords - vector3(v.coords.x, v.coords.y, v.coords.z))
                
                if dist > 8 then goto continue end

                interval = 0
                
                DrawMarker(25, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 105, 219, 124, 255, false, false, 2, false, false, false, false)

                if dist < 2 then
                    local text = 'Appuyez sur [ ~g~E~w~ ] pour intéragir'
                    if v.shopType == "barber" then
                        text = 'Appuyez sur [ ~g~E~w~ ] pour intéragir'
                    elseif v.shopType == "tattoo" then  
                        text = 'Appuyez sur [ %sE~w~ ] pour intéragir'
                    end

                    DrawInstructionBarNotification(v.coords.x, v.coords.y, v.coords.z + 1.0, text)

                    if dist < 2 and IsControlJustPressed(0, 38) then
                        openClothStore(v.shopType)
                    end
                end

                ::continue::
            end
        end

        Wait(interval)
    end
end)

function openClothStore(type)
    TriggerCallback('clothing:getSkin:server', function(skin)
        currentPlayerSkin = skin
        skinData = skin
        previousSkinData = skin
    end)
    Citizen.Wait(500)
    Config.ClothStoreOpened()
    clothingStoreOpen = true
    TriggerServerEvent('clothing:loadPlayerSkin:server')
    local uuid = nil
    if Config.UseDefaultClothImages then
        TriggerCallback('clothing:getClothingUrl:server', function(urlData)
            uuid = urlData
        end, true)
    else
        TriggerCallback('clothing:getClothingUrl:server', function(urlData)
            uuid = urlData
        end, false)
        local startTime = GetGameTimer()
        while uuid == nil do 
            Citizen.Wait(0)  
            if GetGameTimer() - startTime > 5000 then
                uuid = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6"
                break
            end 
        end
    end
    local myPed = GetEntityModel(PlayerPedId())
    local myPedExists = false
    for k, v in pairs(Config.AllowedModels) do
        if myPed == GetHashKey(v) then
            myPedExists = true
        end
    end
    Citizen.Wait(250)
    if not myPedExists then return Notify(Lang:t("notifications.char_model_not_allowed"), "error", 7500) end
    -- Gender
    local gender = "male"
    for k, v in pairs(ManPlayerModels) do
        if myPed == GetHashKey(v) then
            gender = "male"
        end
    end
    for k, v in pairs(WomanPlayerModels) do
        if myPed == GetHashKey(v) then
            gender = "female"
        end
    end
    charCreateGender = gender
    -- Data
    local generalData = {}
    currentClothStoreType = type
    if type == "barber" then
        -- Chest Hair
        local chestHair = {}
        if Config.UseDefaultClothImages.Body then
            for i = -1, GetPedHeadOverlayNum(10) - 1 do
                table.insert(chestHair, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_BODY_10_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetPedHeadOverlayNum(10) - 1 do
                table.insert(chestHair, {num = i, image = uuid .. "_" .. gender .."_BODY_10_" .. i .. '.webp?v=2'})
            end
        end
        local chestHairNum = currentPlayerSkin["chesthair"].item
        table.insert(generalData, {
            action = "ChestHair",
            data = chestHair,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG3",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 10,
            currentDrawableVariation = chestHairNum
        })
        -- Makeup
        local makeup = {}
        if Config.UseDefaultClothImages.Makeup then
            for i = -1, GetPedHeadOverlayNum(4) - 1 do
                table.insert(makeup, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_4_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetPedHeadOverlayNum(4) - 1 do
                table.insert(makeup, {num = i, image = uuid .. "_" .. gender .."_HEAD_4_" .. i .. '.webp?v=2'})
            end
        end
        local makeupNum = currentPlayerSkin["makeup"].item
        table.insert(generalData, {
            action = "Makeup",
            data = makeup,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 4,
            currentDrawableVariation = makeupNum
        })
        -- Makeup Colors
        local makeUpColors = {
            {r = 153, g = 38, b = 51},
            {r = 197, g = 57, b = 92},
            {r = 188, g = 82, b = 105},
            {r = 184, g = 87, b = 123},
            {r = 167, g = 81, b = 106},
            {r = 176, g = 69, b = 79},
            {r = 128, g = 47, b = 53},
            {r = 164, g = 99, b = 97},
            {r = 193, g = 133, b = 123},
            {r = 204, g = 159, b = 154},
            {r = 199, g = 145, b = 145},
            {r = 172, g = 112, b = 101},
            {r = 174, g = 94, b = 80},
            {r = 167, g = 75, b = 52},
            {r = 179, g = 114, b = 118},
            {r = 201, g = 128, b = 145},
            {r = 238, g = 157, b = 190},
            {r = 230, g = 117, b = 163},
            {r = 224, g = 64, b = 128},
            {r = 181, g = 75, b = 111},
            {r = 111, g = 40, b = 56},
            {r = 78, g = 30, b = 44},
            {r = 170, g = 34, b = 48},
            {r = 223, g = 32, b = 50},
            {r = 207, g = 5, b = 19},
            {r = 232, g = 81, b = 112},
            {r = 219, g = 61, b = 180},
            {r = 194, g = 39, b = 177},
            {r = 160, g = 29, b = 171},
            {r = 113, g = 24, b = 114},
            {r = 111, g = 20, b = 100},
            {r = 83, g = 22, b = 91},
            {r = 107, g = 27, b = 158},
            {r = 24, g = 54, b = 114},
            {r = 26, g = 80, b = 168},
            {r = 28, g = 116, b = 187},
            {r = 34, g = 162, b = 207},
            {r = 41, g = 194, b = 210},
            {r = 36, g = 206, b = 167},
            {r = 40, g = 191, b = 124},
            {r = 26, g = 158, b = 48},
            {r = 16, g = 133, b = 1},
            {r = 110, g = 207, b = 68},
            {r = 199, g = 232, b = 55},
            {r = 223, g = 228, b = 47},
            {r = 255, g = 221, b = 35},
            {r = 250, g = 190, b = 40},
            {r = 245, g = 139, b = 39},
            {r = 255, g = 88, b = 13},
            {r = 192, g = 110, b = 28},
            {r = 248, g = 200, b = 128},
            {r = 251, g = 228, b = 197},
            {r = 247, g = 243, b = 244},
            {r = 179, g = 179, b = 181},
            {r = 144, g = 144, b = 144},
            {r = 86, g = 77, b = 78},
            {r = 23, g = 15, b = 13},
            {r = 87, g = 150, b = 155},
            {r = 77, g = 111, b = 138},
            {r = 25, g = 42, b = 85},
            {r = 159, g = 127, b = 106},
            {r = 131, g = 99, b = 88},
            {r = 110, g = 82, b = 70},
            {r = 62, g = 44, b = 40}
        }
        table.insert(generalData, {
            action = "FirstMakeupColor",
            data = makeUpColors,
            imgType = "",
            btnClick2 = true
        })
        table.insert(generalData, {
            action = "SecondMakeupColor",
            data = makeUpColors,
            imgType = "",
            btnClick2 = true
        })
        -- Blush
        local blush = {}
        if Config.UseDefaultClothImages.Makeup then
            for i = -1, GetPedHeadOverlayNum(5) - 1 do
                table.insert(blush, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_5_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetPedHeadOverlayNum(5) - 1 do
                table.insert(blush, {num = i, image = uuid .. "_" .. gender .."_HEAD_5_" .. i .. '.webp?v=2'})
            end
        end
        local blushNum = currentPlayerSkin["blush"].item
        table.insert(generalData, {
            action = "Blush",
            data = blush,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 5,
            currentDrawableVariation = blushNum
        })
        table.insert(generalData, {
            action = "FirstBlushColor",
            data = makeUpColors,
            imgType = "",
            btnClick2 = true
        })
        table.insert(generalData, {
            action = "SecondBlushColor",
            data = makeUpColors,
            imgType = "",
            btnClick2 = true
        })
        -- Lipstick
        local lipstick = {}
        if Config.UseDefaultClothImages.Makeup then
            for i = -1, GetPedHeadOverlayNum(8) - 1 do
                table.insert(lipstick, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_8_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetPedHeadOverlayNum(8) - 1 do
                table.insert(lipstick, {num = i, image = uuid .. "_" .. gender .."_HEAD_8_" .. i .. '.webp?v=2'})
            end
        end
        local lipstickNum = currentPlayerSkin["lipstick"].item
        table.insert(generalData, {
            action = "Lipstick",
            data = lipstick,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 8,
            currentDrawableVariation = lipstickNum
        })
        table.insert(generalData, {
            action = "FirstLipstickColor",
            data = makeUpColors,
            imgType = "",
            btnClick2 = true
        })
        table.insert(generalData, {
            action = "SecondLipstickColor",
            data = makeUpColors,
            imgType = "",
            btnClick2 = true
        })
        -- Eyebrows
        local eyebrows = {}
        for i = -1, GetPedHeadOverlayNum(2) - 1 do
            table.insert(eyebrows, {num = i, image = 'files/eyebrows/' .. i .. '.webp?v=2'})
        end
        local eyebrowNum = currentPlayerSkin["eyebrows"].item
        table.insert(generalData, {
            action = "Eyebrows",
            data = eyebrows,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            variationNumber = 2,
            currentDrawableVariation = eyebrowNum
        })
        --
        local colors = {
            {r = 29, g = 30, b = 32},
            {r = 42, g = 42, b = 44},
            {r = 48, g = 46, b = 49},
            {r = 52, g = 39, b = 30},
            {r = 70, g = 51, b = 34},
            {r = 91, g = 58, b = 39},
            {r = 108, g = 77, b = 57},
            {r = 105, g = 79, b = 62},
            {r = 113, g = 93, b = 69},
            {r = 126, g = 104, b = 83},
            {r = 153, g = 129, b = 93},
            {r = 166, g = 146, b = 109},
            {r = 175, g = 156, b = 114},
            {r = 183, g = 162, b = 99},
            {r = 211, g = 185, b = 128},
            {r = 216, g = 194, b = 145},
            {r = 158, g = 125, b = 90},
            {r = 156, g = 126, b = 90},
            {r = 101, g = 43, b = 32},
            {r = 93, g = 20, b = 13},
            {r = 97, g = 17, b = 10},
            {r = 122, g = 20, b = 16},
            {r = 158, g = 46, b = 26},
            {r = 180, g = 76, b = 41},
            {r = 158, g = 82, b = 50},
            {r = 171, g = 78, b = 44},
            {r = 98, g = 98, b = 98},
            {r = 128, g = 128, b = 128},
            {r = 170, g = 170, b = 170},
            {r = 197, g = 197, b = 198},
            {r = 71, g = 57, b = 83},
            {r = 90, g = 63, b = 108},
            {r = 118, g = 60, b = 119},
            {r = 237, g = 117, b = 225},
            {r = 232, g = 75, b = 144},
            {r = 239, g = 155, b = 189},
            {r = 6, g = 149, b = 157},
            {r = 5, g = 95, b = 130},
            {r = 5, g = 57, b = 114},
            {r = 63, g = 160, b = 109},
            {r = 37, g = 123, b = 96},
            {r = 23, g = 93, b = 85},
            {r = 180, g = 191, b = 52},
            {r = 113, g = 69, b = 10},
            {r = 70, g = 156, b = 21},
            {r = 219, g = 185, b = 88},
            {r = 230, g = 178, b = 0},
            {r = 233, g = 144, b = 2},
            {r = 244, g = 135, b = 50},
            {r = 250, g = 128, b = 87},
            {r = 225, g = 139, b = 88},
            {r = 205, g = 90, b = 61},
            {r = 209, g = 47, b = 36},
            {r = 166, g = 12, b = 2},
            {r = 137, g = 2, b = 6}
        }
        -- Facial Hairs
        local facialHairs = {}
        if Config.UseDefaultClothImages.Hair then
            for i = -1, GetPedHeadOverlayNum(1) - 1 do
                table.insert(facialHairs, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_1_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetPedHeadOverlayNum(1) - 1 do
                table.insert(facialHairs, {num = i, image = uuid .. "_" .. gender .."_HEAD_1_" .. i .. '.webp?v=2'})
            end
        end
        local _, _, _, facialHairsColor = GetPedHeadOverlayData(PlayerPedId(), 1)
        local facialHairNum = currentPlayerSkin["beard"].item
        table.insert(generalData, {
            action = "FacialHairs",
            data = facialHairs,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 1,
            currentDrawableVariation = facialHairNum,
            currentTextureDrawableVariation = facialHairsColor
        })
        table.insert(generalData, {
            action = "FacialHairsColors",
            data = colors,
            imgType = "",
            btnClick2 = true
        })
        table.insert(generalData, {
            action = "FacialHairsHighlightColors",
            data = colors,
            imgType = "",
            btnClick2 = true
        })
        -- Hairs
        local hairs = {}
        if Config.UseDefaultClothImages.Hair then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1 do
                table.insert(hairs, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_2_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1 do
                table.insert(hairs, {num = i, image = uuid .. "_" .. gender .."_HEAD_2_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Hairs",
            data = hairs,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = false,
            variationNumber = 2,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 2),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 2)
        })
        table.insert(generalData, {
            action = "HairsColors",
            data = colors,
            imgType = "",
            btnClick2 = true
        })
        table.insert(generalData, {
            action = "HairsHighlightColors",
            data = colors,
            imgType = "",
            btnClick2 = true
        })
        -- Jacket
        local jackets = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) do
                table.insert(jackets, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_11_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) do
                table.insert(jackets, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_11_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Jacket",
            data = jackets,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 11,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 11),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 11),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 11)
        })
        -- Pants
        local pants = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) do
                table.insert(pants, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_4_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) do
                table.insert(pants, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_4_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Pants",
            data = pants,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 4,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 4),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 4),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 4)
        })
        -- Masks
        local masks = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) do
                table.insert(masks, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_1_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) do
                table.insert(masks, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_1_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Masks",
            data = masks,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 1,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 1),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 1),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 1)
        })
        -- Bag
        local bags = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 5) do
                table.insert(bags, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_5_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 5) do
                table.insert(bags, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_5_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Bag",
            data = bags,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 5,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 5),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 5),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 5)
        })
        -- Hat
        local hat = {}
        if Config.UseDefaultClothImages.Accessories then
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0) - 1 do
                table.insert(hat, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_0_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0) - 1 do
                table.insert(hat, {num = i, image = uuid .. "_" .. gender .."_PROPS_0_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Hat",
            data = hat,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 0,
            currentDrawableVariation = skinData["hat"].item,
            currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 0),
            maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0)
        })
        -- Glasses
        local glasses = {}
        local minGlassesNumber = -1
        if gender == "male" then minGlassesNumber = 0 end
        if Config.UseDefaultClothImages.Accessories then
            for i = minGlassesNumber, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) - 1 do
                table.insert(glasses, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_1_" .. i .. '.webp?v=2'})
            end
        else
            for i = minGlassesNumber, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) - 1 do
                table.insert(glasses, {num = i, image = uuid .. "_" .. gender .."_PROPS_1_" .. i .. '.webp?v=2'})
            end
        end
        local currentGlasses = GetPedPropIndex(PlayerPedId(), 1)
        if currentGlasses == -1 then currentGlasses = 0 end
        table.insert(generalData, {
            action = "Glasses",
            data = glasses,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGGlasses",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 1,
            currentDrawableVariation = currentGlasses,
            currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 1),
            maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1)
        })
        -- Undershirt
        local undershirts = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) do
                table.insert(undershirts, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_8_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) do
                table.insert(undershirts, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_8_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Undershirt",
            data = undershirts,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 8,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 8),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 8),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 8)
        })
        -- Arms/Gloves
        local armsgloves = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) do
                table.insert(armsgloves, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_3_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) do
                table.insert(armsgloves, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_3_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Arms/Gloves",
            data = armsgloves,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 3,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 3),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 3),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 3)
        })
        -- Shoes
        local shoes = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) do
                table.insert(shoes, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_6_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) do
                table.insert(shoes, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_6_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Shoes",
            data = shoes,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 6,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 6),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 6),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 6)
        })
    elseif type == "clothing" then
        -- Jacket
        local jackets = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) do
                table.insert(jackets, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_11_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) do
                table.insert(jackets, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_11_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Jacket",
            data = jackets,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 11,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 11),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 11),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 11)
        })
        -- Pants
        local pants = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) do
                table.insert(pants, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_4_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) do
                table.insert(pants, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_4_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Pants",
            data = pants,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 4,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 4),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 4),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 4)
        })
        local colors = {
            {r = 29, g = 30, b = 32},
            {r = 42, g = 42, b = 44},
            {r = 48, g = 46, b = 49},
            {r = 52, g = 39, b = 30},
            {r = 70, g = 51, b = 34},
            {r = 91, g = 58, b = 39},
            {r = 108, g = 77, b = 57},
            {r = 105, g = 79, b = 62},
            {r = 113, g = 93, b = 69},
            {r = 126, g = 104, b = 83},
            {r = 153, g = 129, b = 93},
            {r = 166, g = 146, b = 109},
            {r = 175, g = 156, b = 114},
            {r = 183, g = 162, b = 99},
            {r = 211, g = 185, b = 128},
            {r = 216, g = 194, b = 145},
            {r = 158, g = 125, b = 90},
            {r = 156, g = 126, b = 90},
            {r = 101, g = 43, b = 32},
            {r = 93, g = 20, b = 13},
            {r = 97, g = 17, b = 10},
            {r = 122, g = 20, b = 16},
            {r = 158, g = 46, b = 26},
            {r = 180, g = 76, b = 41},
            {r = 158, g = 82, b = 50},
            {r = 171, g = 78, b = 44},
            {r = 98, g = 98, b = 98},
            {r = 128, g = 128, b = 128},
            {r = 170, g = 170, b = 170},
            {r = 197, g = 197, b = 198},
            {r = 71, g = 57, b = 83},
            {r = 90, g = 63, b = 108},
            {r = 118, g = 60, b = 119},
            {r = 237, g = 117, b = 225},
            {r = 232, g = 75, b = 144},
            {r = 239, g = 155, b = 189},
            {r = 6, g = 149, b = 157},
            {r = 5, g = 95, b = 130},
            {r = 5, g = 57, b = 114},
            {r = 63, g = 160, b = 109},
            {r = 37, g = 123, b = 96},
            {r = 23, g = 93, b = 85},
            {r = 180, g = 191, b = 52},
            {r = 113, g = 69, b = 10},
            {r = 70, g = 156, b = 21},
            {r = 219, g = 185, b = 88},
            {r = 230, g = 178, b = 0},
            {r = 233, g = 144, b = 2},
            {r = 244, g = 135, b = 50},
            {r = 250, g = 128, b = 87},
            {r = 225, g = 139, b = 88},
            {r = 205, g = 90, b = 61},
            {r = 209, g = 47, b = 36},
            {r = 166, g = 12, b = 2},
            {r = 137, g = 2, b = 6}
        }
        -- Facial Hairs
        local facialHairs = {}
        if Config.UseDefaultClothImages.Hair then
            for i = -1, GetPedHeadOverlayNum(1) - 1 do
                table.insert(facialHairs, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_1_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetPedHeadOverlayNum(1) - 1 do
                table.insert(facialHairs, {num = i, image = uuid .. "_" .. gender .."_HEAD_1_" .. i .. '.webp?v=2'})
            end
        end
        local _, _, _, facialHairsColor = GetPedHeadOverlayData(PlayerPedId(), 1)
        local facialHairNum = currentPlayerSkin["beard"].item
        table.insert(generalData, {
            action = "FacialHairs",
            data = facialHairs,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 1,
            currentDrawableVariation = facialHairNum,
            currentTextureDrawableVariation = facialHairsColor
        })
        table.insert(generalData, {
            action = "FacialHairsColors",
            data = colors,
            imgType = "",
            btnClick2 = true
        })
        table.insert(generalData, {
            action = "FacialHairsHighlightColors",
            data = colors,
            imgType = "",
            btnClick2 = true
        })
        -- Hairs
        local hairs = {}
        if Config.UseDefaultClothImages.Hair then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1 do
                table.insert(hairs, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_2_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1 do
                table.insert(hairs, {num = i, image = uuid .. "_" .. gender .."_HEAD_2_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Hairs",
            data = hairs,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = false,
            variationNumber = 2,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 2),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 2)
        })
        table.insert(generalData, {
            action = "HairsColors",
            data = colors,
            imgType = "",
            btnClick2 = true
        })
        table.insert(generalData, {
            action = "HairsHighlightColors",
            data = colors,
            imgType = "",
            btnClick2 = true
        })
        -- Masks
        local masks = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) do
                table.insert(masks, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_1_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) do
                table.insert(masks, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_1_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Masks",
            data = masks,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 1,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 1),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 1),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 1)
        })
        -- Bag
        local bags = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 5) do
                table.insert(bags, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_5_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 5) do
                table.insert(bags, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_5_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Bag",
            data = bags,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 5,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 5),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 5),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 5)
        })
        -- Hat
        local hat = {}
        if Config.UseDefaultClothImages.Accessories then
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0) - 1 do
                table.insert(hat, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_0_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0) - 1 do
                table.insert(hat, {num = i, image = uuid .. "_" .. gender .."_PROPS_0_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Hat",
            data = hat,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 0,
            currentDrawableVariation = skinData["hat"].item,
            currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 0),
            maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0)
        })
        -- Glasses
        local glasses = {}
        local minGlassesNumber = -1
        if gender == "male" then minGlassesNumber = 0 end
        if Config.UseDefaultClothImages.Accessories then
            for i = minGlassesNumber, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) - 1 do
                table.insert(glasses, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_1_" .. i .. '.webp?v=2'})
            end
        else
            for i = minGlassesNumber, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) - 1 do
                table.insert(glasses, {num = i, image = uuid .. "_" .. gender .."_PROPS_1_" .. i .. '.webp?v=2'})
            end
        end
        local currentGlasses = GetPedPropIndex(PlayerPedId(), 1)
        if currentGlasses == -1 then currentGlasses = 0 end
        table.insert(generalData, {
            action = "Glasses",
            data = glasses,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGGlasses",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 1,
            currentDrawableVariation = currentGlasses,
            currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 1),
            maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1)
        })
        -- Earrings
        local earrings = {}
        if Config.UseDefaultClothImages.Accessories then
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 2) - 1 do
                table.insert(earrings, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_2_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 2) - 1 do
                table.insert(earrings, {num = i, image = uuid .. "_" .. gender .."_PROPS_2_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Earrings",
            data = earrings,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 2,
            currentDrawableVariation = GetPedPropIndex(PlayerPedId(), 2),
            currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 2),
            maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 2)
        })
        -- Watches
        local watches = {}
        if Config.UseDefaultClothImages.Accessories then
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 6) - 1 do
                table.insert(watches, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_6_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 6) - 1 do
                table.insert(watches, {num = i, image = uuid .. "_" .. gender .."_PROPS_6_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Watches",
            data = watches,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 6,
            currentDrawableVariation = GetPedPropIndex(PlayerPedId(), 6),
            currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 6),
            maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 6)
        })
        -- Bracelets
        local bracelets = {}
        if Config.UseDefaultClothImages.Accessories then
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 7) - 1 do
                table.insert(bracelets, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_7_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 7) - 1 do
                table.insert(bracelets, {num = i, image = uuid .. "_" .. gender .."_PROPS_7_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Bracelets",
            data = bracelets,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 7,
            currentDrawableVariation = GetPedPropIndex(PlayerPedId(), 7),
            currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 7),
            maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 7)
        })
        -- Undershirt
        local undershirts = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) do
                table.insert(undershirts, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_8_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) do
                table.insert(undershirts, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_8_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Undershirt",
            data = undershirts,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 8,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 8),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 8),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 8)
        })
        -- Arms/Gloves
        local armsgloves = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) do
                table.insert(armsgloves, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_3_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) do
                table.insert(armsgloves, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_3_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Arms/Gloves",
            data = armsgloves,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 3,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 3),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 3),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 3)
        })
        -- Decals
        local decals = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 10) do
                table.insert(decals, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_10_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 10) do
                table.insert(decals, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_10_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Decals",
            data = decals,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 10,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 10),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 10),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 10)
        })
        -- Shoes
        local shoes = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) do
                table.insert(shoes, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_6_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) do
                table.insert(shoes, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_6_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Shoes",
            data = shoes,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 6,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 6),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 6),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 6)
        })
        -- Vest
        local vests = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 9) do
                table.insert(vests, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_9_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 9) do
                table.insert(vests, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_9_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Vest",
            data = vests,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 9,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 9),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 9),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 9)
        })
        -- Scarfs/Necklaces
        local scarfsNecklaces = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 7) do
                table.insert(scarfsNecklaces, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_7_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 7) do
                table.insert(scarfsNecklaces, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_7_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Scarfs/Necklaces",
            data = scarfsNecklaces,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 7,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 7),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 7),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 7)
        })
    elseif type == "tattoo" then
        local myPed = GetEntityModel(PlayerPedId())
        local myPedExists = false
        for k, v in pairs(Config.AllowedModels) do
            if myPed == GetHashKey(v) then
                myPedExists = true
            end
        end
        Citizen.Wait(250)
        if not myPedExists then return Notify(Lang:t("notifications.char_model_not_allowed"), "error", 7500) end
        -- Hairs
        local hairs = {}
        if Config.UseDefaultClothImages.Hair then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1 do
                table.insert(hairs, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_HEAD_2_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1 do
                table.insert(hairs, {num = i, image = uuid .. "_" .. gender .."_HEAD_2_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Hairs",
            data = hairs,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG2",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = false,
            variationNumber = 2,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 2),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 2)
        })
        -- Arms/Gloves
        local armsgloves = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) do
                table.insert(armsgloves, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_3_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) do
                table.insert(armsgloves, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_3_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Arms/Gloves",
            data = armsgloves,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 3,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 3),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 3),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 3)
        })
        -- Jacket
        local jackets = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) do
                table.insert(jackets, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_11_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) do
                table.insert(jackets, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_11_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Jacket",
            data = jackets,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 11,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 11),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 11),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 11)
        })
        -- Pants
        local pants = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) do
                table.insert(pants, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_4_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) do
                table.insert(pants, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_4_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Pants",
            data = pants,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 4,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 4),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 4),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 4)
        })
        -- Masks
        local masks = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) do
                table.insert(masks, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_1_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) do
                table.insert(masks, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_1_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Masks",
            data = masks,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 1,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 1),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 1),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 1)
        })
        -- Bag
        local bags = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 5) do
                table.insert(bags, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_5_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 5) do
                table.insert(bags, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_5_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Bag",
            data = bags,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 5,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 5),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 5),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 5)
        })
        -- Hat
        local hat = {}
        if Config.UseDefaultClothImages.Accessories then
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0) - 1 do
                table.insert(hat, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_0_" .. i .. '.webp?v=2'})
            end
        else
            for i = -1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0) - 1 do
                table.insert(hat, {num = i, image = uuid .. "_" .. gender .."_PROPS_0_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Hat",
            data = hat,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGMask",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 0,
            currentDrawableVariation = skinData["hat"].item,
            currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 0),
            maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0)
        })
        -- Glasses
        local glasses = {}
        local minGlassesNumber = -1
        if gender == "male" then minGlassesNumber = 0 end
        if Config.UseDefaultClothImages.Accessories then
            for i = minGlassesNumber, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) - 1 do
                table.insert(glasses, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_PROPS_1_" .. i .. '.webp?v=2'})
            end
        else
            for i = minGlassesNumber, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) - 1 do
                table.insert(glasses, {num = i, image = uuid .. "_" .. gender .."_PROPS_1_" .. i .. '.webp?v=2'})
            end
        end
        local currentGlasses = GetPedPropIndex(PlayerPedId(), 1)
        if currentGlasses == -1 then currentGlasses = 0 end
        table.insert(generalData, {
            action = "Glasses",
            data = glasses,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMGGlasses",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 1,
            currentDrawableVariation = currentGlasses,
            currentTextureDrawableVariation = GetPedPropTextureIndex(PlayerPedId(), 1),
            maxVariationNumber = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1)
        })
        -- Undershirt
        local undershirts = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) do
                table.insert(undershirts, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_8_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) do
                table.insert(undershirts, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_8_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Undershirt",
            data = undershirts,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            btnClick = true,
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 8,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 8),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 8),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 8)
        })
        -- Shoes
        local shoes = {}
        if Config.UseDefaultClothImages.Clothing then
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) do
                table.insert(shoes, {num = i, image = "https://r2.fivemanage.com/inw6pBxDUEnlX7rza66Mp/UUID7E9C0F42-B0C1-6314-918B-09782A8758D6_" .. gender .."_CLOTHING_6_" .. i .. '.webp?v=2'})
            end
        else
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) do
                table.insert(shoes, {num = i, image = uuid .. "_" .. gender .."_CLOTHING_6_" .. i .. '.webp?v=2'})
            end
        end
        table.insert(generalData, {
            action = "Shoes",
            data = shoes,
            btnClick = true,
            imgType = "mainDivBottomLeftBottomDivBottomDivBigIMG",
            style = "filter: brightness(0.8) contrast(1.2) saturate(1.4) hue-rotate(-10deg);",
            search = true,
            variationNumber = 6,
            currentDrawableVariation = GetPedDrawableVariation(PlayerPedId(), 6),
            currentTextureDrawableVariation = GetPedTextureVariation(PlayerPedId(), 6),
            maxVariationNumber = GetNumberOfPedDrawableVariations(PlayerPedId(), 6)
        })
        local tattoos = nil
        TriggerCallback('clothing:getPlayerTattoos:server', function(tattooList)
            if not tattooList then
                tattooList = {}
            end
            tattoos = tattooList
        end)
        while not tattoos do Citizen.Wait(0) end
        --Citizen.Wait(500)
        local AllTattooList = json.decode(LoadResourceFile(GetCurrentResourceName(), 'AllTattoos.json'))
        SendNUIMessage({action = "setTattooList", list = AllTattooList, tattoos = tattoos})
    end
    SetNuiFocus(true, true)
    local nameConverters = {
        ["Jacket"] = "jacket",
        ["Jacket"] = "torso2",
        ["Hat"] = "hat",
        ["Hairs"] = "hair",
        ["FacialHairs"] = "beard",
        ["Pants"] = "pants",
        ["Masks"] = "masks",
        ["Earrings"] = "ear",
        ["Glasses"] = "glass",
        ["Decals"] = "decals",
        ["Undershirt"] = "t-shirt",
        ["Watches"] = "watch",
        ["Bags"] = "bag",
        ["Scarfs/Necklaces"] = "accessory",
        ["Arms/Gloves"] = "arms",
        ["Shoes"] = "shoes",
        ["Bracelets"] = "bracelet",
        ["Vest"] = "vest",
        ["Eyebrows"] = "eyebrows",
        ["ChestHair"] = "chesthair",
        ["Makeup"] = "makeup",
        ["Blush"] = "blush",
        ["Lipstick"] = "lipstick"
    }
    for k, v in pairs(Config.ClothPrices) do
        if currentPlayerSkin[nameConverters[k]] then
            v.currentItemNum = currentPlayerSkin[nameConverters[k]].item
            v.currentTextureNum = currentPlayerSkin[nameConverters[k]].texture
        end
    end
    Config.HideHUD()
    local translations = {}
    for k in pairs(Lang.fallback and Lang.fallback.phrases or Lang.phrases) do
        if k:sub(0, ('menu.'):len()) then
            translations[k:sub(('menu.'):len() + 1)] = Lang:t(k)
        end
    end
    SendNUIMessage({action = "openClothStore", type = type, generalData = generalData, cps = Config.ClothPrices, gender = gender, translations = translations, currency = Config.ClothPriceCurrency})
    charCam(true)
end

function reloadSkin()
    local model
    local gender = 1
    if CoreName == "qb" then
        Core.Functions.GetPlayerData(function(pData)
            gender = pData.charinfo.gender
        end)
    else
        local pData = GetPlayerData()
        gender = pData.sex
    end
    local maxhealth = GetEntityMaxHealth(PlayerPedId())
    if gender == 1 then -- Gender is ONE for FEMALE
        model = GetHashKey("mp_f_freemode_01") -- Female Model
    else
        model = GetHashKey("mp_m_freemode_01") -- Male Model
    end
    RequestModel(model)
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    Citizen.Wait(1000) -- Safety Delay
    TriggerServerEvent('clothing:loadPlayerSkin:server')
    SetPedMaxHealth(PlayerId(), maxhealth)
    Citizen.Wait(1000) -- Safety Delay
    SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()))
end

AddEventHandler('gameEventTriggered', function(event, data)
    if event == 'CEventNetworkEntityDamage' then
        local victim, attacker, victimDied, weapon = data[1], data[2], data[4], data[7]
		if not IsEntityAPed(victim) then return end
        if victimDied and NetworkGetPlayerIndexFromPed(victim) == PlayerId() and IsEntityDead(PlayerPedId()) then
            if DoesCamExist(createdCharCham) then
                --TriggerServerEvent('clothing:loadPlayerSkin:server')
                SetNuiFocus(false, false)
                DeletePed(createdCharChamPed)
                ClearTimecycleModifier()
                RenderScriptCams(false, true, 500, 1, 0)
                DestroyCam(createdCharCham, false)
                createdCharCham = nil
                FreezeEntityPosition(PlayerPedId(), false)
                SendNUIMessage({action = "closeAll"})
                Config.ShowHUD()
                if clothingStoreOpen then
                    Config.ClothStoreClosed()
                end
            end
		end
	end
end)

function getPlayerClothing()
    local mySkin = nil
    TriggerCallback('clothing:getSkin:server', function(skin)
        mySkin = skin
    end)
    while mySkin == nil do Citizen.Wait(500) end
    return mySkin
end
exports('getPlayerClothing', getPlayerClothing)

function applyClothingToPed(data)
    if data.model then
        model = data.model ~= nil and (tonumber(data.model) or GetHashKey(data.model)) or false
        Citizen.CreateThread(function()
            RequestModel(model)
            while not HasModelLoaded(model) do
                RequestModel(model)
                Citizen.Wait(0)
            end
            SetPlayerModel(PlayerId(), model)
            SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)
            TriggerEvent('clothing:client:loadPlayerClothing', data, PlayerPedId())
        end)
    else
        TriggerEvent('clothing:client:loadPlayerClothing', data, PlayerPedId())
    end
end
exports('applyClothingToPed', applyClothingToPed)

RegisterNetEvent('clothing:saveSkin:client', function(skin)
    local model = GetEntityModel(PlayerPedId())
    skinData.model = model
    if Config.ModelSaveType == "modelname" then
        skinData.model = GetEntityArchetypeName(PlayerPedId())
        model = GetEntityArchetypeName(PlayerPedId())
    end
    TriggerServerEvent('clothing:saveSkin:server', model, skin)
end)