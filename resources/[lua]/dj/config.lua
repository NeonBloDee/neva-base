Config = {}
Translation = {}

Translation = {
    ['de'] = {
        ['DJ_interact'] = 'Drücke ~g~E~s~, um auf das DJ Pult zuzugreifen',
        ['title_does_not_exist'] = '~r~Dieser Titel existiert nicht!',
    },

    ['en'] = {
        ['DJ_interact'] = 'Press ~g~E~s~, to access the DJ desk',
        ['title_does_not_exist'] = '~r~This title does not exist!',
    },

    ['fr'] = {
        ['DJ_interact'] = 'Appuyer sur ~g~E~s~ pour accéder au DJ',
        ['title_does_not_exist'] = "~r~Ce titre n'existe pas !",
    }
}

Config.Locale = 'fr'

Config.useESX = true -- can not be disabled without changing the callbacks
Config.enableCommand = false

Config.enableMarker = true

Config.DJPositions = {
    {
        name = 'boite_wiwang',
        pos = vector3(-822.62072753906, -688.55346679688, 123.41834259033),
        requiredJob = "boite_wiwang", 
        range = 45.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },

    {
        name = 'boite_unicorn',
        pos = vector3(120.56656646729, -1280.8189697266, 29.48045539856),
        requiredJob = "boite_unicorn", 
        range = 45.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },

    {
        name = 'boite_pacific',
        pos = vector3(-3010.0244140625, 59.581554412842, 12.599262237549),
        requiredJob = "boite_pacific", 
        range = 45.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },

    {
        name = 'restau_burgershot',
        pos = vector3(-1199.0908203125, -892.54705810547, 13.886171340942),
        requiredJob = "restau_burgershot", 
        range = 45.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },

    {
        name = 'restau_pearls',
        pos = vector3(-1840.7960205078, -1186.7667236328, 19.962509155273),
        requiredJob = "restau_pearls", 
        range = 45.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },

    {
        name = 'restau_catcafe',
        pos = vector3(-587.84851074219, -1054.6497802734, 22.344181060791),
        requiredJob = "restau_catcafe", 
        range = 45.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },

    {
        name = 'restau_pops',
        pos = vector3(1596.2065429688, 6454.3315429688, 26.015058517456),
        requiredJob = "restau_pops", 
        range = 45.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    }
}