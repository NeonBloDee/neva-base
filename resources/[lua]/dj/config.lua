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
        ['DJ_interact'] = 'Appuyer sur ~g~E~s~, pour accéder au DJ',
        ['title_does_not_exist'] = "~r~Ce titre n'existe pas !",
    }
}

Config.Locale = 'fr'

Config.useESX = true -- can not be disabled without changing the callbacks
Config.enableCommand = false

Config.enableMarker = true -- purple marker at the DJ stations

Config.DJPositions = {
    {
        name = 'bar_wiwang',
        pos = vector3(-819.069580, -687.296326, 123.418320),
        requiredJob = "bar_wiwang", 
        range = 45.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },

    {
        name = 'bar_unicorn',
        pos = vector3(140.055099, -1343.687744, 20.119312),
        requiredJob = "bar_unicorn", 
        range = 45.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    }

}