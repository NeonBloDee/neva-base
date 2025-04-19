Config = {
    ModelSaveType = "modelname", -- number (hash key) or modelname
    UseBackgroundBlur = true,
    UseDefaultClothImages = {
        Skin = true,
        Hair = true,
        Makeup = true,
        Clothing = true,
        Accessories = true,
        Body = true
    },
    ShowAllPeds = true, -- If it is false, you can only see female characters if your character is female and only male characters if your character is male.
    SetCoordsAfterFinalize = {
        Enable = false,
        Coords = vector4(-1038.1, -2738.23, 20.17, 325.03)
    },
    TeleportWhenCreatingChar = {
        Enable = false,
        Coords = vector4(-1038.1, -2738.23, 20.17, 325.03)
    },
    CharacterFinalized = function()
        -- Write something here
    end,
    ClothStoreOpened = function()
        -- Write something here
    end,
    ClothStoreClosed = function()
        -- Write something here
    end,
    GiveClothingMenu = {
        Enable = true,
        Command = "giveclothingmenu",
        RestrictedCommand = "giverestrictedclothingmenu",
        Description = "Give advanced clothing menu",
        RestrictedDescription = "Give restricted clothing menu",
        Group = "fondateur"
    },
    CharacterCreationMenuCategories = {
        Normal = {
            Peds = false,
            Face = true,
            FaceFeatures = true,
            Skin = true,
            Hair = true,
            Makeup = true,
            Clothing = true,
            Accessories = true
        },
        Restricted = {
            Peds = false,
            Face = false,
            FaceFeatures = false,
            Skin = true,
            Hair = true,
            Makeup = false,
            Clothing = true,
            Accessories = true
        }
    },
    CashAsItem = { -- For those who use cash as an item
        Enable = false,
        Name = "money"
    },
    Stores = {
        [1] = {shopType = 'clothing', coords = vector3(1693.32, 4823.48, 41.06)},
        [2] = {shopType = 'clothing', coords = vector3(-712.215881, -155.352982, 37.4151268)},
        [3] = {shopType = 'clothing', coords = vector3(-1192.94495, -772.688965, 17.3255997)},
        [4] = {shopType = 'clothing', coords = vector3(425.236, -806.008, 28.491)},
        [5] = {shopType = 'clothing', coords = vector3(-162.658, -303.397, 38.733)},
        [6] = {shopType = 'clothing', coords = vector3(75.950, -1392.891, 28.376)},
        [7] = {shopType = 'clothing', coords = vector3(-822.194, -1074.134, 10.328)},
        [8] = {shopType = 'clothing', coords = vector3(-1450.711, -236.83, 48.809)},
        [9] = {shopType = 'clothing', coords = vector3(4.254, 6512.813, 30.877)},
        [10] = {shopType = 'clothing', coords = vector3(615.180, 2762.933, 41.088)},
        [11] = {shopType = 'clothing', coords = vector3(1196.785, 2709.558, 37.222)},
        [12] = {shopType = 'clothing', coords = vector3(-3171.453, 1043.857, 19.863)},
        [13] = {shopType = 'clothing', coords = vector3(-1100.959, 2710.211, 18.107)},
        [15] = {shopType = 'clothing', coords = vector3(121.76, -224.6, 53.56)},
        [16] = {shopType = 'barber', coords = vector3(-814.3, -183.8, 36.6)},
        [17] = {shopType = 'barber', coords = vector3(136.8, -1708.4, 28.3)},
        [18] = {shopType = 'barber', coords = vector3(-1282.6, -1116.8, 6.0)},
        [19] = {shopType = 'barber', coords = vector3(1931.5, 3729.7, 31.8)},
        [20] = {shopType = 'barber', coords = vector3(1212.8, -472.9, 65.2)},
        [21] = {shopType = 'barber', coords = vector3(-32.9, -152.3, 56.1)},
        [22] = {shopType = 'barber', coords = vector3(-278.1, 6228.5, 30.7)},
        [23] = {shopType = 'tattoo', coords = vector3(1322.6, -1651.9, 51.2)},
        [24] = {shopType = 'tattoo', coords = vector3(-1153.6, -1425.6, 4.9)},
        [25] = {shopType = 'tattoo', coords = vector3(322.1, 180.4, 103.5)},
        [26] = {shopType = 'tattoo', coords = vector3(-3170.0, 1075.0, 20.8)},
        [27] = {shopType = 'tattoo', coords = vector3(1864.6, 3747.7, 33.0)},
        [28] = {shopType = 'tattoo', coords = vector3(-293.7, 6200.0, 31.4)}
    },
    Interaction = {
        TextUI = {
            Enable = true,
            Show = function(label)
                DrawMarker(2, label, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 100, false, true, 2, false, nil, nil, false)
            end,
            Hide = function()
                -- No need for hide function with DrawMarker
            end
        },
        Target = {
            Enable = false,
            Distance = 4.0,
            Zone = 2.5,
            Icon = "fa-solid fa-shirt"
        }
    },
    AllowedModels = {"mp_m_freemode_01", "mp_f_freemode_01"},
    DefaultClothingVaritaions = {
        ["Hat"] = {
            ["male"] = -1,
            ["female"] = -1
        },
        ["Masks"] = {
            ["male"] = -1,
            ["female"] = -1
        },
        ["Glasses"] = {
            ["male"] = -1,
            ["female"] = -1
        },
        ["Jacket"] = {
            ["male"] = 15,
            ["female"] = 15
        },
        ["Bag"] = {
            ["male"] = -1,
            ["female"] = -1
        },
        ["Hairs"] = {
            ["male"] = 0,
            ["female"] = 0
        },
        ["Shoes"] = {
            ["male"] = 34,
            ["female"] = 34
        },
        ["Pants"] = {
            ["male"] = 14,
            ["female"] = 14
        }
    },
    ClothPriceCurrency = "$",
    ClothPrices = {
        ["Jacket"] = {
            Default = 150,
            Customs = {
                [255] = 500,
                [230] = 500
            }
        },
        ["Hat"] = {
            Default = 75
        },
        ["Hairs"] = {
            Default = 95
        },
        ["FacialHairs"] = {
            Default = 95
        },
        ["ChestHair"] = {
            Default = 95
        },
        ["Makeup"] = {
            Default = 75
        },
        ["Blush"] = {
            Default = 75
        },
        ["Lipstick"] = {
            Default = 75
        },
        ["Eyebrows"] = {
            Default = 75
        },
        ["Pants"] = {
            Default = 130
        },
        ["Masks"] = {
            Default = 90
        },
        ["Earrings"] = {
            Default = 50
        },
        ["Glasses"] = {
            Default = 65
        },
        ["Decals"] = {
            Default = 45
        },
        ["Undershirt"] = {
            Default = 140
        },
        ["Watches"] = {
            Default = 100
        },
        ["Bags"] = {
            Default = 90
        },
        ["Scarfs/Necklaces"] = { -- Scarfs & Necklaces
            Default = 80
        },
        ["Arms/Gloves"] = { -- Arms & Gloves
            Default = 70
        },
        ["Shoes"] = {
            Default = 135
        },
        ["Bracelets"] = {
            Default = 80
        },
        ["Vest"] = {
            Default = 160
        }
    },
    ShowHUD = function()
        exports['hud']:ToggleVisible(true)
        DisplayRadar(true)
    end,
    HideHUD = function()
        exports['hud']:ToggleVisible(false)
        DisplayRadar(false)
    end
}