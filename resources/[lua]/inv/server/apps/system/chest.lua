-- local Chests = {}

-- MySQL.ready(function()
--     MySQL.Async.fetchAll("SELECT * FROM sunny_chest", {}, function(result)
--         for _, chest in ipairs(result) do
--             chest.position = json.decode(chest.position)
--             table.insert(Chests, chest)
--         end
--     end)
-- end)

-- RegisterServerEvent("chest:create")
-- AddEventHandler("chest:create", function(data)
--     local src = source
--     local xPlayer = ESX.GetPlayerFromId(src)

--     MySQL.Async.execute("INSERT INTO sunny_chest (label, job, kg, position) VALUES (@label, @job, @kg, @position)", {
--         ['@label'] = data.label,
--         ['@job'] = data.job or nil,
--         ['@kg'] = data.kg,
--         ['@position'] = json.encode(data.position)
--     }, function(id)
--         table.insert(Chests, {
--             id = id,
--             label = data.label,
--             job = data.job,
--             kg = data.kg,
--             position = data.position
--         })
--         TriggerClientEvent("chest:refresh", -1, Chests)
--     end)
-- end)

-- RegisterServerEvent("chest:open")
-- AddEventHandler("chest:open", function(chestId)
--     local src = source
--     local xPlayer = ESX.GetPlayerFromId(src)

--     -- Recherche des données du coffre
--     for _, chest in ipairs(Chests) do
--         if chest.id == chestId then
--             if not chest.job or chest.job == xPlayer.getJob().name then
--                 local chestData = {
--                     plate = "chest_" .. chestId,
--                     maxWeight = chest.kg,
--                     currentWeight = chest.currentWeight or 0,
--                     items = chest.items or {}
--                 }
--                 -- Envoi au client
--                 TriggerClientEvent("lgd_inv:OpenChest", src, chestData)
--             else
--                 xPlayer.showNotification("Vous n'avez pas accès à ce coffre.")
--             end
--             break
--         end
--     end
-- end)


-- RegisterServerEvent("lgd_inv:DepositToChest")
-- AddEventHandler("lgd_inv:DepositToChest", function(chestPlate, item, count)
--     local src = source
--     local xPlayer = ESX.GetPlayerFromId(src)

--     for _, chest in ipairs(Chests) do
--         if chest.plate == chestPlate then
--             if chest.currentWeight + (item.weight * count) <= chest.maxWeight then
--                 chest.items[item.name] = chest.items[item.name] or { label = item.label, count = 0 }
--                 chest.items[item.name].count = chest.items[item.name].count + count
--                 chest.currentWeight = chest.currentWeight + (item.weight * count)

--                 xPlayer.removeInventoryItem(item.name, count)
--                 xPlayer.showNotification(("Vous avez déposé %d %s dans le coffre."):format(count, item.label))
--             else
--                 xPlayer.showNotification("Le coffre est plein.")
--             end
--             break
--         end
--     end
-- end)

-- RegisterServerEvent("lgd_inv:WithdrawFromChest")
-- AddEventHandler("lgd_inv:WithdrawFromChest", function(chestPlate, item, count)
--     local src = source
--     local xPlayer = ESX.GetPlayerFromId(src)

--     for _, chest in ipairs(Chests) do
--         if chest.plate == chestPlate then
--             if chest.items[item.name] and chest.items[item.name].count >= count then
--                 chest.items[item.name].count = chest.items[item.name].count - count
--                 if chest.items[item.name].count <= 0 then
--                     chest.items[item.name] = nil
--                 end

--                 chest.currentWeight = chest.currentWeight - (item.weight * count)
--                 xPlayer.addInventoryItem(item.name, count)
--                 xPlayer.showNotification(("Vous avez retiré %d %s du coffre."):format(count, item.label))
--             else
--                 xPlayer.showNotification("Quantité invalide.")
--             end
--             break
--         end
--     end
-- end)
