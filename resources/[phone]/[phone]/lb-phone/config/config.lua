Config = {}
Config.Debug = false -- Set to true to enable debug mode

Config.DatabaseChecker = {}
Config.DatabaseChecker.Enabled = true -- if true, the phone will check the database for any issues and fix them if possible
Config.DatabaseChecker.AutoFix = true

--[[ FRAMEWORK OPTIONS ]] --
Config.Framework = "auto"
--[[
    Supported frameworks:
        * auto: auto-detect framework (ONLY WORKS WITH THE ONES LISTED BELOW)
        * esx: frwk, https://github.com/esx-framework/esx-legacy
        * qb: qb-core, https://github.com/qbcore-framework/qb-core
        * ox: ox_core, https://github.com/overextended/ox_core
        * vrp2: vrp 2.0 (ONLY THE OFFICIAL vRP 2.0, NOT CUSTOM VERSIONS)
        * standalone: no framework, note that framework specific apps will not work unless you implement the functions
]]
Config.CustomFramework = false -- if set to true and you use standalone, you will be able to use framework specific apps
Config.QBMailEvent = true -- if you want this script to listen for qb email events, enable this.
Config.QBOldJobMethod = false -- use the old method to check job in qb-core? this is slower, and only needed if you use an outdated version of qb-core.

Config.Item = {}
Config.Item.Require = true -- require a phone item to use the phone
Config.Item.Name = "phone" -- name of the phone item

Config.Item.Unique = false -- should each phone be unique? https://docs.lbscripts.com/phone/configuration/#unique-phones
Config.Item.Inventory = "auto" --[[
    The inventory you use, IGNORE IF YOU HAVE Config.Item.Unique DISABLED.
    Supported:
        * auto: auto-detect inventory (ONLY WORKS WITH THE ONE LISTED BELOW)
        * ox_inventory - https://github.com/overextended/ox_inventory
        * qb-inventory - https://github.com/qbcore-framework/qb-inventory
        * lj-inventory - https://github.com/loljoshie/lj-inventory
        * core_inventory - https://www.c8re.store/package/5121548
        * mf-inventory - https://modit.store/products/mf-inventory?variant=39985142268087
        * qs-inventory - https://buy.quasar-store.com/package/4770732
        * codem-inventory - https://codem.tebex.io/package/5900973
]]

Config.ServerSideSpawn = false -- should entities be spawned on the server? (phone prop, vehicles)

Config.PhoneModel = `lb_phone_prop` -- the prop of the phone, if you want to use a custom phone model, you can change this here
Config.PhoneRotation = vector3(0.0, 0.0, 180.0) -- the rotation of the phone when attached to a player
Config.PhoneOffset = vector3(0.0, -0.005, 0.0) -- the offset of the phone when attached to a player

Config.DynamicIsland = true -- if enabled, the phone will have a Iphone 14 Pro inspired Dynamic Island.
Config.SetupScreen = true -- if enabled, the phone will have a setup screen when the player first uses the phone.

Config.AutoDeleteNotifications = false -- notifications that are more than X hours old, will be deleted. set to false to disable. if set to true, it will delete 1 week old notifications.
Config.MaxNotifications = 100 -- the maximum amount of notifications a player can have. if they have more than this, the oldest notifications will be deleted. set to false to disable
Config.DisabledNotifications = { -- an array of apps that should not send notifications, note that you should use the app identifier, found in config.json
    -- "DarkChat",
}

Config.WhitelistApps = {
    -- ["test-app"] = {"police", "ambulance"}
}

Config.BlacklistApps = {
    -- ["DarkChat"] = {"police"}
}

Config.ChangePassword = {
    ["Trendy"] = true,
    ["InstaPic"] = true,
    ["Birdy"] = true,
    ["DarkChat"] = true,
    ["Mail"] = true,
}

Config.DeleteAccount = {
    ["Trendy"] = false,
    ["InstaPic"] = false,
    ["Birdy"] = false,
    ["DarkChat"] = false,
    ["Mail"] = false,
    ["Spark"] = false,
}

Config.Companies = {}
Config.Companies.Enabled = true -- allow players to call companies?
Config.Companies.MessageOffline = true -- if true, players can message companies even if no one in the company is online
Config.Companies.DefaultCallsDisabled = false -- should receiving company calls be disabled by default?
Config.Companies.AllowAnonymous = false -- allow players to call companies with "hide caller id" enabled?
Config.Companies.SeeEmployees = "everyone" -- who should be able to see employees? they will see name, online status & phone number. options are: "everyone", "employees" or "none"
Config.Companies.DeleteConversations = true -- allow employees to delete conversations?
Config.Companies.Services = {
    {
        job = "gouvernement",
        name = "Gouvernement",
        icon = "https://i.ibb.co/zVqPS32/bank.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Rockford Hills",
            coords = {
                x = -550.594299,
                y = -191.762741,
            }
        }
        -- customIcon = "IoShield", -- if you want to use a custom icon for the company, set it here: https://react-icons.github.io/react-icons/icons?name=io5
        -- onCustomIconClick = function()
        --    print("Clicked")
        -- end
    },
    {
        job = "police",
        name = "LSPD",
        icon = "https://i.ibb.co/WFt1QGz/police.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Rockford Hills",
            coords = {
                x = 101.104019,
                y = -393.197021, 
            }
        }
        -- customIcon = "IoShield", -- if you want to use a custom icon for the company, set it here: https://react-icons.github.io/react-icons/icons?name=io5
        -- onCustomIconClick = function()
        --    print("Clicked")
        -- end
    },
    {
        job = "saspn",
        name = "BCSO",
        icon = "https://i.ibb.co/pXzT5YF/sheriff-1-1.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Sandy Shores",
            coords = {
                x = 1732.133911,
                y = 3880.888184,
            }
        }
        -- customIcon = "IoShield", -- if you want to use a custom icon for the company, set it here: https://react-icons.github.io/react-icons/icons?name=io5
        -- onCustomIconClick = function()
        --    print("Clicked")
        -- end
    },
    {
        job = "ambulance",
        name = "EMS",
        icon = "https://i.ibb.co/xFhVXqr/paramedic-2.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Pillbox Hill",
            coords = {
                x = 304.2,
                y = -587.0,
            }
        }
    },
    {
        job = "cardealer",
        name = "Concessionnaire Auto",
        icon = "https://i.ibb.co/8Pk3BtV/car.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Pillbox Hill",
            coords = {
                x = -313.546417,
                y = -818.716125,
            }
        }
    },
    {
        job = "motodealer",
        name = "Concessionnaire Moto",
        icon = "https://i.ibb.co/mThkxLW/motorcycle.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Route 68",
            coords = {
                x = 1178.426147,
                y = 2646.358154,
            }
        }
    },
    {
        job = "boatdealer",
        name = "Concessionnaire Bateau",
        icon = "https://i.ibb.co/cFXdbcR/boat.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "La Puerta",
            coords = {
                x = -814.587158,
                y = -1347.486694,
            }
        }
    },
    -- {
    --     job = "burgershot",
    --     name = "Burgershot",
    --     icon = "https://i.ibb.co/yd7Hbfx/burger-3.png",
    --     canCall = true, -- if true, players can call the company
    --     canMessage = true, -- if true, players can message the company
    --     bossRanks = {"boss", "lieutenant"}, -- ranks that can manage the company
    --     location = {
    --         name = "Mission Row",
    --         coords = {
    --             x = 428.9,
    --             y = -984.5,
    --         }
    --     }
    -- },
    {
        job = "pearls",
        name = "Pearl's",
        icon = "https://i.ibb.co/ckVtwdG/rudder.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Del Perro Pier",
            coords = {
                x = -1816.674072,
                y = -1193.577881,
            }
        }
    },
    {
        job = "hornys",
        name = "Horny's",
        icon = "https://i.ibb.co/DYprHXY/bull.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Mirror Park",
            coords = {
                x = 1234.757446,
                y = -354.941681,
            }
        }
    },
    {
        job = "pops",
        name = "Pop's Diner",
        icon = "https://i.ibb.co/bRjdv1M/hot-dog.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Senora Freeway",
            coords = {
                x = 1587.137939,
                y = 6455.823730,
            }
        }
    },
    {
        job = "lscustom",
        name = "Ls Custom's",
        icon = "https://i.ibb.co/ZS9g0wN/service3.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Burton",
            coords = {
                x = -351.902649,
                y = -125.837448,
            }
        }
    },
    {
        job = "mecano",
        name = "Benny's",
        icon = "https://i.ibb.co/JzHRJQZ/service.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Strawberry",
            coords = {
                x = -211.878693,
                y = -1313.012573,
            }
        }
    },
    {
        job = "larrys",
        name = "Larry's",
        icon = "https://i.ibb.co/mNL6djh/service.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Route 68",
            coords = {
                x = 1222.460449,
                y = 2722.222656,
            }
        }
    },
    {
        job = "taxi",
        name = "Taxi",
        icon = "https://i.ibb.co/8DYyDkw/taxi.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "East Vinewood",
            coords = {
                x = 906.788391,
                y = -160.401123,
            }
        }
    },
    {
        job = "realestateagent",
        name = "Agence Immobilière",
        icon = "https://i.ibb.co/TRMkv7s/groom.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Pillbox Hill",
            coords = {
                x = -199.101562,
                y = -574.736450,
            }
        }
    },
    {
        job = "unicorn",
        name = "Unicorn",
        icon = "https://i.ibb.co/0BKJ9wR/latest.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Strawberry",
            coords = {
                x = 129.123306,
                y = -1298.974854,
            }
        }
    },
    {
        job = "wiwang",
        name = "Wiwang",
        icon = "https://i.ibb.co/QPJStQs/disco-ball.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Little Seoul",
            coords = {
                x = -827.162781,
                y = -694.794983,
            }
        }
    },
    {
        job = "pacific",
        name = "Pacific Bluff",
        icon = "https://i.ibb.co/NSg6D7X/blue-lagoon.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Del Perro",
            coords = {
                x = -3021.792725,
                y = 83.500595,
            }
        }
    },
    {
        job = "ltd_littleseoul",
        name = "LTD",
        icon = "https://i.ibb.co/JRDFQ6W/ltd.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Little Seoul",
            coords = {
                x = -711.620911,
                y = -915.784851,
            }
        }
    },
    {
        job = "ltd_ballas",
        name = "LTD",
        icon = "https://i.ibb.co/JRDFQ6W/ltd.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Grove Street",
            coords = {
                x = -53.263618,
                y = -1756.932983,
            }
        }
    },
    {
        job = "ltd_f4l",
        name = "LTD",
        icon = "https://i.ibb.co/JRDFQ6W/ltd.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Forum Drive",
            coords = {
                x = 29.186953,
                y = -1348.117432,
            }
        }
    },
    {
        job = "ltd_paletobay",
        name = "LTD",
        icon = "https://i.ibb.co/JRDFQ6W/ltd.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Paleto Bay",
            coords = {
                x = 163.094803,
                y = -6637.548340,
            }
        }
    },
    {
        job = "weazelnews",
        name = "Weazel News",
        icon = "https://i.ibb.co/DgPrLFn/news.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss"}, -- ranks that can manage the company
        location = {
            name = "Little Seoul",
            coords = {
                x = -598.305054,
                y = -930.166809,
            }
        }
    },
}

Config.Companies.Contacts = { -- not needed if you use the services app, this will add the contact to the contacts app
    -- ["police"] = {
    --     name = "Police",
    --     photo = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png"
    -- },
}

Config.Companies.Management = {
    Enabled = true, -- if true, employees & the boss can manage the company

    Duty = true, -- if true, employees can go on/off duty
    -- Boss actions
    Deposit = true, -- if true, the boss can deposit money into the company
    Withdraw = true, -- if true, the boss can withdraw money from the company
    Hire = true, -- if true, the boss can hire employees
    Fire = true, -- if true, the boss can fire employees
    Promote = true, -- if true, the boss can promote employees
}

Config.CustomApps = {} -- https://docs.lbscripts.com/phone/custom-apps/

Config.Valet = {}
Config.Valet.Enabled = true -- allow players to get their vehicles from the phone
Config.Valet.Price = 100 -- price to get your vehicle
Config.Valet.Model = `S_M_Y_XMech_01`
Config.Valet.Drive = true -- should a ped bring the car, or should it just spawn in front of the player?
Config.Valet.DisableDamages = false -- disable vehicle damages (engine & body health) on esx
Config.Valet.FixTakeOut = false -- repair the vehicle after taking it out?

Config.HouseScript = "auto" --[[
    The housing script you use on your server
    Supported:
        * loaf_housing - https://store.loaf-scripts.com/package/4310850
        * qb-houses - https://github.com/qbcore-framework/qb-houses
        * qs-housing - https://buy.quasar-store.com/package/5677308
]]

--[[ VOICE OPTIONS ]] --
Config.Voice = {}
Config.Voice.CallEffects = true -- enable call effects while on speaker mode? (NOTE: This may create sound-issues if you have too many submixes registered in your server)
Config.Voice.System = "pma"
--[[
    Supported voice systems:
        * pma: pma-voice - HIGHLY RECOMMENDED
        * mumble: mumble-voip - Not recommended, update to pma-voice
        * salty: saltychat - Not recommended, change to pma-voice
        * toko: tokovoip - Not recommended, change to pma-voice
]]

Config.Voice.HearNearby = true --[[
    Only works with pma-voice

    If true, players will be heard on instapic live if they are nearby
    If false, only the person who is live will be heard

    If true, allow nearby players to listen to phone calls if speaker is enabled
    If false, only the people in the call will be able to hear each other

    This feature is a work in progress and may not work as intended. It may have an impact on performance.
]]

Config.Voice.RecordNearby = true --[[
    Should video recordings include nearby players?
]]

--[[ PHONE OPTIONS ]] --
Config.Locations = { -- Locations that'll appear in the maps app.
    {
        position = vector2(-550.594299, -191.762741),
        name = "Gouvernement",
        description = "Gouvernement de Los Santos",
        icon = "https://i.ibb.co/BGgMkdJ/bankwhite.png",
    },
    {
        position = vector2(101.104019, -393.197021),
        name = "LSPD",
        description = "Poste de Police de Los Santos",
        icon = "https://i.ibb.co/8DkcjTt/policewhite.png",
    },
    {
        position = vector2(304.2, -587.0),
        name = "Hôpital Pillbox",
        description = "Hôpital",
        icon = "https://i.ibb.co/6bQkWtN/paramedicwhite.png",
    },
    {
        position = vector2(1732.133911, 3880.888184),
        name = "BCSO",
        description = "Poste de Police de Sandy Shores",
        icon = "https://i.ibb.co/0hGQLDM/sheriffwhite.png",
    },
    {
        position = vector2(-313.546417, -818.716125),
        name = "Concessionaire Auto",
        description = "Concessionaire Voiture de Los Santos",
        icon = "https://i.ibb.co/dGMMzZL/carwhite.png",
    },
    {
        position = vector2(1178.426147, 2646.358154),
        name = "Concessionaire Moto",
        description = "Concessionaire Moto de Sandy Shores",
        icon = "https://i.ibb.co/WFH616F/motorcyclewhite.png",
    },
    {
        position = vector2(-814.587158, -1347.486694),
        name = "Concessionaire Bateau",
        description = "Concesionnaire Bateau de Los Santos",
        icon = "https://i.ibb.co/12WvJmG/boatwhite.png",
    },
    -- {
    --     position = vector2(304.2, -587.0),
    --     name = "Burgershot",
    --     description = "Fast-food de Los Santos, spécialisé dans les burgers et frites",
    --     icon = "https://i.ibb.co/6bQkWtN/paramedicwhite.png",
    -- },
    {
        position = vector2(-1816.674072, -1193.577881),
        name = "Pearl's",
        description = "Restaurant de fruits de mer",
        icon = "https://i.ibb.co/XxxH8Hd/rudderwhite.png",
    },
    {
        position = vector2(1234.757446, -354.941681),
        name = "Horny's",
        description = "Fast-food spécialisé dans les burgers et frites",
        icon = "https://i.ibb.co/XyYDRD4/bullwhite.png",
    },
    {
        position = vector2(1587.137939, 6455.823730),
        name = "Pop's Dinner",
        description = "Fast-food spécialisé spécialisé dans les hot-dogs et onion rings",
        icon = "https://i.ibb.co/yVYGs2Y/hot-dogwhite.png",
    },
    {
        position = vector2(-351.902649, -125.837448),
        name = "LsCustom's",
        description = "Mécano",
        icon = "https://i.ibb.co/JRmTxZP/service3white.png",
    },
    {
        position = vector2(1222.460449, 2722.222656),
        name = "Larry's",
        description = "Mécano",
        icon = "https://i.ibb.co/w0WKpWc/service2white.png",
    },
    {
        position = vector2(-211.878693, -1313.012573),
        name = "Benny's",
        description = "Mécano",
        icon = "https://i.ibb.co/Dpy9zTN/servicewhite.png",
    },
    {
        position = vector2(906.788391, -160.401123),
        name = "Taxi",
        description = "Société Taxi de Los Santos",
        icon = "https://i.ibb.co/gDWHQVh/taxiwhite.png",
    },
    {
        position = vector2(-199.101562, -574.736450),
        name = "Agence Immobilière",
        description = "Agence Immobilière de Los Santos",
        icon = "https://i.ibb.co/0jQJGr3/groomwhite.png",
    },
    {
        position = vector2(129.123306, -1298.974854),
        name = "Unicorn",
        description = "Boîte de nuit au coeur de Los Santos",
        icon = "https://i.ibb.co/x677FFN/latestwhite.png",
    },
    {
        position = vector2(-827.162781, -694.794983),
        name = "Wiwang",
        description = "Boîte de nuit avec vue imprenable",
        icon = "https://i.ibb.co/rGXgTRR/disco-ballwhite.png",
    },
    {
        position = vector2(-3021.792725, 83.500595),
        name = "Pacific Bluff",
        description = "Boîte de nuit au bord de l'eau",
        icon = "https://i.ibb.co/7j02Wpp/blue-lagoonwhite.png",
    },
    {
        position = vector2(-711.620911, -915.784851),
        name = "LTD Little Seoul",
        description = "Supérette",
        icon = "https://i.ibb.co/H7fBgSB/ltdwhite.png",
    },
    {
        position = vector2(-53.263618, -1756.932983),
        name = "LTD Grove Street",
        description = "Supérette",
        icon = "https://i.ibb.co/H7fBgSB/ltdwhite.png",
    },
    {
        position = vector2(29.186953, -1348.117432),
        name = "LTD Forum Drive",
        description = "Supérette",
        icon = "https://i.ibb.co/H7fBgSB/ltdwhite.png",
    },
    {
        position = vector2(163.094803, 6637.548340),
        name = "LTD Paleto Bay",
        description = "Supérette",
        icon = "https://i.ibb.co/H7fBgSB/ltdwhite.png",
    },
    {
        position = vector2(-598.305054, -930.166809),
        name = "Weazel News",
        description = "Agence de presse de Los Santos",
        icon = "https://i.ibb.co/wg4Kfjp/newswhite.png",
    },
}

Config.Locales = { -- languages that the player can choose from when setting up a phone [Check the docs to see which languages the phone supports]
    {
        locale = "en",
        name = "English"
    },
    {
        locale = "de",
        name = "Deutsch"
    },
    {
        locale = "fr",
        name = "Français"
    },
    {
        locale = "es",
        name = "Español"
    },
    {
        locale = "nl",
        name = "Nederlands"
    },
    {
        locale = "dk",
        name = "Dansk"
    },
    {
        locale = "no",
        name = "Norsk"
    },
    {
        locale = "th",
        name = "ไทย"
    },
    {
        locale = "ar",
        name = "عربي"
    },
    {
        locale = "ru",
        name = "Русский"
    },
    {
        locale = "cs",
        name = "Czech"
    },
    {
        locale = "sv",
        name = "Svenska"
    },
    {
        locale = "pl",
        name = "Polski"
    },
    {
        locale = "hu",
        name = "Magyar"
    },
    {
        locale = "tr",
        name = "Türkçe"
    },
    {
        locale = "pt-br",
        name = "Português (Brasil)"
    },
    {
        locale = "pt-pt",
        name = "Português"
    },
    {
        locale = "it",
        name = "Italiano"
    },
    {
        locale = "ua",
        name = "Українська"
    }
}

Config.DefaultLocale = "fr"
Config.DateLocale = "en-US" -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat

Config.FrameColor = "#39334d" -- This is the color of the phone frame. Default (#39334d) is SILVER.
Config.AllowFrameColorChange = true -- Allow players to change the color of their phone frame?

Config.PhoneNumber = {}
Config.PhoneNumber.Format = "({3}) {3}" -- Don't touch unless you know what you're doing. IMPORTANT: The sum of the numbers needs to be equal to the phone number length + prefix length
Config.PhoneNumber.Length = 5 -- This is the length of the phone number WITHOUT the prefix.
Config.PhoneNumber.Prefixes = { -- These are the first numbers of the phone number, usually the area code. They all need to be the same length
    "555",
}

Config.Battery = {} -- WITH THESE SETTINGS, A FULL CHARGE WILL LAST AROUND 2 HOURS.
Config.Battery.Enabled = false -- Enable battery on the phone, you'll need to use the exports to charge it.
Config.Battery.ChargeInterval = { 5, 10 } -- How much battery
Config.Battery.DischargeInterval = { 50, 60 } -- How many seconds for each percent to be removed from the battery
Config.Battery.DischargeWhenInactiveInterval = { 80, 120 } -- How many seconds for each percent to be removed from the battery when the phone is inactive
Config.Battery.DischargeWhenInactive = true -- Should the phone remove battery when the phone is closed?

Config.CurrencyFormat = "$%s" -- ($100) Choose the formatting of the currency. %s will be replaced with the amount.
Config.MaxTransferAmount = 1000000 -- The maximum amount of money that can be transferred at once via wallet / messages.

Config.TransferLimits = {}
Config.TransferLimits.Daily = false -- The maximum amount of money that can be transferred in a day. Set to false for unlimited.
Config.TransferLimits.Weekly = false -- The maximum amount of money that can be transferred in a week. Set to false for unlimited.

Config.EnableMessagePay = true -- Allow players to pay other players via messages?
Config.EnableVoiceMessages = true -- Allow players to send voice messages?

Config.CityName = "Los Santos" -- The name that's being used in the weather app etc.
Config.RealTime = true -- if true, the time will use real life time depending on where the user lives, if false, the time will be the ingame time.
Config.CustomTime = false -- NOTE: disable Config.RealTime if using this. you can set this to a function that returns custom time, as a table: { hour = 0-24, minute = 0-60 }

Config.EmailDomain = "sunnyhill.fr"
Config.AutoCreateEmail = false -- should the phone automatically create an email for the player when they set up the phone?
Config.DeleteMail = true -- allow players to delete mails in the mail app?

Config.DeleteMessages = true -- allow players to delete messages in the messages app?

Config.SyncFlash = true -- should flashlights be synced across all players? May have an impact on performance
Config.EndLiveClose = false -- should InstaPic live end when you close the phone?

Config.AllowExternal = { -- allow people to upload external images? (note: this means they can upload nsfw / gore etc)
    Gallery = false, -- allow importing external links to the gallery?
    Birdy = false, -- set to true to enable external images on that specific app, set to false to disable it.
    InstaPic = false,
    Spark = false,
    Trendy = false,
    Pages = false,
    MarketPlace = false,
    Mail = false,
    Messages = false,
    Other = false, -- other apps that don't have a specific setting (ex: setting a profile picture for a contact, backgrounds for the phone etc)
}

-- Blacklisted domains for external images. You will not be able to upload from these domains.
Config.ExternalBlacklistedDomains = {
    "imgur.com",
    "discord.com",
    "discordapp.com",
}

-- Whitelisted domains for external images. If this is not empty/nil/false, you will only be able to upload images from these domains.
Config.ExternalWhitelistedDomains = {
    -- "fivemanage.com"
}

-- Set to false/empty to disable
Config.UploadWhitelistedDomains = { -- domains that are allowed to upload images to the phone (prevent using devtools to upload images)
    "fivemanage.com",
    "cfx.re" -- lb-upload
}

Config.WordBlacklist = {}
Config.WordBlacklist.Enabled = false
Config.WordBlacklist.Apps = { -- apps that should use the word blacklist (if Config.WordBlacklist.Enabled is true)
    Birdy = true,
    InstaPic = true,
    Trendy = true,
    Spark = true,
    Messages = true,
    Pages = true,
    MarketPlace = true,
    DarkChat = true,
    Mail = true,
    Other = true,
}
Config.WordBlacklist.Words = {
    -- array of blacklisted words, e.g. "badword", "anotherbadword"
}

Config.AutoFollow = {}
Config.AutoFollow.Enabled = false

Config.AutoFollow.Birdy = {}
Config.AutoFollow.Birdy.Enabled = true
Config.AutoFollow.Birdy.Accounts = {} -- array of usernames to automatically follow when creating an account. e.g. "username", "anotherusername"

Config.AutoFollow.InstaPic = {}
Config.AutoFollow.InstaPic.Enabled = true
Config.AutoFollow.InstaPic.Accounts = {} -- array of usernames to automatically follow when creating an account. e.g. "username", "anotherusername"

Config.AutoFollow.Trendy = {}
Config.AutoFollow.Trendy.Enabled = true
Config.AutoFollow.Trendy.Accounts = {} -- array of usernames to automatically follow when creating an account. e.g. "username", "anotherusername"

Config.AutoBackup = true -- should the phone automatically create a backup when you get a new phone?

Config.Post = {} -- What apps should send posts to discord? You can set your webhooks in server/webhooks.lua
Config.Post.Birdy = true -- Announce new posts on Birdy?
Config.Post.InstaPic = true -- Anmnounce new posts on InstaPic?
Config.Post.Accounts = {
    Birdy = {
        Username = "Birdy",
        Avatar = "https://loaf-scripts.com/fivem/lb-phone/icons/Birdy.png"
    },
    InstaPic = {
        Username = "InstaPic",
        Avatar = "https://loaf-scripts.com/fivem/lb-phone/icons/InstaPic.png"
    }
}

Config.BirdyTrending = {}
Config.BirdyTrending.Enabled = true -- show trending hashtags?
Config.BirdyTrending.Reset = 7 * 24 -- How often should trending hashtags be reset on birdy? (in hours)

Config.BirdyNotifications = false -- should everyone get a notification when someone posts?

Config.PromoteBirdy = {}
Config.PromoteBirdy.Enabled = true -- should you be able to promote post?
Config.PromoteBirdy.Cost = 2500 -- how much does it cost to promote a post?
Config.PromoteBirdy.Views = 100 -- how many views does a promoted post get?

Config.TrendyTTS = {
    {"English (US) - Female", "en_us_001"},
    {"English (US) - Male 1", "en_us_006"},
    {"English (US) - Male 2", "en_us_007"},
    {"English (US) - Male 3", "en_us_009"},
    {"English (US) - Male 4", "en_us_010"},

    {"English (UK) - Male 1", "en_uk_001"},
    {"English (UK) - Male 2", "en_uk_003"},

    {"English (AU) - Female", "en_au_001"},
    {"English (AU) - Male", "en_au_002"},

    {"French - Male 1", "fr_001"},
    {"French - Male 2", "fr_002"},

    {"German - Female", "de_001"},
    {"German - Male", "de_002"},

    {"Spanish - Male", "es_002"},

    {"Spanish (MX) - Male", "es_mx_002"},

    {"Portuguese (BR) - Female 2", "br_003"},
    {"Portuguese (BR) - Female 3", "br_004"},
    {"Portuguese (BR) - Male", "br_005"},

    {"Indonesian - Female", "id_001"},

    {"Japanese - Female 1", "jp_001"},
    {"Japanese - Female 2", "jp_003"},
    {"Japanese - Female 3", "jp_005"},
    {"Japanese - Male", "jp_006"},

    {"Korean - Male 1", "kr_002"},
    {"Korean - Male 2", "kr_004"},
    {"Korean - Female", "kr_003"},

    {"Ghostface (Scream)", "en_us_ghostface"},
    {"Chewbacca (Star Wars)", "en_us_chewbacca"},
    {"C3PO (Star Wars)", "en_us_c3po"},
    {"Stitch (Lilo & Stitch)", "en_us_stitch"},
    {"Stormtrooper (Star Wars)", "en_us_stormtrooper"},
    {"Rocket (Guardians of the Galaxy)", "en_us_rocket"},

    {"Singing - Alto", "en_female_f08_salut_damour"},
    {"Singing - Tenor", "en_male_m03_lobby"},
    {"Singing - Sunshine Soon", "en_male_m03_sunshine_soon"},
    {"Singing - Warmy Breeze", "en_female_f08_warmy_breeze"},
    {"Singing - Glorious", "en_female_ht_f08_glorious"},
    {"Singing - It Goes Up", "en_male_sing_funny_it_goes_up"},
    {"Singing - Chipmunk", "en_male_m2_xhxs_m03_silly"},
    {"Singing - Dramatic", "en_female_ht_f08_wonderful_world"}
}

-- ICE Servers for WebRTC (ig live, live video). If you don't know what you're doing, leave this as it is.
-- see https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/RTCPeerConnection
-- Config.RTCConfig = {
--     iceServers = {
--         { urls = "stun:stun.l.google.com:19302" },
--     }
-- }

Config.Crypto = {}
Config.Crypto.Enabled = true
Config.Crypto.Coins = {"bitcoin","ethereum","tether","binancecoin","usd-coin","ripple","binance-usd","cardano","dogecoin","solana","shiba-inu","polkadot","litecoin","bitcoin-cash"}
Config.Crypto.Currency = "usd" -- currency to use for crypto prices. https://api.coingecko.com/api/v3/simple/supported_vs_currencies
Config.Crypto.Refresh = 5 * 60 * 1000 -- how often should the crypto prices be refreshed (client cache)? (Default 5 minutes)
Config.Crypto.QBit = true -- support QBit? (requires qb-crypto & qb-core)

Config.KeyBinds = {
    -- Find keybinds here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Open = { -- toggle the phone
        Command = "phone",
        Bind = "F1",
        Description = "Ouvrir le téléphone"
    },
    Focus = { -- keybind to toggle the mouse cursor.
        Command = "togglePhoneFocus",
        Bind = "LMENU",
        Description = "Activer le curseur sur le téléphone"
    },
    StopSounds = { -- in case the sound would bug out, you can use this command to stop all sounds.
        Command = "stopSounds",
        Bind = false,
        Description = "Couper tous les sons du téléphone"
    },

    FlipCamera = {
        Command = "flipCam",
        Bind = "UP",
        Description = "Inverser la caméra du téléphone"
    },
    TakePhoto = {
        Command = "takePhoto",
        Bind = "RETURN",
        Description = "Prendre une photo / une vidéo"
    },
    ToggleFlash = {
        Command = "toggleCameraFlash",
        Bind = "E",
        Description = "Activer le flash"
    },
    LeftMode = {
        Command = "leftMode",
        Bind = "LEFT",
        Description = "Changer de mode"
    },
    RightMode = {
        Command = "rightMode",
        Bind = "RIGHT",
        Description = "Changer de mode"
    },

    AnswerCall = {
        Command = "answerCall",
        Bind = "RETURN",
        Description = "Répondre à l'appel entrant"
    },
    DeclineCall = {
        Command = "declineCall",
        Bind = "BACK",
        Description = "Refuser l'appel entrant"
    },
    UnlockPhone = {
        Bind = "SPACE",
        Description = "Ouvrir le téléphone",
    },
}

Config.KeepInput = true -- keep input when nui is focused (meaning you can walk around etc)

--[[ PHOTO / VIDEO OPTIONS ]] --
-- Set your api keys in lb-phone/server/apiKeys.lua
Config.UploadMethod = {}
-- You can edit the upload methods in lb-phone/shared/upload.lua
-- We recommend Fivemanage, https://fivemanage.com
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
-- If you want to host uploads yourself, you can use LBUpload: https://github.com/lbphone/lb-upload
-- We STRONGLY discourage using Discord as an upload method, as uploaded files may become inaccessible after a while.
Config.UploadMethod.Video = "Fivemanage" -- "Fivemanage" or "LBUpload" or "Custom"
Config.UploadMethod.Image = "Fivemanage" -- "Fivemanage" or "LBUpload" or "Custom
Config.UploadMethod.Audio = "Fivemanage" -- "Fivemanage" or "LBUpload" or "Custom"

Config.Video = {}
Config.Video.Bitrate = 400 -- video bitrate (kbps), increase to improve quality, at the cost of file size
Config.Video.FrameRate = 24 -- video framerate (fps), 24 fps is a good mix between quality and file size used in most movies
Config.Video.MaxSize = 25 -- max video size (MB)
Config.Video.MaxDuration = 60 -- max video duration (seconds)

Config.Image = {}
Config.Image.Mime = "image/webp" -- image mime type, "image/webp" or "image/png" or "image/jpg"
Config.Image.Quality = 0.95
