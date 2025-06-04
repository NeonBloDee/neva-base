Boutique = {}

Boutique = {

    Framework = "esx", -- "esx" = old-esx (with trigger) / "newEsx" = new esx (export) / "standalone" = standalone
    Extended_Name = "frwk",
    getSharedObject = "esx:getSharedObject",
    Mysql = "oxmysql", -- mysql-async / ghmattimysql / oxmysql (don't forget to change in the fxmanifest)


    Name = "N E V A",
 
    -- RegisterKeyMap
    CmdName = "boutique",
    DescKeyParameter = "Boutique",
    defaultMapper = "keyboard",
    KeyOpen = "F1",
    --

    GiveCmdName = "giveidboutique",

    NewArrivalCredit = 2000, -- Définir le nombre de points boutique à la première connexion du joueur sur votre serveur

    TestVeh = {
        PositionStart = vector4(-899.62, -3298.74, 13.94, 58.0),
        Timer = 30,
        NotificationsStart = "~o~Vous avez 30 secondes pour tester le véhicule.",
        Notifications = {
            {time = 15, message = "~o~Il vous reste 15 secondes."},
            {time = 10, message = "~o~Il vous reste 10 secondes."},
            {time = 5, message = "~o~Il vous reste 5 secondes."},
            {time = 0, message = "~r~Vous avez terminé la période d'essai."},
        },
    },

    -- Change this to your preferred format insert plate. L = letters, N = numbers. 
    -- Example : (LLLLNNNN = AAAA1234)
    -- Example : (NNNNLLLL = 0000AAAA) 
    -- Example : (NNLL = 00AA) 
    -- look at the format of your plates in your owned_vehicles table
    PlateFormat = "LLLLNNNN",  
    TableNameVehicle = "owned_vehicles", -- votre table SQL qui stock véhicule garage

    Notifications = {
        NoCoins = "~r~Vous n'avez pas assez de crédits",
        BuyVeh = "~g~Vous avez reçu un nouveau véhicule :",
        BuyWeapon = "~g~Vous avez reçu une nouvelle arme :",
        BuyMoney = "~g~Vous avez reçu :",
        GiveCredits = {
            RefuseIfYour = "~r~Vous ne pouvez pas vous transférer de crédits sur votre propre code boutique.",
            YouHaveReceive = "Vous avez reçu",
            YouHaveReceive2 = "crédit(s) de la part de",
            TransferGood = "La transaction a été effectuée.",
            TransferProblem = "La transaction n'a pas pu être effectuée.",
        }
    },

    ArmeItem = true,

    addAccountMoney = true, -- Si vous préférez utiliser un addaccountmoney que un addMoney.
    AccountName = "bank", -- Nom de l'account ou faut ajouté l'argent
}

Boutique.Vehicles = {
    { label = "Mule",          model = "mule5",        img = "vehicles/mule5",        coins = 1000, speed = 110, seat = 2},
    { label = "16 Charger",    model = "16charger",    img = "vehicles/16charger",    coins = 2000, speed = 180, seat = 4 },
    { label = "16 Top Cargle", model = "16topcargle",  img = "vehicles/16topcargle",  coins = 2000, speed = 180, seat = 4 },
    { label = "18 Performante",model = "18performante",img = "vehicles/18performante",coins = 2000, speed = 180, seat = 4 },
    { label = "18 RS7",        model = "18rs7",        img = "vehicles/18rs7",        coins = 2000, speed = 180, seat = 4 },
    { label = "20 XB7",        model = "20xb7",        img = "vehicles/20xb7",        coins = 2000, speed = 180, seat = 4 },
    { label = "2019 M5",       model = "2019m5",       img = "vehicles/2019m5",       coins = 2000, speed = 180, seat = 4 },
    { label = "2019 Tundra C", model = "2019tundrac",  img = "vehicles/2019tundrac",  coins = 2000, speed = 180, seat = 4 },
    { label = "2020 CLA 45 S", model = "2020CLA45s",   img = "vehicles/2020CLA45s",   coins = 2000, speed = 180, seat = 4 },
    { label = "A80",           model = "a80",          img = "vehicles/a80",          coins = 2000, speed = 180, seat = 4 },
}
Boutique.Weapons = {
    {label = "Ak-47", name = "assaultrifle", img = "weapons/weapon_assaultrifle", coins = 4500},
    {label = "Arme de défense personnelle", name = "combatpdw", img = "weapons/weapon_combatpdw", coins = 3750},
    {label = "Glock-17", name = "g17gen5", img = "weapons/weapon_g17gen5", coins = 2100},
    {label = "Berreta", name = "pistol", img = "weapons/weapon_pistol", coins = 1750},
    -- {label = "Katana", name = "katana", img = "weapons/weapon_katana", coins = 750},
}

Boutique.Money = {
    {label = "12.500$", count = 12500, img = "money/money1", coins = 1000},
    {label = "25.000$", count = 25000, img = "money/money2", coins = 1950},
    {label = "50.000$", count = 50000, img = "money/money3", coins = 2800},
    {label = "250.000$", count = 250000, img = "money/money5", coins = 13000},
    {label = "500.000$", count = 500000, img = "money/money4", coins = 25000},
    {label = "Création d'entreprise (Ticket discord)", count = 1, img = "packentreprise", coins = 9500},
    {label = "Importation d'un véhicule (Ticket discord)", count = 3, img = "packvehimport", coins = 20000},
    {label = "Achat d'une Villa (Ticket discord)", count = 4, img = "packvilla", coins = 12000},
}

Boutique.Tebex = {
    {label = "500 Coins", img = "coins/1", price = 6, link = "https://discord.gg/"},
    {label = "1.000 Coins", img = "coins/2", price = 12, link = "https://discord.gg/"},
    {label = "1.500 Coins", img = "coins/3", price = 18, link = "https://discord.gg/"},
    {label = "2.000 Coins", img = "coins/4", price = 24, link = "https://discord.gg/"},
    {label = "3.500 (+200) Coins", img = "coins/5", price = 42, link = "https://discord.gg/"},
    {label = "5.000 (+500) Coins", img = "coins/6", price = 60, link = "https://discord.gg/"},
    {label = "7.500 (+700) Coins", img = "coins/7", price = 90, link = "https://discord.gg/"},
    {label = "10.000 (+2000) Coins", img = "coins/8", price = 120, link = "https://discord.gg/"},
    {label = "20.000 (+6000) Coins", img = "coins/9", price = 240, link = "https://discord.gg/"},
}


-------------- Type of loot --------------

-- "Vehicle" -- 
-- "Weapon" --
-- "Coin" --
-- "Money" --
-- "Item" --

-- Les gains avec unique = true sont gagnable qu'une seul fois et caisse remboursé si le joueur re tombe dessus.

Boutique.Cases = {

    {
        label = "Caisse Argent", 
        coins = 1000, 
        img = "lootbox/silver", 
        gains = {
            ----COMMUN----
            {label = "BRZ 12 Varis", item = "brz13varis", img = "vehicles/brz13varis", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 250, unique = true},
            {label = "50.000$", item = 50000, img = "money/money1", type = "Money", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 0, unique = false},
            {label = "BM G07", item = "bmwg07", img = "vehicles/bmwg07", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 250, unique = true},
            
            ----RARE----
            {label = "BM e39", item = "bmwe39", img = "vehicles/bmwe39", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 500, unique = true},
            {label = "RS8", item = "audirs8", img = "vehicles/audirs8", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 500, unique = true},
            {label = "Alpina b7", item = "alpinab7", img = "vehicles/alpinab7", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 500, unique = true},
            {label = "Hâche", item = "FIREAXE", img = "weapons/weapon_fireaxe", type = "Weapon", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 500, unique = true},
            
            ----LÉGENDAIRE----
            {label = "150.000$", item = 150000, img = "money/money2", type = "Money", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 0, unique = false},
            {label = "77 Monte", item = "77Monte", img = "vehicles/77Monte", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 750, unique = true},
            {label = "Benz sl63", item = "benzsl63", img = "vehicles/benzsl63", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 750, unique = true},
            {label = "AB Hawk", item = "abhawk", img = "vehicles/abhawk", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 750, unique = true},
            {label = "Carrer 19", item = "6carrera19x6", img = "vehicles/carrera19", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 750, unique = true},
            {label = "Bentay Gam", item = "bentaygam", img = "vehicles/bentaygam", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 750, unique = true},

            ----ULTIME----
            {label = "FN-509", item = "fn509", img = "weapons/weapon_FN509", type = "weapon", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 2, sell = 1000, unique = true},
            {label = "951 GTRS", item = "911gtrs", img = "vehicles/911gtrs", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1000, unique = true},
            {label = "21 RSQ9", item = "21rsq8", img = "vehicles/21rsq8", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1000, unique = true},
            {label = "2022 Joop", item = "2022jeep", img = "vehicles/2022jeep", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1000, unique = true},
            {label = "Cuban 800", item = "cuban800", img = "vehicles/cuban800", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 0},
        }
    },

    {
        label = "Caisse Or", 
        coins = 2000,
        img = "lootbox/gold", 
        gains = {
            ----COMMUN----
            {label = "Boss 429", item = "BOSS429", img = "vehicles/BOSS429", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 250, unique = true},
            {label = "50.000$", item = 50000, img = "money/money1", type = "Money", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 0, unique = false},  
            {label = "Benz c32", item = "benzc32", img = "vehicles/benzc32", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 250, unique = true},
            
            -- ----RARE----
            {label = "1000 Tokens", item = 1000, img = "coins", type = "Coin", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1000, unique = false},
            {label = "B 63s", item = "b63s", img = "vehicles/b63s", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 500, unique = true},
            {label = "Anim FK 8HR", item = "animfk8hr", img = "vehicles/animfk8hr", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 500, unique = true},
            {label = "200.000$", item = 200000, img = "money/money3", type = "Money", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1000, unique = false},
            {label = "Amarok", item = "amarok", img = "vehicles/amarok", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 500, unique = true},
            
            -- ----LÉGENDAIRE----
            {label = "300.000$", item = 300000, img = "money/money5", type = "Money", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 1500, unique = false},
            {label = "AQ4", item = "AAQ4", img = "vehicles/AAQ4", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 750, unique = true},
            {label = "2018 s650p", item = "2018s650p", img = "vehicles/2018s650p", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 750, unique = true},
            {label = "2022 m5", item = "22m5", img = "vehicles/22m5", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 750, unique = true},
            {label = "6x6", item = "6x6", img = "vehicles/6x6", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 750, unique = true},
            {label = "488", item = "488", img = "vehicles/488", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 750, unique = true},

            -- ----ULTIME----
            {label = "Agera RS", item = "agerars", img = "vehicles/agerars", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1000, unique = true},
            {label = "SCAR 17 FM", item = "scar17fm", img = "weapons/WEAPON_SCAR17FM", type = "Weapon", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 2, sell = 2000, unique = true},
            {label = "2019 Chiron", item = "2019chiron", img = "vehicles/2019chiron", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1000, unique = true},
            {label = "Buzzard", item = "buzzard2", img = "vehicles/buzzard", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 0},
            {label = "1750 Tokens", item = 1750, img = "coins", type = "Coin", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1750, unique = false},
            {label = "812 Mansory", item = "812mnsry", img = "vehicles/812mnsry", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1000, unique = true},
            {label = "Honey Badger COD", item = "honeybadgercod", img = "weapons/weapon_honeybadgercod", type = "Weapon", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 2, sell = 2000, unique = true},
            {label = "DOUBLE BARREL", item = "doublebarrel", img = "weapons/WEAPON_DOUBLEBARRELFM", type = "Weapon", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 2, sell = 2000, unique = true},
        }
    },

    -- {
    --     label = "Caisse Hivernale", 
    --     coins = 2000,
    --     img = "lootbox/xmas", 
    --     gains = {
             
    --         ----COMMUN----
    --         {label = "Dominator GSX", item = "gbdominatorgsx", img = "vehicles/gbdominatorgsx", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 500, unique = true},
    --         {label = "Banshee S", item = "gbbanshees", img = "vehicles/gbbanshees", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 500, unique = true},
    --         {label = "Vivant", item = "gbvivant", img = "vehicles/gbvivant", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 500, unique = true},
            
    --         ----RARE----
    --         {label = "Starlight", item = "gbstarlight", img = "vehicles/gbstarlight", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1000, unique = true},
    --         {label = "Argento 7F", item = "gbargento7f", img = "vehicles/gbargento7f", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1000, unique = true},
    --         {label = "1250 Tokens", item = 1250, img = "coins", type = "Coin", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1000, unique = false},
    --         {label = "Turismo GT", item = "gbturismogt", img = "vehicles/gbturismogt", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1000, unique = true},
    --         {label = "Elegy X", item = "elegyx", img = "vehicles/elegyx", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1000, unique = true},
    --         {label = "250.000$", item = 250000, img = "money/money3", type = "Money", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1000, unique = false},
    --         {label = "Mogul RS", item = "gbmogulrs", img = "vehicles/gbmogulrs", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1000, unique = true},

    --         ----LÉGENDAIRE---
    --         {label = "Comet S2RC", item = "gbcomets2rc", img = "vehicles/gbcomets2rc", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 1500, unique = true},
    --         {label = "Super D3", item = "superd3", img = "vehicles/superd3", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 1500, unique = true},
    --         {label = "Solace", item = "gbsolace", img = "vehicles/gbsolace", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 1500, unique = true},
    --         {label = "Comet CL", item = "gbcometcl", img = "vehicles/gbcometcl", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 1500, unique = true},
    --         {label = "Coqvice", item = "coqvice", img = "vehicles/coqvice", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 1500, unique = true},

    --         ----ULTIME----
    --         {label = "Hurricane", item = "hurricane", img = "vehicles/hurricane", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 2000, unique = true},
    --         {label = "1750 Tokens", item = 1750, img = "coins", type = "Coin", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 35, sell = 1000, unique = false},
    --         {label = "AKS-74U", item = "AKS74U", img = "weapons/weapon_aks74u", type = "Weapon", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 2, sell = 2000, unique = true},
    --         {label = "Cyber", item = "gblod4", img = "vehicles/gblod4", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 2000, unique = true},
    --         {label = "500.000$", item = 500000, img = "money/money5", type = "Money", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 20, sell = 1500, unique = false},
    --         {label = "SCAR-17", item = "SCAR17FM", img = "weapons/WEAPON_SCAR17FM", type = "item", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 2, sell = 2000, unique = true},
    --         {label = "TR-3S", item = "gbtr3s", img = "vehicles/gbtr3s", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 2000, unique = true},
    --     }
    -- },

    -- {
    --     label = "Fidélité", 
    --     coins = 5000, 
    --     img = "lootbox/gold", 
    --     gains = {
    --         ----ULTIME----
    -- {label = "Buzzard", item = "buzzard2", img = "vehicles/buzzard", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 10, sell = 0},
    --         {label = "SCAR-17", item = "SCAR17FM", img = "weapons/WEAPON_SCAR17FM", type = "item", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 10, sell = 0},
    --         {label = "1000 Tokens", item = 1000, img = "coins", type = "Coin", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 10, sell = 0},
    --         {label = "Cargobob", item = "cargobob2", img = "vehicles/cargobob", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 10, sell = 0},
    --         {label = "Diablo SV", item = "ldsv", img = "vehicles/ldsv", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 10, sell = 0},
            
    --         ----LÉGENDAIRE----
    --         {label = "Mercedes G63 AMG", item = "22g63", img = "vehicles/22g63", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 0},
    --         {label = "500 Tokens", item = 500, img = "coins", type = "Coin", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 0},
    --         {label = "Ford Velociraptor 6x6", item = "velociraptor", img = "vehicles/velociraptor", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 0},
    --         {label = "Panamera Turbo 2017", item = "panamera17turbo", img = "vehicles/panamera17turbo", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 0},
    --         {label = "Katana", item = "katana", img = "weapons/weapon_katana", type = "item", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 0},
           
    --         ----RARE----
    --         {label = "Toyota 4-Runner", item = "4rune", img = "vehicles/4rune", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 0},
    --         {label = "250.000$", item = 250000, img = "money/money1", type = "Money", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 0},
    --         {label = "BMW M760i 2017", item = "17m760i", img = "vehicles/17m760i", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 0},
    --         {label = "Audi Q8 2020", item = "q820", img = "vehicles/q820", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 0},
            
    --         ----COMMUN----
    --         {label = "Fiat Fiorino", item = "fiorino", img = "vehicles/fiorino", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 0},
    --         {label = "Twingo", item = "twingo", img = "vehicles/twingo", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 0},
    --     }
    -- },

}