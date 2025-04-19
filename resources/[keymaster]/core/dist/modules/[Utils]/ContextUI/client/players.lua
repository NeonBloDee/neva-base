local enterprisePermissions = {}
local organisationPermissions = {}

local enterpriseData = {
    recruit = {
        job = nil,
        created = {}
    },
    promote = {
        job = nil,
        created = {}
    }
}

local organisationData = {
    recruit = {
        job = nil,
        created = {}
    },
    promote = {
        job = nil,
        created = {}
    }
}



Citizen.CreateThread(function ()
    while GetResourceState("ox_target") ~= "started" do Citizen.Wait(0) end

    exports.ox_target:addGlobalPlayer({

        -- {
        --     label = "Copier l'animation",
        --     icon = "fa-solid fa-clone",
        --     canInteract = function(data)
        --         -- Le bouton est toujours visible
        --         return true
        --     end,
        --     onSelect = function(data)
        --         local playerPed = PlayerPedId()
        --         local targetPed = GetPlayerPedNearby(playerPed)
        
        --         if not DoesEntityExist(targetPed) then
        --             ESX.ShowNotification("Erreur : aucune entité cible détectée.")
        --             return
        --         end
        
        --         -- Récupère l'animation en cours (dictionnaire et nom)
        --         local animDict, animName = ObserveAnimation(targetPed)
        
        --         if animDict and animName then
        --             -- Joue directement l'animation récupérée
        --             exports['sunny_emotemenu']:playEmote({
        --                 Dictionary = animDict,
        --                 Animation = animName,
        --             })
        --             ESX.ShowNotification(("Animation copiée : ~b~%s~s~ du dictionnaire ~g~%s~s~."):format(animName, animDict))
        --         else
        --             ESX.ShowNotification("Aucune animation détectée sur le joueur cible.")
        --         end
        --     end
        -- },
        
                       

        {
            label = "ID du joueur",
            icon = "fa-solid fa-id-card-clip",
            canInteract = function ()
                return true
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("sunny:getTargetId", function (ID)
                    ESX.ShowNotification(("ID du joueur: %s"):format(ID))
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        }, 
        
        {
            label = "Pile ou face",
            icon = "fa-solid fa-coins",
            canInteract = function ()
                return true
            end,
            onSelect = function (data)
                ExecuteCommand(SunnyConfigServ.PileOuFace.Command)
            end
        },
        {
            label = "Porter",
            icon = "fas fa-hand-holding",
            canInteract = function ()
                return true
            end,
            onSelect = function (data)
                ExecuteCommand("porter")
            end
        },
        {
            label = "Actions Admin",
            icon = "fa-solid fa-lock",
            distance = 5.0,
            canInteract = function ()
                return adminManagement.Service
            end,
            openMenu = "admin-option"
        }, 
        {
            menuName = "admin-option",
            label = "Freeze/Unfreeze le joueur",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
                return adminManagement.Service
            end,
            onSelect = function (data)
                -- Récupère l'ID via ESX.TriggerServerCallback
                ESX.TriggerServerCallback("sunny:getTargetId", function (ID)
                    if ID then
                        -- Vérifie si le joueur est actuellement freeze ou pas
                        if adminManagement.FreezeUnfreeze then
                            adminManagement.FreezeUnfreeze = false
                            TriggerServerEvent('sunny:admin:freezeunfreezeplayer', ID, 'unfreeze')
                            ESX.ShowNotification('✅ Joueur unfreeze avec succès')
                        else
                            adminManagement.FreezeUnfreeze = true
                            TriggerServerEvent('sunny:admin:freezeunfreezeplayer', ID, 'freeze')
                            ESX.ShowNotification('✅ Joueur freeze avec succès')
                        end
                    else
                        ESX.ShowNotification("Erreur : Impossible de récupérer l'ID du joueur.")
                    end
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },

        


        
        {
            menuName = "admin-option",
            label = "Téléporter sur moi",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
                return adminManagement.Service
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("sunny:getTargetId", function (ID)
                    if ID then
                        ExecuteCommand('tp '..ID)
                        TriggerServerEvent('sunny:admin:getPosForRreturnPlayer', ID)
                    else
                        ESX.ShowNotification("Erreur : Impossible de récupérer l'ID du joueur.")
                    end
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Retourner pos",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
                return adminManagement.Service
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("sunny:getTargetId", function (ID)
                    if ID then
                        TriggerServerEvent('sunny:admin:xPlayer.return', ID, adminManagement.LastPlayerPos[ID].pos)
                    else
                        ESX.ShowNotification("Erreur : Impossible de récupérer l'ID du joueur.")
                    end
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Téléporter PC",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
                return adminManagement.Service
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("sunny:getTargetId", function (ID)
                    if ID then
                        -- Exécute la commande tppc avec l'ID du joueur
                        ExecuteCommand("tppc " .. ID)
                    else
                        ESX.ShowNotification("Erreur : Impossible de récupérer l'ID du joueur.")
                    end
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },        
        {
            menuName = "admin-option",
            label = "Envoyer un message",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
                return adminManagement.Service
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("sunny:getTargetId", function (ID)
                    if ID then
                        KeyboardUtils.use('Message', function(data)
                            if data == nil or data == '' then
                                return ESX.ShowNotification('Argument manquant')
                            end
                            TriggerServerEvent('sunny:staff:players:takeMessage', ID, data)
                        end)
                    else
                        ESX.ShowNotification("Erreur : Impossible de récupérer l'ID du joueur.")
                    end
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Revive le joueur",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
                return adminManagement.Service
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("sunny:getTargetId", function (ID)
                    if ID then
                        ExecuteCommand("revive " ..ID)
                    else
                        ESX.ShowNotification("Erreur : Impossible de récupérer l'ID du joueur.")
                    end
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Heal le joueur",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
                return adminManagement.Service
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("sunny:getTargetId", function (ID)
                    if ID then
                        ExecuteCommand("heal " ..ID)
                    else
                        ESX.ShowNotification("Erreur : Impossible de récupérer l'ID du joueur.")
                    end
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Screen le joueur",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
                return adminManagement.Service
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("sunny:getTargetId", function (ID)
                    if ID then
                        TriggerServerEvent('sunny:admin:screen', ID)
                        ESX.ShowNotification('📷 Vous retrouverez le screen dans les logs')
                    else
                        ESX.ShowNotification("Erreur : Impossible de récupérer l'ID du joueur.")
                    end
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Donner Panto",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
                return adminManagement.Service
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("sunny:getTargetId", function (ID)
                    if ID then
                        TriggerServerEvent('sunny:admin:spawnVehicle', ID, 'panto')
                    else
                        ESX.ShowNotification("Erreur : Impossible de récupérer l'ID du joueur.")
                    end
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            label = "Gestion Entreprise",
            icon = "fas fa-building",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job == nil then
                    return false
                end

                if ESX.PlayerData.job.name == "unemployed" then
                    return false
                end

                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end

             --   if ESX.Table.Contains(enterprisePermissions, "addEmployer") or ESX.Table.Contains(enterprisePermissions, "removeEmployer") then
             --       return true
            --    end

                return false
            end,
            openMenu = "gestion-enterprise"
        }, {
            menuName = "gestion-enterprise",
            label = "Recruter",
            icon = "fas fa-user-tie",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end

               -- if ESX.Table.Contains(enterprisePermissions, "addEmployer") then
            --        return true
           --     end

                return false
            end,
            onSelect = function (data)
                TriggerServerEvent("boss:Boss_recruterplayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        }, {
            menuName = "gestion-enterprise",
            label = "Virer",
            icon = "fas fa-ban",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end

             --   if ESX.Table.Contains(enterprisePermissions, "removeEmployer") then
            --        return true
             --   end

                return false
            end,
            onSelect = function (data)
                TriggerServerEvent("sunny:entreprise:Boss_virerplayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        }, {
            menuName = "gestion-enterprise",
            label = "Promouvoir",
            icon = "fas fa-arrow-up",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end

              --  if ESX.Table.Contains(enterprisePermissions, "addEmployer") then
              --      return true
              --  end

                return false
            end,
        onSelect = function (data)
        TriggerServerEvent('boss:Boss_promouvoirplayer', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        end
        },
    {
            menuName = "gestion-enterprise",
            label = "Destituer",
            icon = "fas fa-user-cog",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end

             --   if ESX.Table.Contains(enterprisePermissions, "addEmployer") then
             --       return true
             --   end

                return false
            end,
        onSelect = function (data)
        TriggerServerEvent('boss:Boss_destituerplayer', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        end
        },
    {
            label = "Gestion Organisation",
            icon = "fas fa-arrow-down",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job2 == nil then
                    return false
                end

                if ESX.PlayerData.job2.name == "unemployed" then
                    return false
                end

                if ESX.PlayerData.job2.grade_name == "boss" then
                    return true
                end

              --  if ESX.Table.Contains(organisationPermissions, "addEmployer") or ESX.Table.Contains(organisationPermissions, "removeEmployer") then
              --      return true
              --  end

                return false
            end,
            openMenu = "gestion-organisation"
        }, {
            menuName = "gestion-organisation",
            label = "Recruter",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job2.grade_name == "boss" then
                    return true
                end

               -- if ESX.Table.Contains(organisationPermissions, "addEmployer") then
               --     return true
               -- end

                return false
            end,
            onSelect = function (data)
                TriggerServerEvent('boss:Boss_recruterplayer2', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        }, {
            menuName = "gestion-organisation",
            label = "Virer",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job2.grade_name == "boss" then
                    return true
                end

               -- if ESX.Table.Contains(organisationPermissions, "removeEmployer") then
               --     return true
               -- end

                return false
            end,
            onSelect = function (data)
                TriggerServerEvent("boss:Boss_virerplayer2", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        }, {
            menuName = "gestion-organisation",
            label = "Promouvoir",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job2.grade_name == "boss" then
                    return true
                end

               -- if ESX.Table.Contains(organisationPermissions, "addEmployer") then
                --    return true
               -- end

                return false
            end,
        onSelect = function (data)
        TriggerServerEvent('boss:Boss_promouvoirplayer2', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        end
        },
    {
            menuName = "gestion-organisation",
            label = "Destituer",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job2.grade_name == "boss" then
                    return true
                end

               -- if ESX.Table.Contains(organisationPermissions, "addEmployer") then
                --    return true
                --end

                return false
            end,
        onSelect = function (data)
        TriggerServerEvent('boss:Boss_destituerplayer2', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        end
        }
    })
end)