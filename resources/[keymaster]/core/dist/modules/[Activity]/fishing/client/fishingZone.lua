CreateThread(function()
    for k,v in pairs(SunnyConfigServ.Fishing.fishList.Zones) do
        for i,p in pairs(v) do
            local FishingZone = AddBlipForRadius(p.position, p.radius)
            SetBlipSprite(FishingZone,1)
            SetBlipColour(FishingZone, p.color)
            SetBlipAlpha(FishingZone,100)

            local FishingZoneBlip = AddBlipForCoord(p.position)
            SetBlipSprite(FishingZoneBlip, 317)
            SetBlipColour(FishingZoneBlip, p.color)
            SetBlipScale(FishingZoneBlip, 0.5)
            SetBlipAsShortRange(FishingZoneBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(p.zone)
            EndTextCommandSetBlipName(FishingZoneBlip)
        end
    end

    local zone = {
        name = nil,
        label = nil,
        boost = 0,
        level = 0,
        random = math.random(3000, 15000) ,
        isFish = false,
        fish = nil,
        isKeyPressed = false,
        keyPressedTime = 0,
        elapsedTime;
    }

    function getRandomFish()
        local totalRarity = 0

        local boost = zone.boost
        boost = boost * zone.level / 10

        for k,v in pairs(SunnyConfigServ.Fishing.fishList.FishList[zone.name]) do
            totalRarity = totalRarity + (1 / v.rarity) * boost
        end

        local randomValue = math.random() * totalRarity

        for k,v in pairs(SunnyConfigServ.Fishing.fishList.FishList[zone.name]) do
            randomValue = randomValue - (1 / v.rarity) * boost

            if randomValue <= 0 then
                return v
            end
        end
    end

    local rodProp = nil
    local rodPropName = "prop_fishing_rod_01"
    local rodOffsets = {
        x = 0.13, y = 0.02, z = -0.02, rx = -80.0, ry = 0.0, rz = 10.0
    }

    function AttachFishingRod()
        DetachFishingRod()
        local ped = Player.playerPed
        RequestModel(rodPropName)
        while not HasModelLoaded(rodPropName) do Wait(10) end
        rodProp = CreateObject(GetHashKey(rodPropName), 0, 0, 0, true, true, false)
        AttachEntityToEntity(rodProp, ped, GetPedBoneIndex(ped, 60309), rodOffsets.x, rodOffsets.y, rodOffsets.z, rodOffsets.rx, rodOffsets.ry, rodOffsets.rz, true, true, false, true, 1, true)
    end

    function DetachFishingRod()
        if rodProp and DoesEntityExist(rodProp) then
            DeleteEntity(rodProp)
            rodProp = nil
        end
    end

    RegisterNetEvent('SunnyServ:fishing:updateRod', function(durr)
        if zone and zone.dura and type(zone.dura) == "number" then
            zone.dura = zone.dura - 1
        elseif zone then
            zone.dura = durr
        end
    end)

    RegisterNetEvent('SunnyServ:fishing:zone:start', function(canName, durr)
        if SunnyConfigServ.Fishing.fishList.IsFishing then return(
            ESX.ShowNotification('~r~Vous êtes déjà entrain de pêcher~s~')
        )
        end

        zone = {
            name = nil,
            label = nil,
            boost = 0,
            level = 0,
            random = math.random(1000, 5000) ,
            isFish = false,
            fish = nil,
            isKeyPressed = false,
            keyPressedTime = 0,
            elapsedTime;
        }
    
        for k,v in pairs(SunnyConfigServ.Fishing.fishList.FishingRod) do
            if v.name == canName then
                zone.boost = v.boost
                if v.boutique == false then
                    if type(durr) == "number" then
                        zone.dura = v.fish - durr
                    else
                        zone.dura = v.fish
                    end
                else
                    zone.dura = 'Illimité'
                end
            end
        end

    
        for k,v in pairs(SunnyConfigServ.Fishing.fishList.Zones) do
            for i,p in pairs(v) do
                local dist = #(Player.coords-vector3(p.position.x, p.position.y, p.position.z))

                if dist > 120 then goto continue end

                zone.name = k
                zone.label = p.zone

                ::continue::
            end
        end

        if zone.name == nil then
            return(
                ESX.ShowNotification('~r~Vous n\'êtes pas dans une zone de pêche !~s~')
            )
        end

        ESX.ShowNotification(('Vous avez commencé à pêcher dans la zone: ~p~%s~s~'):format(zone.label))

        Wait(1000)

        AttachFishingRod()
        debutFishingRod = GetGameTimer()

        stopfish = function()
            SetTimeout(2000, function()
                if not SunnyConfigServ.Fishing.fishList.IsFishing then
                    exports['core-ui']:hideInfo()
                end
            end)
        end

        CreateThread(function()
            local waiting = 0
            if not fishing.player[Player.UniqueID] then
                ESX.TriggerServerCallback('SunnyServ:fishing:getInformations', function(cb)
                    if not cb then return end
        
                    if not fishing.player[Player.UniqueID] then
                        fishing.player[Player.UniqueID] = cb
                    end
                end)
        
            end
    
            while not fishing.player[Player.UniqueID] do Wait(1) end
    
            local PlayerData = fishing.player[Player.UniqueID]

            zone.level = PlayerData.level
    
            SunnyConfigServ.Fishing.fishList.IsFishing = true

            TaskStartScenarioInPlace(Player.playerPed, 'WORLD_HUMAN_STAND_FISHING')

            
            while SunnyConfigServ.Fishing.fishList.IsFishing do
                Wait(1)

                if not zone.isFish and GetGameTimer() - debutFishingRod < 10000 then
                    ESX.ShowHelpNotification('Appuyez sur ~INPUT_CELLPHONE_CANCEL~ pour arrêter de pêcher')
                end

                if IsControlJustPressed(0, 177) then
                    SunnyConfigServ.Fishing.fishList.IsFishing = false
                    zone.isFish = false
                    SunnyConfigServ.Fishing.fishList.Lures = false
                    zone.random = math.random(1000, 5000)
                    exports['core-ui']:hideInfo()
                    ClearPedTasks(Player.playerPed)
                    DetachFishingRod()
                    stopfish()
                end

                exports['core-ui']:drawInfo('Informations Pêche', {
                    {title = 'Zone de Pêche', subtitle = zone.label},
                    {title = 'XP', subtitle = zone.level},
                    -- {title = 'Boost de Pêche', subtitle = ('x%s'):format(zone.boost)},
                    {title = 'Durabilité de la canne à pêche', subtitle = (zone.dura and tostring(zone.dura) or "0")},
                })

                if SunnyConfigServ.Fishing.fishList.Lures == false then
                    DrawTextPrice('Acrrocher un appât à l\'hameçon')
                end

                if SunnyConfigServ.Fishing.fishList.Lures == true then
                    waiting = waiting + 1

                    if waiting >= zone.random and not zone.isFish then

                        zone.fish = getRandomFish()

                        ESX.ShowNotification('Nouveau poisson au bout de la ligne !')

                        zone.isFish = true

                        debutFishingRod = GetGameTimer()
                    end

                    if zone.isFish == true then
                        if not zone.isKeyPressed then
                            if GetGameTimer() - debutFishingRod >= 2000 then
                                zone.isFish = false
                                SunnyConfigServ.Fishing.fishList.Lures = false
                                zone.random = math.random(1000, 5000)
                                ESX.ShowNotification('Vous avez attendue trop longtemps, le poisson s\'est décroché.')
                            else
                                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour tenter d'attraper le poisson !")
                                if IsControlJustPressed(0, 38) then
                                    zone.isKeyPressed = true
                                    local nb = math.random(1, 3)
                                    local difficulties = {}
                                    for i = 1, nb do
                                        table.insert(difficulties, (math.random(1, 2) == 1) and "easy" or "easy")
                                    end
                                    local keys = {}
                                    for i = 1, nb do
                                        local key = ({'z','q','s','d'})[math.random(1,4)]
                                        table.insert(keys, key)
                                    end
                                    local success = lib.skillCheck(difficulties, keys)
                                    zone.isKeyPressed = false
                                    if success then
                                        PlayerData = fishing.player[Player.UniqueID]
                                        zone.isFish = false
                                        SunnyConfigServ.Fishing.fishList.Lures = false
                                        zone.random = math.random(1000, 5000)
                                        zone.isKeyPressed = false
                                        zone.keyPressedTime = 0
                                        zone.elapsedTime = nil
                                        waiting = 0
                                        if type(zone.dura) == "number" then
                                            zone.dura = zone.dura - 1
                                            TriggerServerEvent('SunnyServ:fishing:updateRod', zone.dura)
                                            if zone.dura <= 0 then
                                                ESX.ShowNotification("~r~Votre canne à pêche est cassée !")
                                                SunnyConfigServ.Fishing.fishList.IsFishing = false
                                                DetachFishingRod()
                                                break
                                            end
                                        end
                                        TriggerServerEvent('SunnyServ:fishing:fish:give', zone.fish.name, zone.fish.label, canName)
                                    else
                                        ESX.ShowNotification('Vous avez raté le poisson ! ~r~Ressayer encore~s~')
                                        zone.isFish = false
                                        SunnyConfigServ.Fishing.fishList.Lures = false
                                        zone.random = math.random(1000, 5000)
                                        zone.isKeyPressed = false
                                        zone.keyPressedTime = 0
                                        zone.elapsedTime = nil
                                        waiting = 0
                                    end
                                end
                            end
                        end
                    end
                end
            end
            DetachFishingRod()
        end)
    end)

    RegisterNetEvent('SunnyServ:fishing:lures:activate', function(Table)
        if not SunnyConfigServ.Fishing.fishList.IsFishing then
            return(
                ESX.ShowNotification('~r~Vous n\'êtes actuellement pas entrain de pêcher~s~')
            )
        end

        if Table[1] ~= zone.name then
            return(
                ESX.ShowNotification('~r~Vous ne pouvez pas utiliser cet appât pour ce type de pêche.~s~')
            )
        end

        if SunnyConfigServ.Fishing.fishList.Lures == true then
            return(
                ESX.ShowNotification('~r~Vous avez déjà un appât accroché à votre canne à pêche !~s~')
            )
        end

        SunnyConfigServ.Fishing.fishList.Lures = true

        TriggerServerEvent('SunnyServ:fishing:lures:remove', Table[2])

        ESX.ShowNotification(('Vous avez utilisé l\'appât: ~p~%s~s~'):format(Table[3]))
    end)

    RegisterNetEvent('SunnyServ:fishing:client:updateLevel', function(level)
        zone.level = level
        fishing.player[Player.UniqueID].level = level
    end)

    RegisterNetEvent('SunnyServ:fishing:client:stop', function()
        SunnyConfigServ.Fishing.fishList.IsFishing = false
        zone.isFish = false
        SunnyConfigServ.Fishing.fishList.Lures = false
        zone.random = math.random(1000, 5000)
        exports['core-ui']:hideInfo()
        ClearPedTasks(Player.playerPed)
        DetachFishingRod()
        SetTimeout(2000, function()
            if not SunnyConfigServ.Fishing.fishList.IsFishing then
                exports['core-ui']:hideInfo()
            end
        end)
    end)
end)