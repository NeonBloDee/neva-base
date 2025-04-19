ESX = nil

local Weapons = {}
local AmmoTypes = {}

local PlayerData = nil
local AmmoInClip = {}

local CurrentWeapon = nil

local IsShooting = false
local AmmoBefore = 0

for name,item in pairs(Config.Weapons) do
  Weapons[GetHashKey(name)] = item
end

for name,item in pairs(Config.AmmoTypes) do
  AmmoTypes[GetHashKey(name)] = item
end

CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Wait(200)
  end

  PlayerData = ESX.GetPlayerData()
end)

function GetAmmoItemFromHash(hash)
  for name,item in pairs(Config.Weapons) do
    if hash == GetHashKey(item.name) then
      if item.ammo then
        return item.ammo
      else
        return nil
      end
    end
  end
  return nil
end

function GetInventoryItem(name)
  local inventory = PlayerData.inventory
  for i=1, #inventory, 1 do
    if inventory[i].name == name then
      return inventory[i]
    end
  end
  return nil
end

function RebuildLoadout()
  if not PlayerData then return end
  
  local playerPed = PlayerPedId()
  local loadout = {}

  for weaponHash, v in pairs(Weapons) do
    local item = GetInventoryItem(v.item)
    if item and item.count > 0 then
      loadout[weaponHash] = {
        ammo = 0,
        weapon = v
      }
      
      local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)
      if ammoType and AmmoTypes[ammoType] then
        local ammoItem = GetInventoryItem(AmmoTypes[ammoType].item)
        if ammoItem then
          loadout[weaponHash].ammo = ammoItem.count
        end
      end

      if item.name == "fireextinguisher" then
        loadout[weaponHash].ammo = 1000
      end
    end
  end

  for weaponHash, data in pairs(loadout) do
    if HasPedGotWeapon(playerPed, weaponHash, false) then
      if GetAmmoInPedWeapon(playerPed, weaponHash) ~= data.ammo then
        SetPedAmmo(playerPed, weaponHash, data.ammo)
      end
    else
      GiveWeaponToPed(playerPed, weaponHash, data.ammo, false, false)
    end
  end

  for weaponHash in pairs(Weapons) do
    if not loadout[weaponHash] and HasPedGotWeapon(playerPed, weaponHash, false) then
      SetPedAmmo(playerPed, weaponHash, 0)
    end
  end
end

exports("RebuildLoadout", RebuildLoadout)

function RemoveUsedAmmo()  
  local playerPed = PlayerPedId()
  local AmmoAfter = GetAmmoInPedWeapon(playerPed, CurrentWeapon)
  local ammoType = AmmoTypes[GetPedAmmoTypeFromWeapon(playerPed, CurrentWeapon)]
  
  if ammoType and ammoType.item then
    local ammoDiff = AmmoBefore - AmmoAfter
    if ammoDiff > 0 then
      TriggerServerEvent('esx:discardInventoryItem', ammoType.item, ammoDiff)
    end
  end

  return AmmoAfter
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  Wait(1)
  PlayerData = xPlayer
  RebuildLoadout()
end)

RegisterNetEvent('esx:modelChanged')
AddEventHandler('esx:modelChanged', function()
  Wait(1)
  RebuildLoadout()
end)

AddEventHandler('playerSpawned', function()
  Wait(1)
  RebuildLoadout()
end)

AddEventHandler('skinchanger:modelLoaded', function()
  RebuildLoadout()
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(name, count)
  Wait(1)
  PlayerData = ESX.GetPlayerData()
  RebuildLoadout()

  if CurrentWeapon then
    AmmoBefore = GetAmmoInPedWeapon(PlayerPedId(), CurrentWeapon)
  end
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(name, count)
  Wait(1)
  PlayerData = ESX.GetPlayerData()
  RebuildLoadout()
  if CurrentWeapon then
    AmmoBefore = GetAmmoInPedWeapon(PlayerPedId(), CurrentWeapon)
  end
end)

Citizen.CreateThread(function()
  local sleep = 200
  while true do
    Wait(sleep)
    
    local playerPed = PlayerPedId()
    local currentWeapon = GetSelectedPedWeapon(playerPed)

    if CurrentWeapon ~= currentWeapon then
      if IsShooting then
        RemoveUsedAmmo()
      end
      
      IsShooting = false
      CurrentWeapon = currentWeapon
      AmmoBefore = GetAmmoInPedWeapon(playerPed, CurrentWeapon)
      
      sleep = CurrentWeapon ~= GetHashKey('WEAPON_UNARMED') and 100 or 200
    end

    if CurrentWeapon ~= GetHashKey('WEAPON_UNARMED') then
      if IsPedShooting(playerPed) then
        if not IsShooting then
          IsShooting = true
          sleep = 50
        end
      elseif IsShooting and not IsControlPressed(0, 24) then
        IsShooting = false
        AmmoBefore = RemoveUsedAmmo()
        sleep = 100
      end
    end
  end
end)

RegisterNetEvent('weaponsync:Rebuild')
AddEventHandler('weaponsync:Rebuild', function()
  Wait(1)
  PlayerData = ESX.GetPlayerData()
  RebuildLoadout()
end)

RegisterNetEvent('kotonier:equipWeapon')
AddEventHandler('kotonier:equipWeapon', function(weaponName)
    local playerPed = PlayerPedId()
    local weaponHash = GetHashKey(string.upper(weaponName))
    
    if GetSelectedPedWeapon(playerPed) == weaponHash then
        RequestAnimDict("reaction@intimidation@1h")
        while not HasAnimDictLoaded("reaction@intimidation@1h") do 
            Wait(100)
        end
        
        TaskPlayAnim(playerPed, "reaction@intimidation@1h", "outro", 8.0, 1.0, -1, 48, 0, 0, 0, 0)
        Wait(1000)
        SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
        Wait(500)
        ClearPedTasks(playerPed)
    else
        RequestAnimDict("reaction@intimidation@1h")
        while not HasAnimDictLoaded("reaction@intimidation@1h") do 
            Wait(100)
        end
        
        TaskPlayAnim(playerPed, "reaction@intimidation@1h", "intro", 8.0, 1.0, -1, 48, 0, 0, 0, 0)
        Wait(1000)
        SetCurrentPedWeapon(playerPed, weaponHash, true)
        Wait(500)
        ClearPedTasks(playerPed)
        RebuildLoadout()
    end
    
    exports['inv']:closeInventory()
end)

