PlayerLoadedAnticheat = false
local isPlayerFullyLoaded = false
local shouldBeDeadAfterLoad = false

local function openConnectMenu()

    while not ESXLoaded do Wait(1) end

    local playerPdata = ESX.GetPlayerData()

    local function playerAccount(account)
        for k, v in pairs(playerPdata.accounts) do
            if v.name == account then
                return v.money .. '$'
            end
        end
    end
    
    local sexx = {
        ['0'] = 'Homme',
        ['1'] = 'Femme'
    }
    
    FreezeEntityPosition(Player.playerPed, true)
    SetEntityVisible(Player.playerPed, false, 0)
    CameraConnect = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
    SetCamCoord(CameraConnect, 1600.397, -2432.388, 323.4131)
    SetCamRot(CameraConnect, 0.0, 0.0, 26.352119445801)
    SetCamFov(CameraConnect, 90.97)
    ShakeCam(CameraConnect, "HAND_SHAKE", 0.2)
    SetCamActive(CameraConnect, true)
    RenderScriptCams(true, false, 2000, true, true)
    DisplayRadar(false)
    exports['hud']:ToggleVisible(false)

    local menu = RageUI.CreateMenu('', ('Bienvenue sur %s'):format(SunnyConfigServ.ServerName))

    menu.Closable = false

    RageUI.Visible(menu, not RageUI.Visible(menu))
    SetEntityRagdoll = true
    while menu do Wait(1)
        RageUI.IsVisible(menu, function()
            RageUI.Button(('%s %s'):format(playerPdata.firstname, playerPdata.lastname), nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onActive = function()
                    RageUI.Info((SunnyConfigServ.GTACOLOR .. 'Bienvenue sur %s'):format(SunnyConfigServ.ServerName),
                     {
                        'Sexe',
                        'Naissance',
                        'Argent Propre',
                        'Argent Sale',
                        'Argent Banque',
                        'VIP'
                     },
                     {
                        sexx[playerPdata.sex] or 'Unedefined',
                        playerPdata.dateofbirth,
                        playerAccount('cash'),
                        playerAccount('black_money'),
                        playerAccount('bank'),
                        VIP.haveVip() and '✅' or '❌'
                     }
                    )
                end,
                onSelected = function()
                    RageUI.CloseAll()
                    
                    SwitchOutPlayer(PlayerPedId(), 0, 1)
                    exports.luacore:ShowClause()
                    while GetPlayerSwitchState() ~= 5 do
                        Citizen.Wait(0)
                    end
            
                    ShutdownLoadingScreen()
                    ShutdownLoadingScreenNui()
            
                    DoScreenFadeIn(2000)
                    while not IsScreenFadedIn() do
                        Citizen.Wait(0)
                    end
            
                    Citizen.Wait(6000)
            
                    SwitchInPlayer(PlayerPedId())
            
                    while GetPlayerSwitchState() ~= 12 do
                        Citizen.Wait(0)
                    end
            
                    DisplayRadar(true)
                    exports['hud']:ToggleVisible(true)
                    SetEntityVisible(Player.playerPed, true, 0)
                    FreezeEntityPosition(Player.playerPed, false)
                    SetPlayerInvincible(PlayerId(), false)

                    if not IsPedModel(Player.playerPed, GetEntityModel(Player.playerPed)) then
                        SetPlayerModel(PlayerId(), GetEntityModel(Player.playerPed))
                        SetModelAsNoLongerNeeded(GetEntityModel(Player.playerPed))
                    end

                    while GetPlayerSwitchState() ~= 12 do
                        Citizen.Wait(0)
                    end
                end
            })
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu')

            SetEntityRagdoll = false

            DoScreenFadeOut(1500)
            Wait(2000)
            RenderScriptCams(false, false, 0, true, true)
            Wait(1000)
            FreezeEntityPosition(Player.playerPed, false)
            SetEntityVisible(Player.playerPed, true, 0)
            DoScreenFadeIn(2000)

            ExecuteCommand(('walk %s'):format(getWalkStyle()))
            PlayerLoadedAnticheat = true
            playerLoaded = true
            
            -- On attend que tout soit bien chargé avant d'appliquer l'état mort si nécessaire
            Wait(1000)
            isPlayerFullyLoaded = true
            
            -- Vérification si le joueur doit être mort après le chargement complet
            if shouldBeDeadAfterLoad then
                TriggerEvent('sunny:ambulance:deathEvent')
                ESX.ShowNotification('Vous vous êtes déconnecté en étant mort !')
                shouldBeDeadAfterLoad = false
            end
        end
    end
end


AddEventHandler('esx:playerLoaded', function()
    CreateThread(function()
        -- Réinitialiser les variables à chaque connexion
        isPlayerFullyLoaded = false
        shouldBeDeadAfterLoad = false
        
        -- Vérifier si le joueur était mort à sa déconnexion
        ESX.TriggerServerCallback('sunny:ambulance:getPlayerDead', function(isDead)
            if isDead then
                shouldBeDeadAfterLoad = true
            end
        end)
        
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            if skin ~= nil then
                openConnectMenu()
                ExecuteCommand('debug')
                Wait(5000)
                playerLoaded = true
            end
        end)
    end)
end)

-- Supprimer l'appel à la vérification de la mort qui était ici auparavant

RegisterCommand('debug', function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
        TriggerEvent('esx:restoreLoadout')
    end)
end, false)

