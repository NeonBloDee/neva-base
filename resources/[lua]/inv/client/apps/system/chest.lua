-- local creatingChest = false
-- local currentChestPosition = nil

-- RegisterCommand('coffre', function()
--     creatingChest = true
--     local mainMenu = lgdUI.CreateMenu("Création de Coffre", "Configurer un coffre")

--     lgdUI.Visible(mainMenu, not lgdUI.Visible(mainMenu))

--     CreateThread(function()
--         while creatingChest do
--             Wait(1)
--             local playerPed = PlayerPedId()
--             local playerCoords = GetEntityCoords(playerPed)

--             DrawMarker(1, playerCoords.x, playerCoords.y, playerCoords.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 255, 0, 150, false, false, 2, nil, nil, false)
--             currentChestPosition = playerCoords

--             lgdUI.IsVisible(mainMenu, function()
--                 lgdUI.Button("Définir la position actuelle", nil, {}, true, {
--                     onSelected = function()
--                         ESX.ShowNotification("Position définie.")
--                     end
--                 })

--                 lgdUI.Button("Nom du coffre", nil, {}, true, {
--                     onSelected = function()
--                         local result = KeyboardInput("Nom du coffre", "", 20)
--                         if result then
--                             currentChestLabel = result
--                         end
--                     end
--                 })

--                 lgdUI.Button("Job (Accès)", nil, {}, true, {
--                     onSelected = function()
--                         local result = KeyboardInput("Nom du job", "", 20)
--                         if result then
--                             currentChestJob = result
--                         end
--                     end
--                 })

--                 lgdUI.Button("Capacité (kg)", nil, {}, true, {
--                     onSelected = function()
--                         local result = KeyboardInput("Capacité", "", 4)
--                         if result then
--                             currentChestCapacity = tonumber(result)
--                         end
--                     end
--                 })

--                 lgdUI.Button("~g~Créer le coffre", nil, {}, true, {
--                     onSelected = function()
--                         if currentChestPosition and currentChestLabel and currentChestCapacity then
--                             TriggerServerEvent("chest:create", {
--                                 label = currentChestLabel,
--                                 job = currentChestJob,
--                                 kg = currentChestCapacity,
--                                 position = currentChestPosition
--                             })
--                             ESX.ShowNotification("Coffre créé.")
--                             lgdUI.CloseAll()
--                             creatingChest = false
--                         else
--                             ESX.ShowNotification("Remplissez tous les champs.")
--                         end
--                     end
--                 })
--             end)
--         end
--     end)
-- end)

-- RegisterNetEvent("lgd_inv:OpenChest")
-- AddEventHandler("lgd_inv:OpenChest", function(data)
--     -- Simulation de l'ouverture d'un inventaire
--     -- Vous pouvez intégrer un NUI si nécessaire ou appeler une fonction existante
--     local chestItems = data.items or {}
--     local maxWeight = data.maxWeight or 100

--     -- Simule l'ouverture d'un inventaire avec une liste d'objets
--     print("Ouverture du coffre : " .. data.plate)
--     print("Poids maximum autorisé : " .. maxWeight .. " kg")

--     -- Ajoutez ici une logique pour interagir avec NUI si vous avez une interface utilisateur
--     TriggerEvent("inventory:openChest", chestItems, maxWeight, data.plate)
-- end)

-- RegisterNetEvent("lgd_inv:OpenChest")
-- AddEventHandler("lgd_inv:OpenChest", function(data)
--     -- Récupération des données envoyées par le serveur
--     local chestItems = data.items or {}
--     local maxWeight = data.maxWeight or 100
--     local currentWeight = data.currentWeight or 0
--     local chestPlate = data.plate

--     -- Verrouillage du joueur et configuration du NUI
--     DisplayRadar(false)
--     SetNuiFocus(true, true)
--     FreezeEntityPosition(PlayerPedId(), true)

--     -- Envoi des données au NUI
--     SendNUIMessage({
--         action = "open:Inv",
--         type = "trunk", -- Assurez-vous d'utiliser "trunk" pour les fonctionnalités déjà présentes
--         itemTrunk = chestItems,
--         maxWeightTrunk = maxWeight,
--         currentWeightTrunk = currentWeight,
--         plate = chestPlate
--     })

--     -- Ajout d'effets visuels
--     SetTimecycleModifier("Bloom")
--     SetTimecycleModifierStrength(1.50)
--     TriggerScreenblurFadeIn(0)

--     ESX.ShowNotification(("Coffre ouvert [%s] - Capacité : %d/%d kg"):format(chestPlate, currentWeight, maxWeight))
-- end)

-- RegisterNUICallback("CloseChest", function()
--     -- Réinitialisation après la fermeture
--     DisplayRadar(true)
--     SetNuiFocus(false, false)
--     FreezeEntityPosition(PlayerPedId(), false)
--     ClearTimecycleModifier()
--     TriggerScreenblurFadeOut(0)

--     -- Notifier le serveur pour sauvegarder les données si nécessaire
--     SendNUIMessage({ action = "close:Inv" })
-- end)

-- -- Gestion des interactions avec les items du coffre
-- RegisterNUICallback("ChestAction", function(data, cb)
--     local action = data.action
--     local item = data.item
--     local count = data.count
--     local chestPlate = data.plate

--     -- Actions possibles : dépôt et retrait
--     if action == "deposit" then
--         TriggerServerEvent("lgd_inv:DepositToChest", chestPlate, item, count)
--     elseif action == "withdraw" then
--         TriggerServerEvent("lgd_inv:WithdrawFromChest", chestPlate, item, count)
--     end

--     Wait(150)
--     cb("ok")
-- end)




-- CreateThread(function()
--   while true do
--       Wait(0)
--       local playerPed = PlayerPedId()
--       local playerCoords = GetEntityCoords(playerPed)

--       for _, chest in pairs(Config.Chests) do
--           local dist = #(playerCoords - vector3(chest.position.x, chest.position.y, chest.position.z))
--           if dist < 15.0 then
--               DrawMarker(25, chest.position.x, chest.position.y, chest.position.z - 0.98, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 0, 255, 0, 100, false, false, 2, false, nil, nil, false)
--               if dist < 1.0 then
--                   ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au coffre")
--                   if IsControlJustPressed(0, 38) then
--                       TriggerServerEvent("chest:open", chest.id)
--                   end
--               end
--           end
--       end
--   end
-- end)


-- function KeyboardInput(text, inputText, maxLength)
--     AddTextEntry("FMMC_KEY_TIP1", text)
--     DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)
--     while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
--         Wait(0)
--     end
--     if UpdateOnscreenKeyboard() ~= 2 then
--         return GetOnscreenKeyboardResult()
--     else
--         return nil
--     end
-- end

-- RegisterNetEvent("chest:refresh")
-- AddEventHandler("chest:refresh", function(chests)
--     Config.Chests = chests
-- end)
