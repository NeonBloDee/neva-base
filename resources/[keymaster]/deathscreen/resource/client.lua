ESX = nil

local isRagdoll = false
local ragdollThread = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    
    SendNUIMessage({
        type = "update:config",
        config = Config,
        configUI = ConfigUI
    })
    
    SendNUIMessage({
        type = "update:timer",
        time = Config.DefaultRespawnTime / 60
    })
end)

local DeathScreen = {}

DeathScreen.Opened = false

function SetPlayerRagdoll(state)
    local ped = PlayerPedId()
    
    if state then
        isRagdoll = true
        
        if ragdollThread ~= nil then
            return
        end
        
        ragdollThread = Citizen.CreateThread(function()
            while isRagdoll do
                SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
                ResetPedRagdollTimer(ped)
                Citizen.Wait(500)
            end
            ragdollThread = nil
        end)
    else
        isRagdoll = false
        local ped = PlayerPedId()
        if IsPedRagdoll(ped) then
            ClearPedTasks(ped)
            SetPedCanRagdoll(ped, false)
            Citizen.Wait(100)
            SetPedCanRagdoll(ped, true)
        end
    end
end

function DeathScreen:Open()
    if self.Opened then return end

    self.Opened = true
    menumortisopen = true
    
    exports['hud']:ToggleVisible(false)
    DisplayRadar(false)
    
    SetNuiFocus(true, true)
    
    SetPlayerRagdoll(true)
    
    SendNUIMessage({
        type = "deathscreen:open",
    })

    if Config.HideRadar then
        DisplayRadar(false)
    end
    
    print("[DeathScreen] Opening death screen")
end

function DeathScreen:Close()
    if not self.Opened then return end

    self.Opened = false
    menumortisopen = false
    
    exports['hud']:ToggleVisible(true)
    DisplayRadar(true)
    
    SetNuiFocus(false, false)
    
    SetPlayerRagdoll(false)

    SendNUIMessage({
        type = "deathscreen:close",
    })

    if Config.HideRadar then
        DisplayRadar(true)
    end
    
    print("[DeathScreen] Closing death screen")
end

function DeathScreen:medicUnitShow()
    SendNUIMessage({
        type = "medicUnit:show",
    })
end

function DeathScreen:medicUnitHide()
    SendNUIMessage({
        type = "medicUnit:hide",
    })
end

RegisterNetEvent("deathscreen:notifyEMS")
AddEventHandler("deathscreen:notifyEMS", function()
    SendNUIMessage({
        type = "notified",
    })
end)

RegisterNetEvent("deathscreen:open")
AddEventHandler("deathscreen:open", function()
    DeathScreen:Open()
    
    Citizen.SetTimeout(500, function()
        if not DeathScreen.Opened then
            print("[DeathScreen] Retrying open")
            DeathScreen:Open()
        end
    end)
end)

RegisterNetEvent("deathscreen:close")
AddEventHandler("deathscreen:close", function()
    DeathScreen:Close()
end)

RegisterNetEvent("deathscreen:medicUnitShow")
AddEventHandler("deathscreen:medicUnitShow", function()
    DeathScreen:medicUnitShow()
end)

RegisterNetEvent("deathscreen:medicUnitHide")
AddEventHandler("deathscreen:medicUnitHide", function()
    DeathScreen:medicUnitHide()
end)

RegisterNUICallback("deathscreen:end", function() 
    DeathScreen:Close()
end)

RegisterNUICallback("deathscreen:call", function() 
    TriggerServerEvent('sunny:ambulance:call', GetEntityCoords(PlayerPedId()))
end)

RegisterNUICallback("deathscreen:respawn", function() 
    TriggerEvent("sunny:ambulance:resetFlags")
    TriggerServerEvent('sunny:ambulance:respawn')
    DeathScreen:Close()
end)

RegisterCommand('kill', function(source, args, rawCommand)
    if not Config.AllowKillCommand then return end
    
    ESX.TriggerServerCallback('deathscreen:checkPermission', function(hasPermission)
        if hasPermission then
            SetEntityHealth(PlayerPedId(), 0)
        else
            TriggerEvent('chat:addMessage', {
                color = {255, 0, 0},
                multiline = true,
                args = {"System", "You don't have permission to use this command."}
            })
        end
    end)
end, false)

RegisterNetEvent("death:info")
AddEventHandler("death:info", function(reason, killerId)
    SendNUIMessage({
        type = "death:info",
        reason = reason,
        killerId = killerId
    })
end)

RegisterNUICallback("deathscreen:report", function(data) 
    if not Config.Report.Enabled then return end
    
    local reportMessage = "Freekill (Report EMS Auto)"
    
    if data and data.message then
        reportMessage = data.message
    end
    
    ExecuteCommand(Config.Report.Command .. ' ' .. reportMessage)
end)

RegisterNetEvent("sunny:ambulance:resetFlags")
AddEventHandler("sunny:ambulance:resetFlags", function()
    TriggerServerEvent("sunny:ambulance:resetFlagsSv")
    
    JeSuiSMort = false
    if SetEntityRagdoll ~= nil then SetEntityRagdoll = false end
    
    SetPlayerRagdoll(false)
    
    local ped = PlayerPedId()
    ClearPedTasks(ped)
    SetPedCanRagdoll(ped, false)
    Wait(100)
    SetPedCanRagdoll(ped, true)
    
    TaskPlayAnim(ped, "get_up@directional@movement@from_knees@standard", "getup_r_0", 8.0, -8.0, -1, 0, 0, false, false, false)
end)

AddEventHandler('esx:onPlayerDeath', function(data)
    SetPlayerRagdoll(true)
end)

Citizen.CreateThread(function()
    RequestAnimDict("get_up@directional@movement@from_knees@standard")
    while not HasAnimDictLoaded("get_up@directional@movement@from_knees@standard") do
        Citizen.Wait(100)
    end
end)