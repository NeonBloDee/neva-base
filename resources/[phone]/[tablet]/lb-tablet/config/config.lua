Config = {}
Config.Debug = false -- Set to true to enable debug mode

Config.DatabaseChecker = {}
Config.DatabaseChecker.Enabled = true -- if true, the tablet will check the database for any issues and fix them if possible
Config.DatabaseChecker.AutoFix = true -- if true, the tablet will automatically fix any issues & add new tables if needed

Config.LBPhone = "false" -- Set to false if you don't want to link lb-phone to lb-tablet

Config.OpenCommand = "tablet" -- the command to open the tablet. can be set to false to disable

Config.Logs = {}
Config.Logs.Enabled = true
Config.Logs.Service = "discord" -- fivemanage, discord or ox_lib. if discord, set your webhook in server/apiKeys.lua
Config.Logs.Actions = {
    TakePhoto = true,
    Police = true,
}

--[[ FRAMEWORK OPTIONS ]] --
Config.Framework = "esx"
--[[
    Supported frameworks:
        * esx: es_extended, https://github.com/esx-framework/esx-legacy
        * qb: qb-core, https://github.com/qbcore-framework/qb-core
        * qbox: qbox, https://github.com/Qbox-project/qbx_core
        * standalone: no framework, note that framework specific apps will not work unless you implement the functions
        * registration: standalone framework using the registration app for characters
]]

Config.RegistrationApp = false -- add an app that lets players create their own characters, vehicles etc? useful for standalone vMenu servers

Config.HousingScript = "auto"
Config.JailScript = "auto"
--[[
    Supported jail scripts:
        * auto: automatically detect the jail script (recommended)
        * qalle: esx-qalle-jail https://github.com/qalle-git/esx-qalle-jail
        * esx: esx_jail https://github.com/esx-community/esx_jail
        * pickle: pickle_prisons https://github.com/PickleModifications/pickle_prisons
        * qb: qb-prison https://github.com/qbcore-framework/qb-prison
        * xt: xt-prison
        * qbox: qbx_prison
        * rcore: rcore_prison
]]

Config.Item = {}
Config.Item.Require = true -- require a tablet item to use the tablet
Config.Item.Name = "tablet" -- name of the tablet item

Config.AutoCreateEmail = false
Config.EmailDomain = "sunnyhill.com"
Config.DobFormat = "auto" -- default for qb-core

--[[ LANGUAGE OPTIONS ]] --
Config.DefaultLocale = "fr"
Config.DateLocale = "fr-FR" -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat
Config.CurrencyFormat = "$%s"

--[[ VOICE OPTIONS ]] --
Config.Voice = {}
Config.Voice.RecordNearby = true -- Should video & audio recording include nearby players?

--[[ ENTITY OPTIONS ]] --
Config.TabletModel = `lb_tablet_prop` -- the prop of the tablet, if you want to use a custom tablet model, you can change this here
Config.TabletRotation = vector3(0.0, 180.0, 0.0) -- the rotation of the tablet when attached to a player
Config.TabletOffset = vector3(0.05, -0.005, -0.04) -- the offset of the tablet when attached to a player
Config.ServerSideSpawn = false -- should the tablet entity be spawned on the server?

--[[ MISC OPTIONS ]] --
Config.KeepInput = true -- keep input when nui is focused (meaning you can walk around etc)
Config.SyncFlashlight = true -- should flashlight be synced between players?
Config.AutoDeleteNotifications = true -- true = delete 1 week old notifications, false = keep all notifications. you can also set to a number (in hours) to delete after that time
Config.FadeOutsideTablet = true -- should the tablet fade when the cursor is outside of the tablet?
Config.DispatchCompatibility = true -- add dispatch exports & events from other dispatch/mdt scripts? (note: this may not work with all scripts, we strongly recommend using the lb-tablet exports directly)
Config.EvidenceStash = true -- allow players to store evidence for cases in the tablet?
Config.ShowDispatchWithoutItem = true -- show dispatch even if the player doesn't have a tablet item?

Config.RealTime = true -- if true, the time will use real life time depending on where the user lives, if false, the time will be the ingame time.
Config.CustomTime = false -- NOTE: set Config.RealTime to false if using this. you can set this to a function that returns custom time, as a table: { hour = 0-23, minute = 0-59 }

Config.FrameColor = "#39334d" -- This is the color of the tablet frame. Default (#39334d) is purple.
Config.AllowFrameColorChange = true -- Allow players to change the color of their tablet frame?

Config.AllowExternal = { -- allow people to upload external images? (note: this means they can upload nsfw/gore etc)
    Gallery = true,
    Mail = false,
    Other = false,
}


    Config.Locations = {
        {
            position = vector2(-550.594299, -191.762741),
            name = "Gouvernement",
            description = "Rockford Hills",
            icon = "https://i.ibb.co/zVqPS32/bank.png",
        },
        {
            position = vector2(101.104019, -393.197021),
            name = "LSPD",
            description = "Rockford Hills",
            icon = "https://i.ibb.co/WFt1QGz/police.png",
        },
        {
            position = vector2(1732.133911, 3880.888184),
            name = "BCSO",
            description = "Sandy Shores",
            icon = "https://i.ibb.co/pXzT5YF/sheriff-1-1.png",
        },
        {
            position = vector2(304.2, -587.0),
            name = "EMS",
            description = "Pillbox Hill",
            icon = "https://i.ibb.co/xFhVXqr/paramedic-2.png",
        },
        {
            position = vector2(-313.546417, -818.716125),
            name = "Concessionnaire Auto",
            description = "Pillbox Hill",
            icon = "https://i.ibb.co/8Pk3BtV/car.png",
        },
        {
            position = vector2(1178.426147, 2646.358154),
            name = "Concessionnaire Moto",
            description = "Route 68",
            icon = "https://i.ibb.co/mThkxLW/motorcycle.png",
        },
        {
            position = vector2(-814.587158, -1347.486694),
            name = "Concessionnaire Bateau",
            description = "La Puerta",
            icon = "https://i.ibb.co/cFXdbcR/boat.png",
        },
        {
            position = vector2(-1816.674072, -1193.577881),
            name = "Pearl's",
            description = "Del Perro Pier",
            icon = "https://i.ibb.co/ckVtwdG/rudder.png",
        },
        {
            position = vector2(1234.757446, -354.941681),
            name = "Horny's",
            description = "Mirror Park",
            icon = "https://i.ibb.co/DYprHXY/bull.png",
        },
        {
            position = vector2(1587.137939, 6455.823730),
            name = "Pop's Diner",
            description = "Senora Freeway",
            icon = "https://i.ibb.co/bRjdv1M/hot-dog.png",
        },
        {
            position = vector2(-351.902649, -125.837448),
            name = "Ls Custom's",
            description = "Burton",
            icon = "https://i.ibb.co/ZS9g0wN/service3.png",
        },
        {
            position = vector2(-211.878693, -1313.012573),
            name = "Benny's",
            description = "Strawberry",
            icon = "https://i.ibb.co/JzHRJQZ/service.png",
        },
        {
            position = vector2(1222.460449, 2722.222656),
            name = "Larry's",
            description = "Route 68",
            icon = "https://i.ibb.co/mNL6djh/service.png",
        },
        {
            position = vector2(906.788391, -160.401123),
            name = "Taxi",
            description = "East Vinewood",
            icon = "https://i.ibb.co/8DYyDkw/taxi.png",
        },
        {
            position = vector2(-199.101562, -574.736450),
            name = "Agence Immobilière",
            description = "Pillbox Hill",
            icon = "https://i.ibb.co/TRMkv7s/groom.png",
        },
        {
            position = vector2(129.123306, -1298.974854),
            name = "Unicorn",
            description = "Strawberry",
            icon = "https://i.ibb.co/0BKJ9wR/latest.png",
        },
        {
            position = vector2(-827.162781, -694.794983),
            name = "Wiwang",
            description = "Little Seoul",
            icon = "https://i.ibb.co/QPJStQs/disco-ball.png",
        },
        {
            position = vector2(-3021.792725, 83.500595),
            name = "Pacific Bluff",
            description = "Del Perro",
            icon = "https://i.ibb.co/NSg6D7X/blue-lagoon.png",
        },
        {
            position = vector2(-711.620911, -915.784851),
            name = "LTD",
            description = "Little Seoul",
            icon = "https://i.ibb.co/JRDFQ6W/ltd.png",
        },
        {
            position = vector2(-53.263618, -1756.932983),
            name = "LTD",
            description = "Grove Street",
            icon = "https://i.ibb.co/JRDFQ6W/ltd.png",
        },
        {
            position = vector2(29.186953, -1348.117432),
            name = "LTD",
            description = "Forum Drive",
            icon = "https://i.ibb.co/JRDFQ6W/ltd.png",
        },
        {
            position = vector2(163.094803, -6637.548340),
            name = "LTD",
            description = "Paleto Bay",
            icon = "https://i.ibb.co/JRDFQ6W/ltd.png",
        },
        {
            position = vector2(-598.305054, -930.166809),
            name = "Weazel News",
            description = "Little Seoul",
            icon = "https://i.ibb.co/DgPrLFn/news.png",
        },
    }


Config.Locales = { -- If your desired language isn't here, you may contribute at https://github.com/lbphone/lb-tablet-locales
    {
        locale = "en",
        name = "English"
    },
    {
        locale = 'fr',
        name = 'Français'
    },
    {
        locale = 'sv',
        name = 'Svenska'
    },
    {
        locale = "de",
        name = "Deutsch"
    },
    {
        locale = "es",
        name = "Español"
    },
    {
        locale = "pt-br",
        name = "Português (Brasil)"
    },
    {
        locale = "ba",
        name = "Bosanski"
    },
    {
        locale = "nl",
        name = "Nederlands"
    },
    {
        locale = "ar",
        name = "العربية"
    }
}

Config.CustomApps = {}

--[[ SERVICES APP OPTIONS ]] --
Config.Services = {}
Config.Services.MessageOffline = true
Config.Services.SeeEmployees = "everyone"
Config.Services.DeleteConversations = true -- allow employees to delete conversations?

Config.Services.Management = {
    Enabled = true, -- if true, employees & the boss can manage the companyW
    Duty = true, -- if true, employees can go on/off duty

    -- Boss actions
    Deposit = true, -- if true, the boss can deposit money into the company
    Withdraw = true, -- if true, the boss can withdraw money from the company
    Hire = true, -- if true, the boss can hire employees
    Fire = true, -- if true, the boss can fire employees
    Promote = true, -- if true, the boss can promote employees
}

Config.Services.Companies = { -- the companies that are shown in the app
{
    job = "gouvernement",
    name = "Gouvernement",
    icon = "https://i.ibb.co/zVqPS32/bank.png",
    canMessage = true,
    location = {
        name = "Rockford Hills",
        coords = {
            x = -550.594299,
            y = -191.762741,
        }
    }
},
{
    job = "police",
    name = "LSPD",
    icon = "https://i.ibb.co/WFt1QGz/police.png",
    canMessage = true,
    location = {
        name = "Rockford Hills",
        coords = {
            x = 101.104019,
            y = -393.197021,
        }
    }
},
{
    job = "saspn",
    name = "BCSO",
    icon = "https://i.ibb.co/pXzT5YF/sheriff-1-1.png",
    canMessage = true,
    location = {
        name = "Sandy Shores",
        coords = {
            x = 1732.133911,
            y = 3880.888184,
        }
    }
},
{
    job = "ambulance",
    name = "EMS",
    icon = "https://i.ibb.co/xFhVXqr/paramedic-2.png",
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
    location = {
        name = "La Puerta",
        coords = {
            x = -814.587158,
            y = -1347.486694,
        }
    }
},
{
    job = "pearls",
    name = "Pearl's",
    icon = "https://i.ibb.co/ckVtwdG/rudder.png",
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    name = "LS Custom's",
    icon = "https://i.ibb.co/ZS9g0wN/service3.png",
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
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
    canMessage = true,
    location = {
        name = "Little Seoul",
        coords = {
            x = -598.305054,
            y = -930.166809,
        }
    }
}
}

--[[ POLICE APP OPTIONS ]] --
Config.Police = {}

Config.Police.DutyBlips = true -- show blips for police officers on duty?

Config.Police.Callsign = {}
Config.Police.Callsign.AutoGenerate = true -- should a callsign be automatically generated when a police profile is created? please note that if you enable this after profiles have been created, the callsigns will not be updated
Config.Police.Callsign.Format = "11-1111" --[[
    Callsign format:
        * 1: number 0-9
        * A: uppercase letter A-Z
        * a: lowercase letter a-z
        * ^: escape character
]]
Config.Police.Callsign.RequireTemplate = true -- Require users to follow the format of the callsign template?
Config.Police.Callsign.AllowChange = true

Config.Police.Jail = {}
Config.Police.Jail.Refresh = true -- should jail_time be updated by the tablet script? Set to false if you've fully configured your jail script to work with lb-tablet
Config.Police.Jail.Interval = 60 -- how often (in seconds) to update the jail time
Config.Police.Jail.CanUnjail = "auto" -- auto: true if supported jail script, otherwise false

Config.Police.Notifications = {
    NewBulletin = true,
    NewCase = true,
    NewReport = true,
    NewWarrant = true,
    NewChat = true,
    ChatMessage = true,
}

--[[
    Here you can set the offence classes & their color. Please note that you need to set the name of the class in the locales, e.g. in config/locales/en.json
    Available colors:
        grey    - #8e8e93
        blue    - #0a84ff
        green   - #32d74b
        red     - #ff3b30
        orange  - #ff9d0a
        yellow  - #cca250
        pink    - #ff3b30
        purple  - #af52de
        brown   - #a2845e
        navy    - #0a84ff
        cyan    - 5ac8fa
--]]

Config.Police.OffenceClasses = {
    infraction = "green",
    misdemeanor = "orange",
    felony = "red"
}

Config.Police.AdminPermissions = {
    logs = {
        view = true
    },
    bulletin = {
        pin = true,
        delete = true
    },
    case = {
        delete = true
    },
    warrant = {
        delete = true
    },
    report = {
        delete = true
    }
}

Config.Police.Permissions = {
    --[[
    ["job"] = {
        permission = {
            create = minimumGrade,
            edit = minimumGrade
        }
    }
    --]]

    ["police"] = {
        tag = {
            create = 3,
            delete = 3,
        },
        offence = {
            create = 3,
            edit = 3,
            delete = 3,
            view = 0
        },
        license = {
            revoke = 3,
            add = 3,
            view = 0
        },
        profile = {
            edit = 3,
            view = 0
        },
        vehicle = {
            edit = 3,
            view = 0
        },
        property = {
            edit = 3,
        },
        weapon = {
            edit = 3,
        },
        report = {
            create = 3,
            edit = 3,
            delete = 3,
            view = 0
        },
        warrant = {
            create = 3,
            edit = 3,
            delete = 3,
            view = 0
        },
        case = {
            create = 3,
            edit = 3,
            delete = 3,
            view = 0
        },
        bulletin = {
            create = 3,
            pin = 3,
            delete = 3, -- you are always able to delete your own bulletins
            view = 0
        },
        chat = {
            -- The creator is always able to edit, kick and invite
            create = 3,
            edit = 3,
            kick = 3,
            invite = 3,
            view = 0
        },
        logs = {
            view = 3,
        },
        jail = {
            create = 3,
            edit = 3,
            unjail = 3,
            view = 0
        },
        stash = {
            view = 2,
        }
    },
}

Config.Police.Header = {
    Logo = "./assets/img/icons/police/logo.png",
    Title = "Los Santos Police Department",
    Subtitle = "Mobile Police Terminal"
}

Config.Police.ReportTypes = {
    "Assault",
    "Robbery",
    "Burglary",
    "Theft",
    "Fraud",
    "Homicide",
    "Kidnapping",
    "Arson",
    "Vandalism",
    "Drug Offense",
    "Traffic Violation",
    "Domestic Violence",
    "Cybercrime",
    "Weapons Violation",
    "Public Disturbance",
    "Trespassing",
    "Harassment",
    "Missing Person",
    "Extortion",
    "Identity Theft",
    "Interrogation",
    "Other"
}

Config.Police.WarrantTypes = {
    "Arrest Warrant",
    "Search Warrant",
    "Bench Warrant",
    "Extradition Warrant",
    "Probation Violation Warrant",
    "Material Witness Warrant",
    "Execution Warrant",
    "Parole Violation Warrant"
}

Config.Police.Templates = {
    Report = "Report template\n\nDate:\nReported By: (Name & Callsign / Badge number)\n\nIncident Details:\nEvidence Collected:\nActions Taken:\n\nAdditional Notes:",
    Case = "Case template\n\nDate Opened:\nFiled by: (Name & Callsign / Badge number)\n\nIncident Details:\nKey Evidence:\nInvestigation Progress:\n\nAdditional Notes:",
    Warrant = "Warrant template\n\nDate Issued:\nRequested By: (Name & Callsign / Badge number)\nReason:\nLocation / Target:\nExecution Details:\n\nAdditional Notes:"
}

--[[ AMBULANCE APP OPTIONS ]] --
Config.Ambulance = {}

Config.Ambulance.DutyBlips = true -- show blips for ambulance/doctors that are on duty?

Config.Ambulance.Header = {
    Logo = "./assets/img/icons/ambulance/logo.png",
    Title = " Santos Medical Services",
    Subtitle = "Mobile Database Terminal"
}

Config.Ambulance.Callsign = {}
Config.Ambulance.Callsign.AutoGenerate = true -- should a callsign be automatically generated when a Ambulance profile is created? please note that if you enable this after profiles have been created, the callsigns will not be updated
Config.Ambulance.Callsign.Format = "11-1111" --[[
    Callsign format:
        * 1: number 0-9
        * A: uppercase letter A-Z
        * a: lowercase letter a-z
        * ^: escape character
]]
Config.Ambulance.Callsign.RequireTemplate = true -- Require users to follow the format of the callsign template?
Config.Ambulance.Callsign.AllowChange = true

Config.Ambulance.Notifications = {
    NewBulletin = true,
    NewChat = true,
    NewReport = true,
    ChatMessage = true,
}

Config.Ambulance.ReportTypes = {
    "Injury",
    "Illness",
    "Vehicle Accident",
    "Overdose",
    "Cardiac Arrest",
    "Stroke",
    "Respiratory Distress",
    "Burn Injury",
    "Fall Injury",
    "Drowning",
    "Poisoning",
    "Seizure",
    "Trauma",
    "Allergic Reaction",
    "Shock",
    "Heatstroke",
    "Hypothermia",
    "Labor and Delivery",
    "Mental Health Crisis",
    "Other"
}

--[[
    Here you can set the severities & their color. Please note that you need to set the name of the severity in the locales, e.g. in config/locales/en.json
    Available colors:
        grey    - #8e8e93
        blue    - #0a84ff
        green   - #32d74b
        red     - #ff3b30
        orange  - #ff9d0a
        yellow  - #cca250
        pink    - #ff3b30
        purple  - #af52de
        brown   - #a2845e
        navy    - #0a84ff
        cyan    - 5ac8fa
--]]

Config.Ambulance.Severities = {
    minor = "green",
    moderate = "orange",
    severe = "red",
    critical = "red"
}

Config.Ambulance.AdminPermissions = {
    report = {
        delete = true
    },
    tag = {
        delete = true
    },
    chat = {
        kick = true
    },
    bulletin = {
        pin = true,
        delete = true
    },
    condition = {
        create = true,
        edit = true,
        delete = true
    },
    logs = {
        view = true
    },
}

Config.Ambulance.Permissions = {
    ["ambulance"] = {
        profile = {
            edit = 3,
        },
        report = {
            create = 3,
            edit = 3,
            delete = 3
        },
        tag = {
            create = 3,
            delete = 3
        },
        chat = {
            create = 3,
            edit = 3,
            kick = 3,
            invite = 3
        },
        bulletin = {
            create = 3,
            pin = 3,
            delete = 3
        },
        condition = {
            create = 3,
            edit = 3,
            delete = 3
        },
        logs = {
            view = 3
        }
    },
}

--[[ Browser App Options ]] --
Config.Browser = {}
Config.Browser.DefaultBookmarks = {
    {
        title = "LB",
        url = "https://lbscripts.com/",
        icon = "https://lbscripts.com/assets/favicon.ico"
    }
}

--[[ KEY BINDINGS ]] --
Config.KeyBinds = {  -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Open = {
        bind = "EQUALS",
        description = "Open your tablet"
    },
    Focus = {
        bind = "LMENU", -- ALT
        description = "Toggle cursor on your tablet"
    },
    Opacity = {
        bind = "LMENU",
        description = "Toggle tablet transparency"
    },

    -- Dispatch
    NotificationUp = {
        bind = "UP",
        description = "Go up in the dispatch list"
    },
    NotificationDown = {
        bind = "DOWN",
        description = "Go down in the dispatch list"
    },
    NotificationDismiss = {
        bind = "O",
        description = "Dismiss the current dispatch"
    },
    NotificationView = {
        bind = "G",
        description = "View the current dispatch"
    },
    NotificationRespond = {
        bind = "Z",
        description = "Respond to the current dispatch"
    },
    NotificationExpand = {
        bind = "J",
        description = "Expand to the current dispatch"
    },

    -- Camera
    FlipCamera = {
        bind = "UP",
        description = "Flip camera"
    },
    TakePhoto = {
        bind = "RETURN",
        description = "Take a photo/video"
    },
    ToggleFlash = {
        bind = "E",
        description = "Toggle flash"
    },
    LeftMode = {
        bind = "LEFT",
        description = "Change mode"
    },
    RightMode = {
        bind = "RIGHT",
        description = "Change mode"
    },
    RollLeft = {
        bind = "Z",
        description = "Roll camera to the left"
    },
    RollRight = {
        bind = "C",
        description = "Roll camera to the right"
    },
    FreezeCamera = {
        bind = "X",
        description = "Freeze camera"
    },
    ToggleCameraTip = {
        bind = "H",
        description = "Toggle camera tip"
    }
}

-- ICE Servers for WebRTC (ig live, live video). If you don't know what you're doing, leave this as it is.
-- see https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/RTCPeerConnection
-- Config.RTCConfig = {
--     iceServers = {
--         { urls = "stun:stun.l.google.com:19302" },
--     }
-- }

--[[ PHOTO / VIDEO OPTIONS ]] --
Config.Camera = {}
Config.Camera.Roll = true -- allow rolling the camera to the left & right?
Config.Camera.AllowRunning = true
Config.Camera.MaxFOV = 60.0 -- higher = zoomed out (ultrawide)
Config.Camera.MinFOV = 10.0 -- lower = zoomed in (telephoto)
Config.Camera.MaxLookUp = 80.0
Config.Camera.MaxLookDown = -80.0

Config.Camera.Vehicle = {}
Config.Camera.Vehicle.Zoom = true -- allow zooming in vehicles?
Config.Camera.Vehicle.MaxFOV = 80.0
Config.Camera.Vehicle.MinFOV = 10.0
Config.Camera.Vehicle.MaxLookUp = 50.0
Config.Camera.Vehicle.MaxLookDown = -30.0
Config.Camera.Vehicle.MaxLeftRight = 120.0
Config.Camera.Vehicle.MinLeftRight = -120.0

Config.Camera.Selfie = {}
Config.Camera.Selfie.Offset = vector3(0.04, 0.48, 0.42)
Config.Camera.Selfie.Rotation = vector3(40.0, 0.0, -180.0)
Config.Camera.Selfie.MaxFov = 90.0
Config.Camera.Selfie.MinFov = 50.0

Config.Camera.Freeze = {}
Config.Camera.Freeze.Enabled = true -- allow players to freeze the camera when taking photos? (this will make it so they can take photos in 3rd person)
Config.Camera.Freeze.MaxDistance = 10.0 -- max distance the camera can be from the player when frozen
Config.Camera.Freeze.MaxTime = 60 -- max time the camera can be frozen for (in seconds)

-- Set your api keys in lb-tablet/server/apiKeys.lua
Config.UploadMethod = {}
-- You can edit the upload methods in lb-tablet/config/upload.lua
-- We recommend Fivemanage, https://fivemanage.com
-- Use code LBPHONE10 for 10% off on Fivemanage
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
-- If you want to host uploads yourself, you can use LBUpload: https://github.com/lbphone/lb-upload
Config.UploadMethod.Video = "Fivemanage" -- "Fivemanage" or "LBUpload" or "Imgur"
Config.UploadMethod.Image = "Fivemanage" -- "Fivemanage" or "LBUpload" or "Imgur"
Config.UploadMethod.Audio = "Fivemanage" -- "Fivemanage" or "LBUpload"

Config.Video = {}
Config.Video.Bitrate = 400 -- video bitrate (kbps), increase to improve quality, at the cost of file size
Config.Video.FrameRate = 24 -- video framerate (fps), 24 fps is a good mix between quality and file size used in most movies
Config.Video.MaxSize = 25 -- max video size (MB)
Config.Video.MaxDuration = 60 -- max video duration (seconds)

Config.Image = {}
Config.Image.Mime = "image/webp"
Config.Image.Quality = 0.95

if Config.UploadMethod.Image == "Imgur" then
    Config.Image.Mime = "image/png"
    Config.Image.Quality = 1.0
end
