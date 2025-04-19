local Framework = nil

CreateThread(function()
    if Config.Framework.Type == "esx" then
        Framework = exports[Config.Framework.ResourceName]:getSharedObject()
    elseif Config.Framework.Type == "qbcore" then
        Framework = exports[Config.Framework.ResourceName]:GetCoreObject()
    else
        Framework = {}
    end
end)

local GoFastEnCours = false
local BlipsGoFast = nil
local isUIOpen = false
local isNearNPC = false
local deliveryPoint = nil
local activeHelpTexts = {}
local npcPed = nil
local isNPCHostile = false
local hostileThread = nil

local function normalize(vector)
    local length = math.sqrt(vector.x * vector.x + vector.y * vector.y + vector.z * vector.z)
    if length > 0 then
        return vector3(vector.x / length, vector.y / length, vector.z / length)
    end
    return vector3(0.0, 0.0, 0.0)
end

local function GetDistanceBetween(pos1, pos2)
    return #(vector3(pos1.x, pos1.y, pos1.z) - vector3(pos2.x, pos2.y, pos2.z))
end

local function ResetHostileNPC()
    if hostileThread then
        TerminateThread(hostileThread)
        hostileThread = nil
    end
    
    isNPCHostile = false
    
    if npcPed and DoesEntityExist(npcPed) then
        DeleteEntity(npcPed)
    end
    
    local model = GetHashKey(Config.GoFast.NPC.Model)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end
    
    npcPed = CreatePed(4, model, Config.GoFast.Pos.xyz, Config.GoFast.Pos.w, false, true)
    FreezeEntityPosition(npcPed, true)
    SetEntityInvincible(npcPed, true)
    SetBlockingOfNonTemporaryEvents(npcPed, true)
    TaskStartScenarioInPlace(npcPed, Config.GoFast.NPC.Scenario, 0, true)
    SetModelAsNoLongerNeeded(model)
end

local function FullResetControls()
    SetNuiFocus(false, false)
    
    SetPlayerControl(PlayerId(), true, 0)
    
    local playerPed = PlayerPedId()
    ClearPedTasks(playerPed)
    
    EnableAllControlActions(0)
    
    isUIOpen = false
    
    Citizen.SetTimeout(0, function()
        SetNuiFocus(false, false)
        SetPlayerControl(PlayerId(), true, 0)
    end)
end

local function PlayPedAnimation(ped, dict, anim, flag)
    if not DoesEntityExist(ped) then return end
    
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end
    
    if IsEntityPlayingAnim(ped, dict, anim, 3) then return end
    
    TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, flag or 0, 0, false, false, false)
end

local conversationAnims = {
    player = {
        {"mp_common", "givetake1_a", 48},
        {"mp_facial", "facial_nervous", 48},
        {"gestures@m@standing@casual", "gesture_please", 48},
        {"gestures@m@standing@casual", "gesture_what", 48},
        {"gestures@m@standing@casual", "gesture_hand_down", 48},
        {"gestures@m@standing@casual", "gesture_right", 48},
        {"gestures@m@standing@casual", "gesture_explain_wide", 48}
    },
    
    npc = {
        {"gestures@m@standing@casual", "gesture_hello", 48},
        {"gestures@m@standing@casual", "gesture_bring_it_on", 48},
        {"gestures@m@standing@casual", "gesture_come_here", 48},
        {"gestures@m@standing@casual", "gesture_easy_now", 48}, 
        {"gestures@m@standing@casual", "gesture_explaining", 48},
        {"gestures@m@standing@casual", "gesture_damn", 48},
        {"gestures@m@standing@casual", "gesture_no_way", 48}
    }
}

local function PlayRandomConversationAnimation(ped, isNpc)
    local animTable = isNpc and conversationAnims.npc or conversationAnims.player
    local randomAnim = animTable[math.random(#animTable)]
    PlayPedAnimation(ped, randomAnim[1], randomAnim[2], randomAnim[3])
end

local function MakeNPCHostile()
    if not npcPed or not DoesEntityExist(npcPed) then return end
    
    isNPCHostile = true
    
    FullResetControls()
    
    ClearPedTasks(npcPed)
    FreezeEntityPosition(npcPed, false)
    SetEntityInvincible(npcPed, false)
    SetBlockingOfNonTemporaryEvents(npcPed, false)
    
    PlayPedAnimation(npcPed, "reaction@intimidation@1h", "intro", 8)
    Wait(1200)
    
    GiveWeaponToPed(npcPed, GetHashKey(Config.GoFast.NPC.Weapon), 250, false, true)
    
    SetFacialIdleAnimOverride(npcPed, "mood_angry_1", 0)
    
    Citizen.SetTimeout(500, function()
        if DoesEntityExist(npcPed) and not IsEntityDead(npcPed) then
            TaskCombatPed(npcPed, PlayerPedId(), 0, 16)
            SetPedCombatAttributes(npcPed, 46, true)
            SetPedFleeAttributes(npcPed, 0, false)
        end
    end)
    
    if hostileThread then
        TerminateThread(hostileThread)
        hostileThread = nil
    end
    
    hostileThread = CreateThread(function()
        local startPosition = vector3(Config.GoFast.Pos.x, Config.GoFast.Pos.y, Config.GoFast.Pos.z)
        local playerPed = PlayerPedId()
        
        while isNPCHostile and npcPed and DoesEntityExist(npcPed) do
            Wait(1000)
            
            if IsEntityDead(npcPed) then
                Wait(Config.GoFast.Interaction.RespawnDelay)
                ResetHostileNPC()
                break
            end
            
            local playerPos = GetEntityCoords(playerPed)
            local npcPos = GetEntityCoords(npcPed)
            local distance = #(playerPos - npcPos)
            
            if distance > Config.GoFast.Interaction.NPCResetDistance then
                ResetHostileNPC()
                break
            end
            
            if distance < 30.0 and not IsEntityDead(npcPed) then
                if not IsPedInCombat(npcPed, playerPed) then
                    TaskCombatPed(npcPed, playerPed, 0, 16)
                end
            end
        end
    end)
end

local function PlayUISound(soundName, volume)
    SoundManager.PlaySound(soundName, volume)
end

RegisterNUICallback('playLibrarySound', function(data, cb)
    if not Config.UI.Sounds.Enabled then
        cb({success = false})
        return
    end
    
    PlayUISound(data.soundName, data.volume)
    cb({success = true})
end)

local function GetUIConfig()
    return {
        contact = {
            name = Config.UI.Contact.Name,
            icon = Config.UI.Contact.Icon,
            status = Config.UI.Contact.Status,
            iconBgColor = Config.UI.Contact.IconBgColor,
            iconGradient = {
                from = Config.UI.Contact.IconGradient.From,
                to = Config.UI.Contact.IconGradient.To
            }
        },
        messages = {
            intro = Config.UI.Messages.Intro,
            interested = Config.UI.Messages.Interested,
            rules = Config.UI.Messages.Rules,
            understand = Config.UI.Messages.Understand,
            waiting = Config.UI.Messages.Waiting,
            vehicleComing = Config.UI.Messages.VehicleComing,
            angry = Config.UI.Messages.Angry,
            threat = Config.UI.Messages.Threat
        },
        options = {
            intro = Config.UI.Options.Intro,
            interested = Config.UI.Options.Interested,
            rules = Config.UI.Options.Rules,
            understand = Config.UI.Options.Understand
        },
        animation = {
            showDelay = Config.UI.Animation.ShowDelay,
            typingSpeed = Config.UI.Animation.TypingSpeed,
            messageDelay = Config.UI.Animation.MessageDelay,
            optionsDelay = Config.UI.Animation.OptionsDelay,
            transitionSpeed = Config.UI.Animation.TransitionSpeed,
            hostileDuration = Config.UI.Animation.HostileDuration,
            angryMessageDelay = Config.UI.Animation.AngryMessageDelay,
            threatMessageDelay = Config.UI.Animation.ThreatMessageDelay
        },
        appearance = {
            width = Config.UI.Appearance.Width,
            maxWidth = Config.UI.Appearance.MaxWidth,
            minWidth = Config.UI.Appearance.MinWidth,
            position = {
                bottom = Config.UI.Appearance.Position.Bottom,
                center = Config.UI.Appearance.Position.Center
            },
            colors = {
                background = Config.UI.Appearance.Colors.Background,
                headerBg = Config.UI.Appearance.Colors.HeaderBg,
                border = Config.UI.Appearance.Colors.Border,
                theirMessage = Config.UI.Appearance.Colors.TheirMessage,
                myMessage = Config.UI.Appearance.Colors.MyMessage,
                theirText = Config.UI.Appearance.Colors.TheirText,
                myText = Config.UI.Appearance.Colors.MyText,
                nameText = Config.UI.Appearance.Colors.NameText,
                statusText = Config.UI.Appearance.Colors.StatusText,
                optionBg = Config.UI.Appearance.Colors.OptionBg,
                optionText = Config.UI.Appearance.Colors.OptionText,
                optionHoverBg = Config.UI.Appearance.Colors.OptionHoverBg
            },
            blur = {
                enable = Config.UI.Appearance.Blur.Enable,
                amount = Config.UI.Appearance.Blur.Amount
            },
            borderRadius = {
                container = Config.UI.Appearance.BorderRadius.Container,
                message = Config.UI.Appearance.BorderRadius.Message,
                option = Config.UI.Appearance.BorderRadius.Option
            },
            shadow = Config.UI.Appearance.Shadow,
            font = {
                family = Config.UI.Appearance.Font.Family,
                sizeName = Config.UI.Appearance.Font.SizeName,
                sizeStatus = Config.UI.Appearance.Font.SizeStatus,
                sizeMessage = Config.UI.Appearance.Font.SizeMessage,
                sizeOption = Config.UI.Appearance.Font.SizeOption
            }
        }
    }
end

RegisterNUICallback('animateCharacter', function(data, cb)
    if not npcPed or not DoesEntityExist(npcPed) then 
        cb({success = false})
        return
    end
    
    local action = data.action or ""
    local playerPed = PlayerPedId()
    
    if action == "contact_typing" then
        PlayRandomConversationAnimation(npcPed, true)
    elseif action == "player_typing" then
        PlayRandomConversationAnimation(playerPed, false)
    else
        local animations = {
            intro = {
                interested = {dict = "gestures@m@standing@casual", anim = "gesture_hello", flag = 48},
                decline = {dict = "gestures@m@standing@casual", anim = "gesture_shrug_hard", flag = 48}
            },
            interested = {
                continue = {dict = "gestures@m@standing@casual", anim = "gesture_explaining", flag = 48}
            },
            rules = {
                understand = {dict = "gestures@m@standing@casual", anim = "gesture_right_d", flag = 48},
                refuse = {dict = "gestures@m@standing@casual", anim = "gesture_no_way", flag = 48}
            },
            understand = {
                accept = {dict = "mp_common", anim = "givetake1_a", flag = 48},
                refuse = {dict = "gestures@m@standing@casual", anim = "gesture_damn", flag = 48}
            }
        }
        
        local dialogState = data.dialogState
        local selection = data.selection
        
        if animations[dialogState] and animations[dialogState][selection] then
            local animData = animations[dialogState][selection]
            PlayPedAnimation(npcPed, animData.dict, animData.anim, animData.flag)
        end
    end
    
    cb({success = true})
end)

RegisterNUICallback('npcHostile', function(data, cb)
    MakeNPCHostile()
    cb({})
end)

RegisterNUICallback('resetFocus', function(data, cb)
    FullResetControls()
    cb({success = true})
end)

local function ShowHelpNotification(id, control, msg)
    if activeHelpTexts[id] then return end
    activeHelpTexts[id] = true
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName('Appuyez sur ~INPUT_PICKUP~ pour ' .. msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

local function HideHelpNotification(id)
    if not activeHelpTexts[id] then return end
    activeHelpTexts[id] = false
    ClearAllHelpMessages()
end

local function getZoneName(coords)
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    return string.format("%s, %s", 
        GetStreetNameFromHashKey(streetHash),
        GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    )
end

local function getVehicleDisplayName(model)
    return GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(model)))
end

local function cleanupMission()
    if BlipsGoFast then RemoveBlip(BlipsGoFast) end
    BlipsGoFast = nil
    GoFastEnCours = false
    deliveryPoint = nil
    HideHelpNotification("gofast_delivery")
    HideHelpNotification("gofast_npc")
    SendNUIMessage({type = 'hideUI'})
end

local function OpenGoFastDialog()
    if isUIOpen then return end
    isUIOpen = true
    
    local playerPed = PlayerPedId()
    TaskTurnPedToFaceEntity(playerPed, npcPed, -1)
    
    TaskTurnPedToFaceEntity(npcPed, playerPed, -1)
    
    SetNuiFocus(true, true)
    
    SendNUIMessage({
        type = 'showDialog',
        config = GetUIConfig()
    })
end

RegisterNUICallback('startGoFast', function(data, cb)
    local availableSpawnPoint = nil
    for _, point in ipairs(Config.GoFast.SpawnPoints) do
        local vehicles = nil
        
        if Config.Framework.Type == "esx" then
            vehicles = Framework.Game.GetVehiclesInArea(point.xyz, 3.0)
        else
            vehicles = {}
            local nearbyVehicles = GetGamePool('CVehicle')
            for i = 1, #nearbyVehicles do
                local vehicleCoords = GetEntityCoords(nearbyVehicles[i])
                local distance = #(point.xyz - vehicleCoords) 
                if distance <= 3.0 then
                    table.insert(vehicles, nearbyVehicles[i])
                end
            end
        end
        
        if #vehicles == 0 then
            availableSpawnPoint = point
            break
        end
    end
    
    if not availableSpawnPoint then
        SetNuiFocus(false, false)
        isUIOpen = false
        SendNUIMessage({type = 'hideDialog'})
        
        if Config.Framework.Type == "esx" then
            Framework.ShowNotification("~r~Tous les points de spawn sont occupés. Attendez qu'un point se libère.")
        elseif Config.Framework.Type == "qbcore" then
            Framework.Functions.Notify("Tous les points de spawn sont occupés. Attendez qu'un point se libère.", "error")
        else
            TriggerEvent('nevagofast:notification', "Tous les points de spawn sont occupés. Attendez qu'un point se libère.", "error")
        end
        
        cb({success = false})
        return
    end

    SetNuiFocus(false, false)
    isUIOpen = false
    SendNUIMessage({type = 'hideDialog'})
    TriggerServerEvent('nevagofast:requestStart')
    cb({success = true})
end)

RegisterNUICallback('closeMenu', function(data, cb)
    FullResetControls()
    
    SendNUIMessage({type = 'hideDialog'})
    
    cb({success = true})
end)

RegisterNetEvent('nevagofast:notification')
AddEventHandler('nevagofast:notification', function(message, type)
    if Config.Framework.Type == "esx" then
        Framework.ShowNotification(message)
    elseif Config.Framework.Type == "qbcore" then
        Framework.Functions.Notify(message, type)
    else
        SetNotificationTextEntry('STRING')
        AddTextComponentString(message)
        DrawNotification(false, true)
    end
end)

RegisterNetEvent('nevagofast:itemCheckResult')
AddEventHandler('nevagofast:itemCheckResult', function(hasItem)
    if not GoFastEnCours then return end
    
    if not hasItem then
        if Config.Framework.Type == "esx" then
            Framework.ShowNotification("~r~Vous avez perdu la marchandise! Mission échouée.")
        elseif Config.Framework.Type == "qbcore" then
            Framework.Functions.Notify("Vous avez perdu la marchandise! Mission échouée.", "error")
        else
            TriggerEvent('nevagofast:notification', "Vous avez perdu la marchandise! Mission échouée.", "error")
        end
        
        CreateThread(function()
            local startTime = GetGameTimer()
            
            while GetGameTimer() - startTime < (Config.GoFast.Items.MaxTimeWithout * 1000) do
                Wait(5000)
                TriggerServerEvent('nevagofast:checkItemServer', itemName)
                Wait(1000)
                
                if not GoFastEnCours then break end
            end
        end)
    end
end)

RegisterNetEvent('nevagofast:completionResult')
AddEventHandler('nevagofast:completionResult', function(success)
    if success then
        HideHelpNotification("gofast_delivery")
        GoFastEnCours = false
        
        if BlipsGoFast then RemoveBlip(BlipsGoFast) end
        BlipsGoFast = nil
        deliveryPoint = nil
    else
        if Config.Framework.Type == "esx" then
            Framework.ShowNotification("~r~Livraison échouée.")
        elseif Config.Framework.Type == "qbcore" then
            Framework.Functions.Notify("Livraison échouée.", "error")
        else
            TriggerEvent('nevagofast:notification', "Livraison échouée.", "error")
        end
    end
end)

local function AttemptDelivery()
    if not GoFastEnCours or not deliveryPoint then return end
    
    local playerPed = PlayerPedId()
    if not IsPedInAnyVehicle(playerPed, false) then 
        TriggerEvent('nevagofast:notification', "Vous devez être dans le véhicule.", "error")
        return
    end
    
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local plate = GetVehicleNumberPlateText(vehicle)
    
    TriggerServerEvent('nevagofast:tryCompleteServer', plate)
end

CreateThread(function()
    local model = GetHashKey(Config.GoFast.NPC.Model)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    npcPed = CreatePed(4, model, Config.GoFast.Pos.xyz, Config.GoFast.Pos.w, false, true)
    FreezeEntityPosition(npcPed, Config.GoFast.NPC.InitiallyBlocked)
    SetEntityInvincible(npcPed, Config.GoFast.NPC.Invincible)
    SetBlockingOfNonTemporaryEvents(npcPed, true)
    TaskStartScenarioInPlace(npcPed, Config.GoFast.NPC.Scenario, 0, true)
    SetModelAsNoLongerNeeded(model)

    local npcPos = vector3(Config.GoFast.Pos.x, Config.GoFast.Pos.y, Config.GoFast.Pos.z)
    local isTextShowing = false

    while true do
        local sleep = 1000
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - npcPos)

        if not isNPCHostile and distance <= Config.GoFast.Interaction.NotificationDistance and not isUIOpen then
            if distance <= Config.GoFast.Interaction.Distance then
                if not isTextShowing then
                    ShowHelpNotification("gofast_npc", "INPUT_PICKUP", "intéragir")
                    isTextShowing = true
                end
                if IsControlJustPressed(0, Config.GoFast.Interaction.InteractionKey) then
                    HideHelpNotification("gofast_npc")
                    OpenGoFastDialog()
                end
                sleep = 0
            else
                if isTextShowing then
                    HideHelpNotification("gofast_npc")
                    isTextShowing = false
                end
                sleep = Config.GoFast.Interaction.DetectionInterval
            end
        else
            if isTextShowing then
                HideHelpNotification("gofast_npc")
                isTextShowing = false
            end
        end

        if isUIOpen and distance > Config.GoFast.Interaction.NotificationDistance then
            SetNuiFocus(false, false)
            isUIOpen = false
            SendNUIMessage({type = 'hideDialog'})
            if isTextShowing then
                HideHelpNotification("gofast_npc")
                isTextShowing = false
            end
        end

        Wait(sleep)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    HideHelpNotification("gofast_npc")
    HideHelpNotification("gofast_delivery")
    
    if npcPed and DoesEntityExist(npcPed) then
        DeleteEntity(npcPed)
    end
end)

RegisterNetEvent('nevagofast:startMission')
AddEventHandler('nevagofast:startMission', function(data)
    if GoFastEnCours then
        Framework.ShowNotification("~r~Une mission est déjà en cours.")
        return
    end

    GoFastEnCours = true
    deliveryPoint = data.deliveryPoint

    local model = GetHashKey(data.vehicle)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    local vehicle = CreateVehicle(model, data.spawnPoint.x, data.spawnPoint.y, data.spawnPoint.z, data.spawnPoint.w, true, false)
    SetVehicleNumberPlateText(vehicle, Config.GoFast.Vehicles.Customization.RandomPlate and GenerateRandomPlate() or Config.GoFast.Vehicles.Customization.PlatePrefix)
    SetVehicleOnGroundProperly(vehicle)
    SetModelAsNoLongerNeeded(model)

    BlipsGoFast = AddBlipForCoord(deliveryPoint.x, deliveryPoint.y, deliveryPoint.z)
    SetBlipSprite(BlipsGoFast, Config.GoFast.BlipSettings.Sprite)
    SetBlipColour(BlipsGoFast, 1) -- Rouge
    SetBlipScale(BlipsGoFast, Config.GoFast.BlipSettings.Scale)
    SetBlipRoute(BlipsGoFast, Config.GoFast.BlipSettings.Route)
    SetBlipRouteColour(BlipsGoFast, 1) -- Rouge
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.GoFast.BlipSettings.Label)
    EndTextCommandSetBlipName(BlipsGoFast)

    Framework.ShowNotification("~g~Votre véhicule est prêt. Rendez-vous au point de livraison.")
end)

CreateThread(function()
    while true do
        Wait(500)

        if GoFastEnCours and deliveryPoint then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local distance = #(playerCoords - vector3(deliveryPoint.x, deliveryPoint.y, deliveryPoint.z))

            if distance <= Config.GoFast.Interaction.Distance then
                Framework.ShowNotification("~g~Vous avez atteint le point de livraison.")
                TriggerServerEvent('nevagofast:completeDelivery')
                cleanupMission()
            end
        end
    end
end)

function GenerateRandomPlate()
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local plate = ""
    for i = 1, 8 do
        plate = plate .. chars:sub(math.random(1, #chars), math.random(1, #chars))
    end
    return plate
end
