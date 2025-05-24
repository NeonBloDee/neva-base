Config = Config or {}
--[[ 
    Welcome to the inventory configuration!
    https://lcode.gitbook.io/documentation/inventory/
]]

--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗     
-- ██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║     
-- ██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║     
-- ██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║     
-- ╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗
--  ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
                                                           

Config.Language = "fr" -- Set your lang in locales folder (fr, en, es, ...)
Config.Framework = "esx" -- esx or qb
Config.Debug = false 
Config.UseNPC = false
--[[                                    
    'old' (Esx 1.1).
    'new' (Esx 1.2, v1 final, legacy or extendedmode).
]]
Config.esxVersion = 'new' 

Config.Trigger = {
    ['useItem'] = 'esx:useItem', 
    ['getSharedObject'] = 'esx:getSharedObject',
    ['getStatus'] = 'esx_status:getStatus',
    ['saveSkin'] = 'esx_skin:save',
}


Config.KeyBinds = {
    -- Find keybinds here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    {Command = "inventory", Bind = "TAB", Description = "Open inventory"},-- toggle the inventaire
    {Command = "keybind_1", Bind = "1", Description = "Slot weapon 1"},-- 
    {Command = "keybind_2", Bind = "2", Description = "Slot weapon 2"},-- 
    {Command = "keybind_3", Bind = "3", Description = "Slot weapon 3"},-- 
    {Command = "keybind_4", Bind = "4", Description = "Slot weapon 4"},-- 
    {Command = "keybind_5", Bind = "5", Description = "Slot weapon 5"},-- 
    {Command = "trunk", Bind = "K", Description = "Open trunk vehicle"},-- 
}

-- false : If you want use your custom notification in inventory (client/custom/framework/esx.lua)
Config.UseNotificationInventory = true

-- Name of the item when used will close the UI
Config.CloseUI = {
    ['water'] = true,
    ['bread'] = true,
    ['phone'] = true,
    ['boombox'] = true,
}

-- Names of weapons impossible to give
Config.WeaponNoGive = {
    
}

-- Names of item impossible to give
Config.ItemNoGive = {
    ['caisse_gold'] = true,
    ['caisse_diamond'] = true,
    ['caisse_ruby'] = true,
    ['caisse_fidelite'] = true,
    ['caisse_noel'] = true,
    ['jetoncustom'] = true,
    ['idcard'] = true,
    ['caisse_vehicule'] = true,
    ['boombox'] = true,
    ['awpredline'] = true,
    ['ak47neonride'] = true,
    ['victusxmr'] = true,
    ['m6ic'] = true,
    ['ar15'] = true,
    ['fn509'] = true,
    ['mp5sdfm'] = true,
    ['honeybadgercod'] = true,
    ['mcxspear'] = true,
    ['glitchpopvandal'] = true,
    ['scar17fm'] = true,
    ['hkumpp'] = true,
    ['fireaxe'] = true,
    ['bren'] = true,
    ['vp9'] = true,
    ['sledgehammer'] = true,
    ['m9a3'] = true,
    ['katana'] = true,
    ['karambitknife'] = true,
    ['doublebarrel'] = true,
    ['hk416'] = true,
    ['aks74u'] = true,
    ['g17neonoir'] = true,
    ['g17gen5'] = true,
    ['m9bayonnetlore'] = true,
    ['katana2'] = true,
    ['katana3'] = true,
    ['katana4'] = true,
    ['katana5'] = true,
    ['katana6'] = true,
    ['toz'] = true,
    ['flamethrower'] = true,
    ['guitar'] = true,
    ['glock20'] = true,
    ['hk417'] = true,
    ['michaelmyers'] = true,
    ['leatherface_hatchet'] = true,
    ['leatherface_hammer'] = true,
    ['jasonvoorhees'] = true,
    ['chucky'] = true,
    ['darthvader'] = true,
    ['scythe'] = true,
    
}

-- Name of the item that cannot be placed in slots
Config.BL_SlotInv = {
    ["phone"] = true,
    ["radio"] = true,
    ['boombox'] = true,
}

--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗██╗      ██████╗ ████████╗██╗  ██╗███████╗███████╗
-- ██╔════╝██║     ██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔════╝
-- ██║     ██║     ██║   ██║   ██║   ███████║█████╗  ███████╗
-- ██║     ██║     ██║   ██║   ██║   ██╔══██║██╔══╝  ╚════██║
-- ╚██████╗███████╗╚██████╔╝   ██║   ██║  ██║███████╗███████║
--  ╚═════╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
                 

-- For interaction in the middle of the inventory
Config.Clothes = {
    ['helmet'] = {
        [0] = {['helmet_1'] = -1 --[[ type ]], ["helmet_2"] = 0--[[ color ]]}, -- men 
        [1] = {['helmet_1'] = -1 --[[ type ]], ["helmet_2"] = 0--[[ color ]]}  -- women
    },
    ['chain'] = {
        [0] = {['chain_1'] = 0, ["chain_2"] = 0}, -- //
        [1] = {['chain_1'] = 0, ["chain_2"] = 0}  -- //
    },
    ['torso'] = {
        [0] = {['torso_1'] = 15, ["torso_2"] = 0},
        [1] = {['torso_1'] = 15, ["torso_2"] = 0},
    },
    ['tshirt'] = {
        [0] = {['tshirt_1'] = 15, ["tshirt_2"] = 0},
        [1] = {['tshirt_1'] = 15, ["tshirt_2"] = 0},
    },
    ['arms'] = {
        [0] = {['arms_1'] = 15, ["arms_2"] = 0},
        [1] = {['arms_1'] = 15, ["arms_2"] = 0},
    },
    ['pants'] = {
        [0] = {['pants_1'] = 14, ["pants_2"] = 0},
        [1] = {['pants_1'] = 14, ["pants_2"] = 0}
    },
    ['shoes'] = {
        [0] = {['shoes_1'] = 34, ["shoes_2"] = 0},
        [1] = {['shoes_1'] = 34, ["shoes_2"] = 0}
    },
    ['bags'] = {
        [0] = {['bags_1'] = 0, ["bags_2"] = 0},
        [1] = {['bags_1'] = 0, ["bags_2"] = 0}
    },
    ['mask'] = {
        [0] = {['mask_1'] = 0, ["mask_2"] = 0},
        [1] = {['mask_1'] = 0, ["mask_2"] = 0}
    },
    ['glasses'] = {
        [0] = {['glasses_1'] = 0, ["glasses_2"] = 0},
        [1] = {['glasses_1'] = 0, ["glasses_2"] = 0}
    },
    ['ears'] = {
        [0] = {['ears_1'] = -1, ["ears_2"] = 0},
        [1] = {['ears_1'] = -1, ["ears_2"] = 0}
    },
    ['bracelets'] = {
        [0] = {['bracelets_1'] = -1, ["bracelets_2"] = 0},
        [1] = {['bracelets_1'] = -1, ["bracelets_2"] = 0}
    },
    ['watches'] = {
        [0] = {['watches_1'] = -1, ["watches_2"] = 0},
        [1] = {['watches_1'] = -1, ["watches_2"] = 0}
    },
    ['bproof'] = {
        [0] = {['bproof_1'] = 0, ["bproof_2"] = 0},
        [1] = {['bproof_1'] = 0, ["bproof_2"] = 0}
    },
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗██╗      ██████╗ ████████╗██╗  ██╗██╗███╗   ██╗ ██████╗     ███████╗████████╗ ██████╗ ██████╗ ███████╗
-- ██╔════╝██║     ██╔═══██╗╚══██╔══╝██║  ██║██║████╗  ██║██╔════╝     ██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
-- ██║     ██║     ██║   ██║   ██║   ███████║██║██╔██╗ ██║██║  ███╗    ███████╗   ██║   ██║   ██║██████╔╝█████╗  
-- ██║     ██║     ██║   ██║   ██║   ██╔══██║██║██║╚██╗██║██║   ██║    ╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  
-- ╚██████╗███████╗╚██████╔╝   ██║   ██║  ██║██║██║ ╚████║╚██████╔╝    ███████║   ██║   ╚██████╔╝██║  ██║███████╗
--  ╚═════╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
        
Config.ActiveClothShop = true

Config.ClothMarkerDistance = 15
Config.ClothMarkerType = 25
Config.ClothActiveText = false
Config.ClothMarkerText = '👕'

Config.ClothTypeMoney = 'bank'
Config.ClothPriceSave = 100
Config.ClothPriceRegister = 250
Config.ClothPrice = {
    ["top"] = 150,
    ["pants"] = 100,
    ["shoes"] = 80,
    ["bags"] = 50,
    ["glasses"] = 20,
    ["ears"] = 10,
    ["helmet"] = 30,
    ["bracelets"] = 15,
    ["watches"] = 30,
    ["chain"] = 50,
    ["mask"] = 30,
}

Config.PosClotheShop = {
        ['Binco'] = {
            menu = 'shopui_title_lowendfashion2',
            type = 'clothes', -- or mask
            coords = {
                vec3(72.658409118652, -1398.9842529297, 29.376123428345-1.0),
                vec3(4489.457031, -4452.023438, 4.171892-1.0), 
                vec3(-703.94110107422, -152.1471862793, 37.415134429932-1.0),
                vec3(-168.08949279785, -298.69085693359, 39.73327255249-1.0),
                vec3(428.51501464844, -800.30999755859, 29.491121292114-1.0),
                vec3(-829.43786621094, -1073.8389892578, 11.328098297119-1.0),
                vec3(-1447.4333496094, -243.05351257324, 49.822105407715-1.0),
                vec3(11.785837173462, 6514.0327148438, 31.877853393555-1.0),
                vec3(121.41311645508, -225.09120178223, 54.557891845703-1.0),
                vec3(1695.9750976562, 4829.3217773438, 42.063121795654-1.0),
                vec3(617.74530029297, 2765.0300292969, 42.088153839111-1.0),
                vec3(1190.4202880859, 2713.3115234375, 38.222579956055-1.0),
                vec3(-1188.4792480469, -769.00695800781, 17.325212478638-1.0),
                vec3(-3174.9614257812, 1042.6502685547, 20.863206863403-1.0),
                vec3(-1108.4439697266, 2709.0046386719, 19.106767654419-1.0),
            },
            blip = {
                color = 81,
                size = 0.5,
                style = 73
            }
        },
        ['Magasin de masque'] = {
            menu = 'shopui_title_lowendfashion2',
            type = 'mask', -- or mask
            coords = {
                vec3(-1337.1519775391, -1277.3803710938, 4.8798298835754 - 1.0)
            },
            blip = {
                color = 18,
                size = 0.5,
                style = 102
            }
        },
    }



--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

--  █████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗███╗   ██╗████████╗
-- ██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║████╗  ██║╚══██╔══╝
-- ███████║██║     ██║     ██║   ██║██║   ██║██╔██╗ ██║   ██║   
-- ██╔══██║██║     ██║     ██║   ██║██║   ██║██║╚██╗██║   ██║   
-- ██║  ██║╚██████╗╚██████╗╚██████╔╝╚██████╔╝██║ ╚████║   ██║   
-- ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   
                                                             

-- Display accounts in inventory
Config.ActiveAccount = true
Config.Account = {["black_money"] = true, ["cash"] = true} 
Config.AccountName = {
    ["black_money"] = 'Argent sale', 
    ["cash"] = 'Argent'
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗██████╗      ██████╗ █████╗ ██████╗ ██████╗ 
-- ██║██╔══██╗    ██╔════╝██╔══██╗██╔══██╗██╔══██╗
-- ██║██║  ██║    ██║     ███████║██████╔╝██║  ██║
-- ██║██║  ██║    ██║     ██╔══██║██╔══██╗██║  ██║
-- ██║██████╔╝    ╚██████╗██║  ██║██║  ██║██████╔╝
-- ╚═╝╚═════╝      ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
    

-- Display id card in inventory
Config.ActiveIdCard = false -- just for ESX
Config.ActiveMugShot = false -- https://github.com/BaziForYou/MugShotBase64
Config.PictureIdCard = 'https://cdn.discordapp.com/attachments/979486375218937946/1135635765397823488/47848.png'  -- if ActiveMugShot == false
Config.IdCardName = {
    ["idcard"] = {
        name = 'Identity card', 
        icon = 'assets/icons/icon.png',
        color = '#FFF'
    },
     ["drive"] = {
         name = 'Driver\'s license', 
         icon = 'assets/icons/permis.png',
         color = '#e2bab3'
     },
    -- ["weapon"] = {
    --     name = 'Weapon license', 
    --     icon = 'https://cdn.discordapp.com/attachments/979486375218937946/1135638696289382400/gun-4-xxl.png',
    --     color = '#cc352a'
    -- },
    -- ["police"] = { 
    --     name = 'Badge LSPD',
    --     icon = 'assets/icons/police.png', 
    --     color = '#05224d'
    -- }
}
Config.GenreIdCard = {
    ["1"] = 'Women', 
    ["0"] = 'Men', 
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗     ██████╗     ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
-- ██║     ██╔══██╗    ██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
-- ██║     ██████╔╝    ██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
-- ██║     ██╔══██╗    ██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
-- ███████╗██████╔╝    ██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
-- ╚══════╝╚═════╝     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
                                                               
-- LB Phone is unique with inventory
Config.ActivePhoneUnique = false
Config.ItemPhoneName = 'phone'

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██████╗  ██████╗  ██████╗ ███╗   ███╗██████╗  ██████╗ ██╗  ██╗
-- ██╔══██╗██╔═══██╗██╔═══██╗████╗ ████║██╔══██╗██╔═══██╗╚██╗██╔╝
-- ██████╔╝██║   ██║██║   ██║██╔████╔██║██████╔╝██║   ██║ ╚███╔╝ 
-- ██╔══██╗██║   ██║██║   ██║██║╚██╔╝██║██╔══██╗██║   ██║ ██╔██╗ 
-- ██████╔╝╚██████╔╝╚██████╔╝██║ ╚═╝ ██║██████╔╝╚██████╔╝██╔╝ ██╗
-- ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝
                                                              
-- Boombox with inventory
Config.ActiveBoombox = false
Config.BoomboxItem = 'boombox'

Config.MaxDistance = 40
Config.MinDistance = 0

Config.MaxVolume = 100
Config.MinVolume = 0

function UseBoombox(source)
    return true -- use condition for vip (exemple)
end

--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗      ██████╗  ██████╗ ████████╗
-- ██║     ██╔═══██╗██╔═══██╗╚══██╔══╝
-- ██║     ██║   ██║██║   ██║   ██║   
-- ██║     ██║   ██║██║   ██║   ██║   
-- ███████╗╚██████╔╝╚██████╔╝   ██║   
-- ╚══════╝ ╚═════╝  ╚═════╝    ╚═╝   
                      
Config.HandsupForLoot = false
Config.ActiveJobForLoot = false
Config.JobForLoot = {
    ['police'] = true,
    ['fbi'] = true,
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ████████╗██████╗ ██╗   ██╗███╗   ██╗██╗  ██╗
-- ╚══██╔══╝██╔══██╗██║   ██║████╗  ██║██║ ██╔╝
--    ██║   ██████╔╝██║   ██║██╔██╗ ██║█████╔╝ 
--    ██║   ██╔══██╗██║   ██║██║╚██╗██║██╔═██╗ 
--    ██║   ██║  ██║╚██████╔╝██║ ╚████║██║  ██╗
--    ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝


Config.JustOwnerVehicle = false        

Config.saveTrunkCommand = 'saveTrunk'
Config.savingTimer = 5 -- minutes

Config.AutoDeleteTrunk = true -- remove all trunk with not owner
Config.CommandDeleteTrunk = 'deleteTrunk'

Config.AccountTrunkName = {
    ["cash"] = 'Argents',
    ["black_money"] = 'Argents Sale', 
}

Config.WeightVehicle = {
    [0] = 50, -- Compacts  
    [1] = 50, -- Sedans
    [2] = 200, -- SUVs
    [3] = 50, -- Coupes 
    [4] = 50, -- Muscle  
    [5] = 50, -- Sports Classics  
    [6] = 50, -- Sports  
    [7] = 30, -- Super  
    [8] = 5, -- Motorcycles  
    [9] = 1000, -- Off-road 
    [10] = 1000, -- Industrial  
    [11] = 100, -- Utility  
    [12] = 1000, -- Vans  
    [13] = 0, -- Cycles  
    [14] = 300, -- Boats  
    [15] = 150, -- Helicopters  
    [16] = 300, -- Planes  
    [17] = 1000, -- Service  
    [18] = 50, -- Emergency  
    [19] = 50, -- Military  
    [20] = 1000, -- Commercial  
    [21] = 0, -- Trains  
    [22] = 5, -- Open Wheel,
    SpecificVehicles = { -- Table des poids spécifiques pour certains modèles
        ["contender"] = 1000,
        ["mule5"] = 1500,
        ["gbesperta"] = 2000,
        ["gbeon"] = 50,
        ["hycrh7"] = 50,
        ["gbsentinelgts"] = 50,
        ["gbschrauber"] = 50,
        ["estancia"] = 30,
        ["audace"] = 30,
        ["cycloneex0"] = 30,
        ["gb811s2"] = 30,
        ["issi8s"] = 50,
        ["turtle"] = 50,
        ["space"] = 50,
        ["elegyheritage"] = 50,
        ["nriata"] = 200,
        ["shinobir"] = 5,
        ["sheavas"] = 30,
        ["gstghell1"] = 50,
        ["asteropers"] = 50,
        ["dubsta22"] = 200,
        ["gbneonct"] = 50,
        ["H4RxST2"] = 30,
        ["schlagenstr"] = 30,
        ["tempestas"] = 30,
        ["sentinel_rts"] = 50,
        ["highmare"] = 1000,
        ["gbtahomagt"] = 50,
        ["bati901"] = 5,
        ["gbsultanrsx"] = 50,
        ["gbbisonhf"] = 1000,
        ["kqrumpo"] = 1000,
        ["tempestaes"] = 30,
        ["deimos"] = 30,
        ["hellfirelastcall"] = 50,
        ["gbsapphire"] = 50,
        ["gbcomets1t"] = 30,
        ["turismocs"] = 30,
        ["neross"] = 30,
        ["gbprospero"] = 30,
        ["gbcomets2r"] = 30,
        ["gbdominatorgsx"] = 50,
        ["gbbanshees"] = 30,
        ["gbvivant"] = 50,
        ["gbstarlight"] = 200,
        ["gbargento7f"] = 50,
        ["gbturismogt"] = 30,
        ["elegyx"] = 50,
        ["gbmogulrs"] = 50,
        ["gbcomets2rc"] = 30,
        ["superd3"] = 50,
        ["gbsolace"] = 30,
        ["gbcometcl"] = 30,
        ["coqvice"] = 30,
        ["hurricane"] = 30,
        ["gblod4"] = 300,
        ["gbtr3s"] = 30,
        ["policeb"] = 5,
        ["seashark"] = 5,
        ["seashark2"] = 5,
        ["seashark3"] = 5,
        ["submersible"] = 50,
        ["submersible2"] = 0,
        ["avisa"] = 50,
        ["tug"] = 5000,
        ["packer"] = 5,
        ["phantom"] = 5,
        ["phantom2"] = 5,
        ["phantom3"] = 5,
        ["phantom4"] = 5,
        ["hauler"] = 5,
        ["hauler2"] = 5,
        ["bfinjection"] = 30,
        ["bifta"] = 30,
        ["blazer"] = 5,
        ["blazer2"] = 5,
        ["blazer3"] = 5,
        ["blazer4"] = 5,
        ["blazer5"] = 5,
        ["brawler"] = 200,
        ["draugur"] = 50,
        ["dune"] = 30,
        ["dune2"] = 30,
        ["dune3"] = 30,
        ["dune4"] = 30,
        ["dune5"] = 30,
        ["freecrawler"] = 200,
        ["hellion"] = 200,
        ["kalahari"] = 200,
        ["mesa3"] = 200,
        ["outlaw"] = 30,
        ["rancherxl"] = 200,
        ["rancherxl2"] = 200,
        ["rcbandito"] = 0,
        ["trophytruck"] = 200,
        ["trophytruck2"] = 200,
        ["vagrant"] = 30,
        ["verus"] = 5,
        ["winky"] = 5,
        ["cuban800"] = 1000,
        ["taxi"] = 50,
        ["streiter"] = 200,
        ["veto"] = 0,
        ["veto2"] = 0,
        ["airtug"] = 5,
        ["caddy"] = 5,
        ["caddy2"] = 5,
        ["caddy3"] = 5,
        ["docktug"] = 50,
        ["forklift"] = 5,
        ["2vd_aleutian2"] = 200,
        ["2vd_annihilator"] = 150,
        ["2vd_dgranger2"] = 200,
        ["2vd_vcaracara2"] = 200,
        ["2vd_vsandking"] = 300,
        ["2vd_vstanier2"] = 50,
        ["rolavstr"] = 50,
        ["rolaballer2"] = 200,
        ["rolacinquemila"] = 50,
        ["rolabuffalo"] = 50,
        ["rolacomet"] = 30,
        ["rolatenf"] = 30,
        ["rolaturismo"] = 30,
        ["rolacavalcade"] = 200,
        ["rolacaracara"] = 200,
        ["m24stang"] = 30,
        ["m21tahoe"] = 200,
        ["m20explorer"] = 200,
        ["m19tahoe"] = 200,
        ["m19f150"] = 30,
        ["m18taurus"] = 50,
        ["m18charger"] = 50,
        ["m16explorer"] = 200,
        ["m15expedition"] = 200,
        ["m14charger"] = 50,
        ["m13explorer"] = 200,
        ["m11vic"] = 50,
    }
}

Config.WeaponDefaultWeight = 5
Config.WeaponWeight = {
    ["WEAPON_NIGHTSTICK"] = 1,
    ["WEAPON_STUNGUN"] = 1,
    ["WEAPON_FLASHLIGHT"] = 1,
    ["WEAPON_ASSAULTRIFLE"] = 5,
    ["WEAPON_SMG"] = 3,
}

Config.ClothesWeight = {
    ["top"] = 0.8,
    ["pants"] = 0.5,
    ["outfit"] = 2,
    ["shoes"] = 0.5,
    ["bags"] = 1.5,
    ["glasses"] = 0.2,
    ["ears"] = 0.2,
    ["helmet"] = 0.4,
    ["bracelets"] = 0.1,
    ["watches"] = 0.1,
    ["chain"] = 0.1,
    ["mask"] = 0.4,
}

--╚════════════════════════════════════════════════════════════════════════════════╝

Config.Chests = {}
