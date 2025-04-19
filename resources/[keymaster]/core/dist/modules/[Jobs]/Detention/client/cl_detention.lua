local isInJail = false
local currentPrison = nil
local remainingTime = 0
local DEBUG = true
local lastUpdate = 0
local nearbyPlayers = {}
local prisoners = {}
local selectedPrisoner = nil
local updateInterval = 1000

function DebugPrint(msg)
    if DEBUG then print('[Detention Debug]', msg) end
end

local function InitializeConfig()
    if not Config.Detention then
        Config.Detention = {
            Debug = false,
            AuthorizedJobs = {
                ['police'] = true,
                ['bcso'] = true,
                ['fbi'] = true
            },
            Prisons = {
                ["LSPDHQ"] = {
                    PedPosition = vector4(37.681945800781, -362.5891418457, 40.836261749268, 69.251777648926),
                    PedModel = "s_m_m_prisguard_01",
                    DrawText = "Gardien de Prison", 
                    DetentionZone = vector3(43.262310028076, -364.51116943359, 40.836212158203),
                    Cells = {
                        vector4(40.28991317749, -359.39590454102, 40.836261749268, 179.44187927246),
                        vector4(37.396507263184, -366.38262939453, 40.836277008057, 301.36929321289), 
                        vector4(43.992450714111, -360.62435913086, 40.836261749268, 171.74336242676),
                        vector4(41.44722366333, -368.24923706055, 40.836265563965, 331.18380737305),
                        vector4(47.816822052002, -362.07733154297, 40.836261749268, 180.25598144531),
                        vector4(45.853614807129, -370.1340637207, 40.836265563965, 355.46676635742)
                    }
                },
                ["BCSO"] = {
                    PedPosition = vector4(1739.1892089844, 3854.3803710938, 34.996711730957, 255.48452758789),
                    PedModel = "s_m_m_prisguard_01",
                    DrawText = "Gardien de Prison", 
                    DetentionZone = vector3(43.262310028076, -364.51116943359, 40.836212158203),
                    Cells = {
                        vector4(1731.4940185547, 3850.5302734375, 35.01106262207, 117.92051696777),
                        vector4(1732.2821044922, 3858.0219726562, 35.010707855225, 211.68350219727)
                    }
                },
                ["BCSO2"] = {
                    PedPosition = vector4(-440.55160522461, 6010.9711914062, 27.581518173218, 131.3330078125),
                    PedModel = "s_m_m_prisguard_01",
                    DrawText = "Gardien de Prison", 
                    DetentionZone = vector3(-445.8244934082, 6015.1362304688, 27.581495285034),
                    Cells = {
                        vector4(-446.30352783203, 6011.728515625, 27.581497192383, 320.80541992188),
                        vector4(-441.92391967773, 6016.091796875, 27.581497192383, 150.69465637207),
                        vector4(-444.9866027832, 6018.7680664062, 27.58074760437, 134.54679870605),
                        vector4(-449.20596313477, 6014.2568359375, 27.581497192383, 286.93756103516)
                    }
                }
            }
        }
    end
end

-- local function CreatePrisonPed(prisonName, prison)
--     local modelHash = GetHashKey(prison.PedModel)
--     RequestModel(modelHash)
    
--     while not HasModelLoaded(modelHash) do Wait(50) end
    
--     local ped = CreatePed(4, modelHash, prison.PedPosition.xyz, prison.PedPosition.w, false, true)
--     if DoesEntityExist(ped) then
--         SetEntityAsMissionEntity(ped, true, true)
--         SetBlockingOfNonTemporaryEvents(ped, true)
--         FreezeEntityPosition(ped, true)
--         SetEntityInvincible(ped, true)
--     end
--     return ped
-- end

local function UpdateNearbyPlayers()
    nearbyPlayers = {}
    if DEBUG then
        table.insert(nearbyPlayers, {
            serverId = GetPlayerServerId(PlayerId()),
            name = GetPlayerName(PlayerId())
        })
    end
    
    local players = ESX.Game.GetPlayersInArea(GetEntityCoords(PlayerPedId()), 5.0)
    for _, player in ipairs(players) do
        if player ~= PlayerId() then
            table.insert(nearbyPlayers, {
                serverId = GetPlayerServerId(player),
                name = GetPlayerName(player)
            })
        end
    end
end

local function UpdatePrisonersList()
    if GetGameTimer() - lastUpdate > updateInterval then
        ESX.TriggerServerCallback('detention:getPrisoners', function(prisonersList)
            prisoners = prisonersList
            lastUpdate = GetGameTimer()
        end)
    end
end

local function HandleJailTimer()
    if not isInJail or remainingTime <= 0 then return end
    
    remainingTime = remainingTime - 5
    exports['core-ui']:drawInfo('Informations Détention', {
        {title = 'Temps Restant', subtitle = ('%s minutes'):format(math.ceil(remainingTime/60))},
        {title = 'Raison', subtitle = currentReason or 'Non spécifiée'}
    })
end

CreateThread(function()
    while not ESX do Wait(100) end
    while not Config do Wait(100) end
    
    InitializeConfig()
    
    for prisonName, prison in pairs(Config.Detention.Prisons) do
        CreateThread(function()
            local lastCheck = 0
            while true do
                local sleep = 1000
                
                if ESX.PlayerData.job and Config.Detention.AuthorizedJobs[ESX.PlayerData.job.name] then
                    local playerPos = GetEntityCoords(PlayerPedId())
                    local dist = #(playerPos - prison.PedPosition.xyz)
                    
                    if dist < 10.0 then
                        sleep = 0
                        DrawMarker(25, prison.PedPosition.x, prison.PedPosition.y, prison.PedPosition.z - 1, 0, 0, 0, 0, 0, 0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, true, 2, nil, nil, false)
                        
                        if dist < 2.0 then
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu de détention")
                            if IsControlJustPressed(0, 38) then
                                OpenDetentionMenu(prisonName)
                            end
                        end
                    end
                end
                
                Wait(sleep)
            end
        end)
    end
end)

function OpenDetentionMenu(prisonName)
    local main = RageUI.CreateMenu("", "Actions disponibles")
    local playerList = RageUI.CreateSubMenu(main, "", "Liste des joueurs")
    local prisonersList = RageUI.CreateSubMenu(main, "", "Liste des détenus")
    local prisonerInfo = RageUI.CreateSubMenu(prisonersList, "", "Informations")
    
    local prisoners = {}
    local selectedPrisoner = nil
    local nearbyPlayers = {}

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)

    CreateThread(function()
        while main do
            Wait(0)
            RageUI.IsVisible(main, function()
                RageUI.Button("Mettre en détention", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        nearbyPlayers = {}
                        
                        if DEBUG then
                            table.insert(nearbyPlayers, {
                                serverId = GetPlayerServerId(PlayerId()),
                                name = GetPlayerName(PlayerId())
                            })
                            DebugPrint("Joueur local ajouté")
                        end
                        
                        local players = ESX.Game.GetPlayersInArea(GetEntityCoords(PlayerPedId()), 5.0)
                        for _, player in ipairs(players) do
                            if player ~= PlayerId() then
                                table.insert(nearbyPlayers, {
                                    serverId = GetPlayerServerId(player),
                                    name = GetPlayerName(player)
                                })
                                DebugPrint("Joueur ajouté: " .. GetPlayerName(player))
                            end
                        end
                    end
                }, playerList)

                RageUI.Button("Liste des détenus", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('detention:getPrisoners', function(prisonersList)
                            prisoners = prisonersList
                        end)
                    end
                }, prisonersList)
            end)

            RageUI.IsVisible(playerList, function()
                if #nearbyPlayers == 0 then
                    RageUI.Separator("")
                    RageUI.Separator("~r~Aucune personne à proximité")
                    RageUI.Separator("Rapprochez-vous pour mettre")
                    RageUI.Separator("quelqu'un en détention")
                    RageUI.Separator("")
                else
                    for _, player in ipairs(nearbyPlayers) do
                        RageUI.Button(player.name, "Cliquez pour mettre en détention", {}, true, {
                            onSelected = function()
                                DebugPrint("Ouverture du menu de détention pour " .. player.name)
                                local input = lib.inputDialog('Mise en détention', {
                                    {type = 'input', label = 'Temps (minutes)', required = true},
                                    {type = 'input', label = 'Raison', required = true}
                                })
                                
                                if input then
                                    local time = tonumber(input[1])
                                    if not time then 
                                        ESX.ShowNotification("~r~Le temps doit être un nombre valide")
                                        return 
                                    end
                                    DebugPrint("Temps entré: " .. time)
                                    DebugPrint("Raison entrée: " .. input[2])
                                    TriggerServerEvent('detention:putInJail', player.serverId, time, input[2], prisonName)
                                end
                            end
                        })
                    end
                end
            end)

            RageUI.IsVisible(prisonersList, function()
                if not lastUpdate or GetGameTimer() - lastUpdate > 1000 then
                    ESX.TriggerServerCallback('detention:getPrisoners', function(prisonersList)
                        prisoners = prisonersList
                    end)
                    lastUpdate = GetGameTimer()
                end

                if not prisoners or next(prisoners) == nil then
                    RageUI.Separator("")
                    RageUI.Separator("~r~Aucun détenu actuellement")
                    RageUI.Separator("")
                else
                    for id, data in pairs(prisoners) do
                        if data and data.name and data.timeLeft then
                            RageUI.Button(
                                ("%s"):format(data.name),
                                ("Prison: %s - Temps: %d min"):format(data.prison or "N/A", data.timeLeft),
                                {RightLabel = "→"},
                                true,
                                {
                                    onActive = function()
                                        if data then
                                            RageUI.Info(
                                                "Informations détention",
                                                {'Nom', 'Temps restant', 'Raison', 'Prison'},
                                                {
                                                    data.name,
                                                    ('%s minutes'):format(data.timeLeft or 0),
                                                    data.reason or "Non spécifiée",
                                                    data.prison or "Non spécifiée"
                                                }
                                            )
                                        end
                                    end,
                                    onSelected = function()
                                        selectedPrisoner = {id = id, data = data}
                                    end
                                }, prisonerInfo)
                        end
                    end
                end
            end)

            RageUI.IsVisible(prisonerInfo, function()
                if selectedPrisoner then
                    RageUI.Separator(("↓ %s ↓"):format(selectedPrisoner.data.name))
                    RageUI.Separator(("Temps restant: %d minutes"):format(selectedPrisoner.data.timeLeft))
                    RageUI.Separator(("Raison: %s"):format(selectedPrisoner.data.reason))
                    RageUI.Line()
                    RageUI.Button("Libérer le détenu", nil, {Color = {BackgroundColor = {0,255,0,50}}}, true, {
                        onSelected = function()
                            TriggerServerEvent('detention:releasePlayer', selectedPrisoner.id)
                            RageUI.GoBack()
                        end
                    })
                end
            end)

            if not RageUI.Visible(main) and not RageUI.Visible(playerList) and not RageUI.Visible(prisonersList) and not RageUI.Visible(prisonerInfo) then
                main = RMenu:DeleteType('main')
                FreezeEntityPosition(PlayerPedId(), false)
                break
            end
        end
    end)
end

if DEBUG then
    RegisterCommand('debugmenu', function()
        OpenDetentionMenu('Debug')
    end)
end

RegisterNetEvent('detention:jailPlayer')
AddEventHandler('detention:jailPlayer', function(time, prisonName, reason)
    DebugPrint("Réception event detention:jailPlayer")
    DebugPrint("Temps: " .. tostring(time))
    DebugPrint("Prison: " .. tostring(prisonName))
    DebugPrint("Raison: " .. tostring(reason))
    
    if not time or not prisonName or not Config.Detention.Prisons[prisonName] then
        DebugPrint("Paramètres invalides pour detention:jailPlayer")
        return
    end
    
    isInJail = true
    remainingTime = tonumber(time) * 60
    currentPrison = prisonName
    currentReason = reason
    
    local prison = Config.Detention.Prisons[prisonName]
    if not prison then
        DebugPrint("Prison non trouvée: " .. prisonName)
        return
    end
    
    local randomCell = prison.Cells[math.random(#prison.Cells)]
    if not randomCell then
        DebugPrint("Aucune cellule disponible")
        return
    end
    
    SetEntityCoords(PlayerPedId(), randomCell.x, randomCell.y, randomCell.z)
    SetEntityHeading(PlayerPedId(), randomCell.w)
    
    TriggerServerEvent('detention:addToJail', GetPlayerServerId(PlayerId()), time, reason, prisonName)
    
    CreateThread(function()
        while isInJail do
            Wait(5000)
            if remainingTime > 0 then
                remainingTime = remainingTime - 5
                
                exports['core-ui']:drawInfo('Informations Détention', {
                    {title = 'Temps Restant', subtitle = ('%s minutes'):format(math.ceil(remainingTime/60))},
                    {title = 'Raison', subtitle = reason or 'Non spécifiée'}
                })

                local playerPos = GetEntityCoords(PlayerPedId())
                local dist = #(playerPos - randomCell.xyz)
                
                if dist > 15.0 then
                    SetEntityCoords(PlayerPedId(), randomCell.xyz)
                    SetEntityHeading(PlayerPedId(), randomCell.w)
                    ESX.ShowNotification("Vous avez été replacé dans votre cellule")
                end
            else
                if isInJail then
                    TriggerServerEvent('detention:releasePlayer', GetPlayerServerId(PlayerId()))
                    SetEntityCoords(PlayerPedId(), releasePoint.x, releasePoint.y, releasePoint.z)
                    SetEntityHeading(PlayerPedId(), releasePoint.w)
                end
                break
            end
        end
    end)
end)

RegisterNetEvent('detention:releasePlayer')
AddEventHandler('detention:releasePlayer', function()
    local playerPos = GetEntityCoords(PlayerPedId())
    local closestDist = 999999
    local closestPoint = nil
    
    for _, prison in pairs(Config.Detention.Prisons) do
        local dist = #(playerPos - prison.PedPosition.xyz)
        if dist < closestDist then
            closestDist = dist
            closestPoint = prison.PedPosition
        end
    end
    
    if closestPoint then
        SetEntityCoords(PlayerPedId(), closestPoint.x, closestPoint.y, closestPoint.z)
        SetEntityHeading(PlayerPedId(), closestPoint.w)
    end
    
    isInJail = false
    remainingTime = 0
    currentPrison = nil
    exports['core-ui']:hideInfo()
    ESX.ShowNotification('Vous avez été libéré')
end)

if DEBUG then
    local function GetNearestPrison()
        local playerPos = GetEntityCoords(PlayerPedId())
        local nearestDist = 999999
        local nearestPrison = nil

        for prisonName, prison in pairs(Config.Detention.Prisons) do
            local dist = #(playerPos - prison.PedPosition.xyz)
            if dist < nearestDist then
                nearestDist = dist
                nearestPrison = prisonName
            end
        end

        return nearestPrison
    end

    RegisterCommand('debugjail', function(source, args)
        if not args[1] or not args[2] then
            return DebugPrint("Usage: /debugjail <minutes> <raison>")
        end
        
        local time = tonumber(args[1])
        table.remove(args, 1)
        local reason = table.concat(args, " ")
        local nearestPrison = GetNearestPrison()
        
        if nearestPrison then
            DebugPrint(("Test détention: %d minutes à %s (raison: %s)"):format(time, nearestPrison, reason))
            TriggerEvent('detention:jailPlayer', time, nearestPrison, reason)
        else
            DebugPrint("Aucune prison trouvée")
        end
    end)

    RegisterCommand('debugfree', function()
        if isInJail then
            DebugPrint("Libération forcée de prison")
            TriggerEvent('detention:releasePlayer')
        else
            DebugPrint("Vous n'êtes pas en prison")
        end
    end)

    RegisterCommand('debugtp', function(source, args)
        if not args[1] then
            return DebugPrint("Usage: /debugtp <prison name>")
        end

        local prisonName = args[1]
        if not Config.Detention.Prisons[prisonName] then
            return DebugPrint("Prison invalide. Prisons disponibles:", json.encode(Config.Detention.Prisons))
        end

        local pos = Config.Detention.Prisons[prisonName].PedPosition
        SetEntityCoords(PlayerPedId(), pos.x, pos.y, pos.z)
        SetEntityHeading(PlayerPedId(), pos.w)
        DebugPrint(("Téléporté à la prison %s"):format(prisonName))
    end)
end
