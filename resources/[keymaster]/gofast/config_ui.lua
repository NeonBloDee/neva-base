-- Make sure Config.UI is initialized properly
if not Config then Config = {} end

-- Initialize Config.UI (don't overwrite it if it already exists)
-- This avoids the double initialization problem
if not Config.UI then Config.UI = {} end

Config.UI = {}

-- Contact information
Config.UI.Contact = {
    Name = "Contact",
    Icon = "fas fa-user-tie",
    Status = "En ligne",
    IconBgColor = "#3498db",
    IconGradient = {
        From = "#3498db",
        To = "#2980b9"
    }
}

-- Dialog messages text content (supports formatting)
Config.UI.Messages = {
    Intro = "Hey, j'ai besoin de quelqu'un pour une mission rapide et bien payée. Ça t'intéresse?",
    Interested = "Cool. J'ai besoin de faire déplacer un véhicule d'un point A à un point B. C'est du simple aller-retour.",
    Rules = "Les règles sont simples : Conduis prudemment mais rapide, reste discret sur ce que tu transportes, si les flics t'arrêtent tu me connais pas, et une fois livré, tu es payé cash.",
    Understand = "Alors, ça te va comme job?",
    Waiting = "Parfait. Reste où tu es, le véhicule arrive dans quelques instants.",
    VehicleComing = "Le voilà. Bonne route et fais gaffe à toi.",
    Angry = "Tu te fous de ma gueule ? Tu crois que tu peux juste refuser comme ça après avoir tout entendu ?!",
    Threat = "Tu vas voir ce qui arrive aux gens qui me font perdre mon temps..."
}

-- Dialog options text and icons
Config.UI.Options = {
    Intro = {
        {
            Id = "interested",
            Text = "Dis-m'en plus",
            Icon = "fa-solid fa-ear-listen"
        },
        {
            Id = "decline",
            Text = "Pas intéressé",
            Icon = "fa-solid fa-xmark"
        },
    },
    Interested = {
        {
            Id = "continue",
            Text = "Continue...",
            Icon = "fa-solid fa-arrow-right"
        },
    },
    Rules = {
        {
            Id = "understand",
            Text = "Je comprends",
            Icon = "fa-solid fa-check"
        },
        {
            Id = "refuse",
            Text = "C'est pas pour moi",
            Icon = "fa-solid fa-xmark"
        },
    },
    Understand = {
        {
            Id = "accept",
            Text = "Je prends le job",
            Icon = "fa-solid fa-handshake"
        },
        {
            Id = "refuse",
            Text = "Je passe mon tour",
            Icon = "fa-solid fa-ban"
        },
    }
}

-- UI animations and timing configuration
Config.UI.Animation = {
    ShowDelay = 500,
    TypingSpeed = 50,
    MessageDelay = 1000,
    OptionsDelay = 500,
    TransitionSpeed = 500,
    HostileDuration = 7000,
    AngryMessageDelay = 1500,
    ThreatMessageDelay = 3500
}

-- UI appearance configuration
Config.UI.Appearance = {
    Width = "25%",
    MaxWidth = "400px",
    MinWidth = "320px",
    Position = {
        Bottom = "8%",
        Center = true
    },
    Colors = {
        Background = "rgba(10, 10, 10, 0.35)",
        HeaderBg = "rgba(20, 20, 25, 0.6)",
        Border = "rgba(255, 255, 255, 0.1)",
        TheirMessage = "rgba(50, 50, 60, 0.7)",
        MyMessage = "rgba(62, 130, 247, 0.7)",
        TheirText = "rgba(255, 255, 255, 0.9)",
        MyText = "white",
        NameText = "white",
        StatusText = "rgba(255, 255, 255, 0.7)",
        OptionBg = "rgba(255, 255, 255, 0.12)",
        OptionText = "rgba(255, 255, 255, 0.9)",
        OptionHoverBg = "rgba(62, 130, 247, 0.5)"
    },
    Blur = {
        Enable = true,
        Amount = "10px"
    },
    BorderRadius = {
        Container = "12px",
        Message = "16px",
        Option = "18px"
    },
    Shadow = "0 4px 15px rgba(0, 0, 0, 0.3)",
    Font = {
        Family = "'Manrope', sans-serif",
        SizeName = "14px",
        SizeStatus = "11px",
        SizeMessage = "13px",
        SizeOption = "13px"
    }
}

-- Help notification text
Config.UI.HelpText = {
    Interact = "Appuyez sur ~INPUT_PICKUP~ pour intéragir",
    Deliver = "Appuyez sur ~INPUT_PICKUP~ pour livrer le véhicule"
}

-- Animations for conversations
Config.UI.Animations = {
    -- For player
    Player = {
        {"mp_common", "givetake1_a", 48},
        {"mp_facial", "facial_nervous", 48},
        {"gestures@m@standing@casual", "gesture_please", 48},
        {"gestures@m@standing@casual", "gesture_what", 48},
        {"gestures@m@standing@casual", "gesture_hand_down", 48},
        {"gestures@m@standing@casual", "gesture_right", 48},
        {"gestures@m@standing@casual", "gesture_explain_wide", 48}
    },
    
    -- For NPC
    NPC = {
        {"gestures@m@standing@casual", "gesture_hello", 48},
        {"gestures@m@standing@casual", "gesture_bring_it_on", 48},
        {"gestures@m@standing@casual", "gesture_come_here", 48},
        {"gestures@m@standing@casual", "gesture_easy_now", 48}, 
        {"gestures@m@standing@casual", "gesture_explaining", 48},
        {"gestures@m@standing@casual", "gesture_damn", 48},
        {"gestures@m@standing@casual", "gesture_no_way", 48}
    },
    
    -- Specific animations for dialog options
    DialogAnimations = {
        Intro = {
            Interested = {dict = "gestures@m@standing@casual", anim = "gesture_hello", flag = 48},
            Decline = {dict = "gestures@m@standing@casual", anim = "gesture_shrug_hard", flag = 48}
        },
        Interested = {
            Continue = {dict = "gestures@m@standing@casual", anim = "gesture_explaining", flag = 48}
        },
        Rules = {
            Understand = {dict = "gestures@m@standing@casual", anim = "gesture_right_d", flag = 48},
            Refuse = {dict = "gestures@m@standing@casual", anim = "gesture_no_way", flag = 48}
        },
        Understand = {
            Accept = {dict = "mp_common", anim = "givetake1_a", flag = 48},
            Refuse = {dict = "gestures@m@standing@casual", anim = "gesture_damn", flag = 48}
        }
    },
    
    -- Hostile NPC animations
    Hostile = {
        DrawWeapon = {dict = "reaction@intimidation@1h", anim = "intro", flag = 8},
        DrawWeaponDuration = 1200
    }
}
