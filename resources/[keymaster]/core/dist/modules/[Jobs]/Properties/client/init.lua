Properties = {
  PropertiesList = {},
  Load = false,
  WaitNearby = 2000,
  Lastplayerpos = nil,
  Lastplayerpos2 = nil,
  garageSelected = nil,
  isIn = {},
  propertiesIDIN = {},
  
  job = {
    Service = false,
    PropertiesListIndex = 1,
    PropertiesListIndexData = {'Gestion', 'Disoudre le logement', 'Supprimer la propriété', 'Modifier la propriété'},
    PropertiesListIndexPaid = 1,
    PropertiesListIndexDataPaid = {'Cash', 'Banque'},
    SelectedProperties = {}
  },

  garage = {
    interior = {},
    self_vehicle = {},
    self_garage = {},
    isIn = false
  },

  updateBlips = function(self)
    if not self.PropertiesList then return end
    
    for _, blip in pairs(self.blips or {}) do
      RemoveBlip(blip)
    end
    
    self.blips = {}
    
    for _, property in pairs(self.PropertiesList) do
      local blip = AddBlipForCoord(property.enter.x, property.enter.y, property.enter.z)
      SetBlipSprite(blip, 411)
      SetBlipDisplay(blip, 4)
      SetBlipScale(blip, 0.7)
      SetBlipColour(blip, 2)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Propriété")
      EndTextCommandSetBlipName(blip)
      table.insert(self.blips, blip)
    end
  end,

  addPlayer = function(self, source, pId)
    if not self.isIn[source] then
      self.isIn[source] = {}
    end
    
    if not self.propertiesIDIN[pId] then
      self.propertiesIDIN[pId] = {}
    end
    
    table.insert(self.isIn[source], pId)
    table.insert(self.propertiesIDIN[pId], source)
  end,

  removePlayer = function(self, source, pId)
    if self.isIn[source] then
      for i, v in ipairs(self.isIn[source]) do
        if v == pId then
          table.remove(self.isIn[source], i)
          break
        end
      end
    end
    
    if self.propertiesIDIN[pId] then
      for i, v in ipairs(self.propertiesIDIN[pId]) do
        if v == source then
          table.remove(self.propertiesIDIN[pId], i)
          break
        end
      end
    end
  end,

  getProperty = function(self, pId)
    for _, property in pairs(self.PropertiesList) do
      if property.id == pId then
        return property
      end
    end
    return nil
  end,

  isPlayerInProperty = function(self, source, pId)
    if not self.isIn[source] then return false end
    for _, v in ipairs(self.isIn[source]) do
      if v == pId then
        return true
      end
    end
    return false
  end,

  ReturnPropertiesData = function(self, propertiesId)
    if not self.PropertiesList then return {} end
    if not self.PropertiesList[propertiesId] then return {} end
    return self.PropertiesList[propertiesId]
  end,

  init = function(self)
    self.Load = true
    self:updateBlips()
  end,

  openMenu = function(self, propertyId)
    if not self.PropertiesList[propertyId] then return end
    
    local property = self.PropertiesList[propertyId]
    if not property.enter or not property.exit then return end

    -- Vérifier si le joueur a accès
    if property.owner == 'none' or property.open or property.owner == tostring(ESX.PlayerData.UniqueID) then
        -- Téléporter le joueur à l'intérieur
        self.PropertiesList[propertyId].players[tostring(ESX.PlayerData.UniqueID)] = true
        TriggerServerEvent('sunny:properties:addPlayer', nil, 'me', propertyId, self.PropertiesList[propertyId].players)
        ESX.ShowNotification('🏠 Vous venez d\'entrer dans la propriété')
    else
        ESX.ShowNotification('Cette propriété est fermée')
    end
  end,

  openExitMenu = function(self, k)
    if not self.PropertiesList[k] then return end
    
    local property = self.PropertiesList[k]
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    
    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    
    while main do 
        Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Separator(('Propriété %s'):format(k))

            if property.owner == tostring(ESX.PlayerData.UniqueID) then
                RageUI.Checkbox('Propriété Ouverte', nil, property.open, {}, {
                    onChecked = function()
                        property.open = true
                        TriggerServerEvent('sunny:properties:locked', k, property.open)
                    end,
                    onUnChecked = function()
                        property.open = false
                        TriggerServerEvent('sunny:properties:locked', k, property.open)
                    end
                })

                RageUI.Button('Faire sortir tout le monde', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        TriggerServerEvent('sunny:properties:removePlayer', nil, 'all', k, property.players)
                        ESX.ShowNotification('🏡 Tous les joueurs ont été expulsés')
                    end
                })
            end

            RageUI.Button('Sortir de la propriété', nil, {}, true, {
                onSelected = function()
                    RageUI.CloseAll()
                    TriggerServerEvent('sunny:properties:removePlayer', nil, 'me', k, property.players)
                    ESX.ShowNotification('🏡 Vous venez de sortir de la propriété')
                end
            })
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
            break
        end
    end
  end
}

RegisterNetEvent('Properties:Init')
AddEventHandler('Properties:Init', function(properties)
  Properties.PropertiesList = properties
  Properties:init()
end)
