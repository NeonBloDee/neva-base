
Config = {}

Config.ShowChatKey = "T"

Config.DefaultSuggestions = {
    {
        name = "me",
        description = "Command: Me"
    },
    {
        name = "do",
        description = "Command: Do"
    },
    {
        name = "ooc",
        description = "Command: OOC"
    },
    {
        name = "playmusic",
        description = "Command: Playmusic"
    },
    {
        name = "yellowpages",
        description = "Command: Yellow Pages"
    },
}

Config.TypeColors = {
    ["me"] = {
        color = "#fff",
        background = "#F2617B"
    },
    ["do"] = {
        color = "#fff",
        background = "#9861F2"
    },
    ["ooc"] = {
        color = "#fff",
        background = "#8AB1DE"
    },
    ["admin"] = {
        color = "#FF3E3E",
        background = "#FF3E3E"
    },
    ["charinfo"] = {
        color = "#875CFF",
        background = "#875CFF"
    },
    ["ems"] = {
        color = "#FFAC60",
        background = "#FFAC60"
    },
    ["police"] = {
        color = "#00C2FF",
        background = "#00C2FF"
    },
    ["error"] = {
        color = "#FF3E3E",
        background = "#FF3E3E"
    },
    ["whisper"] = {
        color = "#4C6085",
        background = "#4C6085"
    },
    ["tweet"] = {
        color = "#5484FF",
        background = "#5484FF"
    },
    ["yellow_pages"] = {
        color = "#FFC700",
        background = "#FFC700"
    },
    ["gang"] = {
        color = "#00FF66",
        background = "#00FF66"
    },
    ["announcement"] = {
        color = "#e69332",
        background = "#e69332"
    },
    ["playmusic"] = {
        color = "#e69332",
        background = "#e69332"
    },
    ["darkchat"] = {
        color = "#4C6085",
        background = "#4C6085"
    },
    ["image"] = {
        color = "#e69332",
        background = "#e69332"
    },
    ["roll-the-dice"] = {
        color = "#e69332",
        background = "#e69332"
    }
}

Config.YellowPageFee = 500

Config.EnableEmojiMenu = true

Config.OOCMessageWithoutCommand = false

Config.CustomNameColor = true
Config.CustomNameTag = true

Config.JobInfoCommand = "job"     -- The command you entered to learn your job?
Config.MoneyInfoCommand = "money" -- The command you entered to learn your balance?

Config.DarkChat = {
    active = false,
    tag = "Dark",
    command = "darkchat",
    jobs = {
        mechanic = false
    },
}

Config.SendImage = {
    active = false,
    command = "img",
    tag = "Image"
}

Config.HotBarSuggestions = {
    -- [1] = {
    --     command = "do",
    --     label = "Do"
    -- },
    -- [2] = {
    --     command = "me",
    --     label = "Me"
    -- },
    -- [3] = {
    --     command = "ooc",
    --     label = "OOC"
    -- },
    -- [4] = {
    --     command = "darkchat",
    --     label = "Dark"
    -- },
}

Config.Locales = {
    game = {
        job_info = "%s, votre métier est [%s] - %s",
    },
    ui = {
        chat_input_placeholder = "Entrez un message...",
        hotbar_item_global = "Global",
        spofi_now_playing = "En cours de lecture",
        chat_position_desc = "Position du chat - Droite",
        name_color = "Nom",
        name_tag = "Tag",
        bank_balance = "Solde",
        setting_notif = "Notifications",
        rp_text_pp_desc = "Photo de profil Me/Do",
        rps_rock = "Pierre",
        rps_paper = "Feuille",
        rps_scissors = "Ciseaux",
    }
}

Config.RPCoordsX = 0
Config.RPCoordsY = 0
Config.RPCoordsZ = 1.1
