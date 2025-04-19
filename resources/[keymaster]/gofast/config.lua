Config = {}

Config.Framework = {
    Type = "esx",  -- Options: "esx", "qbcore", "standalone"
    ResourceName = "frwk", -- Resource name for your framework (e.g. "es_extended", "qb-core", etc.)
    
    Inventory = {
        Type = "default", -- Options: "default", "ox_inventory", "qb-inventory", "custom"
        AddItem = function(source, item, count, metadata)
            if Config.Framework.Type == "standalone" then return true end
            
            if Config.Framework.Type == "esx" then
                local xPlayer = exports[Config.Framework.ResourceName]:getSharedObject().GetPlayerFromId(source)
                return xPlayer.addInventoryItem(item, count, metadata or {})
            elseif Config.Framework.Type == "qbcore" then
                local Player = exports[Config.Framework.ResourceName]:GetPlayer(source)
                return Player.Functions.AddItem(item, count, nil, metadata or {})
            end
        end,
        
        RemoveItem = function(source, item, count, metadata)
            if Config.Framework.Type == "standalone" then return true end
            
            if Config.Framework.Type == "esx" then
                local xPlayer = exports[Config.Framework.ResourceName]:getSharedObject().GetPlayerFromId(source)
                return xPlayer.removeInventoryItem(item, count, metadata or {})
            elseif Config.Framework.Type == "qbcore" then
                local Player = exports[Config.Framework.ResourceName]:GetPlayer(source)
                return Player.Functions.RemoveItem(item, count, nil, metadata or {})
            end
        end,
        
        GetItem = function(source, item)
            if Config.Framework.Type == "standalone" then return {count = 1} end
            
            if Config.Framework.Type == "esx" then
                local xPlayer = exports[Config.Framework.ResourceName]:getSharedObject().GetPlayerFromId(source)
                return xPlayer.getInventoryItem(item)
            elseif Config.Framework.Type == "qbcore" then
                local Player = exports[Config.Framework.ResourceName]:GetPlayer(source)
                local item = Player.Functions.GetItemByName(item)
                return item or {count = 0}
            end
        end
    },

    Money = {
        Add = function(source, amount, account)
            if Config.Framework.Type == "standalone" then return true end
            
            if Config.Framework.Type == "esx" then
                local xPlayer = exports[Config.Framework.ResourceName]:getSharedObject().GetPlayerFromId(source)
                account = account or "money"
                xPlayer.addAccountMoney(account, amount)
                return true
            elseif Config.Framework.Type == "qbcore" then
                local Player = exports[Config.Framework.ResourceName]:GetPlayer(source)
                account = account or "cash"
                Player.Functions.AddMoney(account, amount)
                return true
            end
        end,

        Remove = function(source, amount, account)
            if Config.Framework.Type == "standalone" then return true end
            
            if Config.Framework.Type == "esx" then
                local xPlayer = exports[Config.Framework.ResourceName]:getSharedObject().GetPlayerFromId(source)
                account = account or "money"
                if xPlayer.getAccount(account).money >= amount then
                    xPlayer.removeAccountMoney(account, amount)
                    return true
                end
                return false
            elseif Config.Framework.Type == "qbcore" then
                local Player = exports[Config.Framework.ResourceName]:GetPlayer(source)
                account = account or "cash"
                if Player.PlayerData.money[account] >= amount then
                    Player.Functions.RemoveMoney(account, amount)
                    return true
                end
                return false
            end
        end
    },
    
    Notification = {
        Show = function(source, message, type, duration)
            if Config.Framework.Type == "esx" then
                TriggerClientEvent('esx:showNotification', source, message)
            elseif Config.Framework.Type == "qbcore" then
                local notifyTypes = {success = "success", error = "error", info = "primary"}
                TriggerClientEvent('QBCore:Notify', source, message, notifyTypes[type] or "primary", duration or 5000)
            else
                TriggerClientEvent('nevagofast:showNotification', source, message, type, duration)
            end
        end
    },
    
    JobCount = function(job)
        if Config.Framework.Type == "standalone" then return 1 end
        
        if Config.Framework.Type == "esx" then
            local ESX = exports[Config.Framework.ResourceName]:getSharedObject()
            local xPlayers = ESX.GetExtendedPlayers('job', job)
            return #xPlayers
        elseif Config.Framework.Type == "qbcore" then
            local QBCore = exports[Config.Framework.ResourceName]:GetCoreObject()
            local players = QBCore.Functions.GetQBPlayers()
            local count = 0
            for _, player in pairs(players) do
                if player.PlayerData.job.name == job then
                    count = count + 1
                end
            return count
            end
        end
    end
}

Config.UI = {}

Config.GoFast = {
    Pos = vector4(-1147.3839, -2177.1345, 12.3807, 138.8615),
    
    NPC = {
        Model = "g_m_importexport_01",
        Scenario = "WORLD_HUMAN_SMOKING",
        Invincible = true,
        Weapon = "WEAPON_PISTOL",
        InitiallyBlocked = true,
        HostileOnRefuse = true
    },
    
    Interaction = {
        Distance = 2.0,
        NotificationDistance = 5.0,
        DetectionInterval = 250,
        InteractionKey = 51,
        NPCResetDistance = 40.0,
        RespawnDelay = 10000
    },
    
    SellPoints = {
        vector3(-93.687950, 2809.792480, 53.338741),
        vector3(2333.597412, 2579.971436, 46.667709),
        vector3(-2175.934326, 4271.188477, 49.009758),
        vector3(287.130280, 6789.950195, 15.696222),
        vector3(1978.374512, 5171.522461, 47.639053),
        vector3(1552.291748, 2194.185547, 78.877167),
    },
    
    SpawnPoints = {
        vector4(-1152.1245, -2175.3284, 13.2478, 134.3622),
        vector4(-1156.9208, -2171.0986, 13.2411, 134.3622),
        vector4(-1154.6426, -2173.4712, 13.2401, 134.3622),
    },
    
    Reward = {
        Money = {
            Type = "cash",
            Min = 150,
            Max = 500
        },
        Items = {
            Enabled = false,
            Possibilities = {
                {name = "jewels", label = "Bijoux", chance = 10, min = 1, max = 3},
                {name = "goldbar", label = "Lingot d'or", chance = 5, min = 1, max = 2}
            }
        },
        Experience = {
            Enabled = false,
            Min = 10,
            Max = 30
        }
    },
    
    Vehicles = {
        Models = {
            "sultan",
            "oracle",
            "oracle2"
        },
        Customization = {
            RandomColor = true,
            RandomUpgrades = false,
            RandomPlate = true,
            PlatePrefix = "GFAST"
        },
        SpawnEffects = {
            ParticleEffect = true,
            ParticleAsset = "core",
            ParticleName = "ent_ray_heli_aprtmnt_l_fire",
            SoundEffect = "FLIGHT_SCHOOL_LESSON_PASSED",
            SoundBank = "HUD_AWARDS",
        }
    },
    
    Items = {
        Required = true,
        CheckInterval = 10,
        MaxTimeWithout = 120,
        Possibilities = {
            {name = "pochon_weed", label = "Pochon de Weed", minAmount = 2, maxAmount = 10},
            {name = "weed", label = "Weed", minAmount = 2, maxAmount = 10},
            {name = "weed_pooch", label = "Pochon de Weed", minAmount = 2, maxAmount = 10},
        }
    },
    
    Mission = {
        Duration = 15 * 60 * 1000,
        Cooldown = 24 * 60 * 60,
        DeliveryEffects = {
            ParticleEffect = true,
            ParticleAsset = "scr_jewelheist",
            ParticleName = "scr_jewel_cab_smash",
            SoundEffect = "Mission_Pass_Notify", 
            SoundBank = "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS",
            WaitTime = 2000
        }
    },
    
    LawEnforcement = {
        Notify = true,
        MinPlayers = 0,
        NotifiedJobs = {
            'police',
            'sheriff'
        },
        NotificationDelay = {
            Min = 30000,
            Max = 90000
        },
        NotificationChance = 75,
        BlipDuration = 60 * 1000,
        BlipSettings = {
            Sprite = 161,
            Color = 1,
            Scale = 1.0,
            Label = "Véhicule suspect signalé"
        }
    },
    
    BlipSettings = {
        Sprite = 1,
        Scale = 1.0,
        Color = 5,
        Label = "Point de livraison",
        Route = true,
        RouteColor = 5
    },
    
    Debug = {
        Enabled = false,
        ShowCoords = false,
        TestItem = false,
        LogLevel = 1
    }
}