ConfigUI = {}

-- Activation/désactivation des éléments visuels
ConfigUI.EnableRedGradient = true  -- Fond rouge autour de l'écran
ConfigUI.EnableBackgroundFade = true -- Fond noir transparent
ConfigUI.EnableDeathImage = true   -- Image de mort

-- Personnalisation du fond rouge
ConfigUI.RedGradient = {
    CenterOpacity = 0.05,  -- Opacité au centre (0-1)
    EdgeOpacity = 0.4,     -- Opacité aux bords (0-1)
    InnerRGB = {200, 0, 0},  -- Couleur intérieure (R,G,B)
    OuterRGB = {140, 0, 0}   -- Couleur extérieure (R,G,B)
}

-- Personnalisation du fond général
ConfigUI.Background = {
    Opacity = 0.5,       -- Opacité du fond noir (0-1)
    RGB = {10, 10, 10}   -- Couleur de base du fond (R,G,B)
}

-- Personnalisation des couleurs globales
ConfigUI.Colors = {
    Primary = "#4fb5e9",    -- Couleur primaire (bleu)
    Secondary = "#96f283",  -- Couleur secondaire (vert)
    Danger = "#e94f4f",     -- Couleur danger (rouge)
    Text = "#ffffff",       -- Couleur du texte
    TextSecondary = "rgba(255, 255, 255, 0.8)" -- Couleur du texte secondaire
}

-- Personnalisation des boutons
ConfigUI.Buttons = {
    Background = "rgba(255, 255, 255, 0.1)",
    BackgroundHover = "rgba(255, 255, 255, 0.2)",
    TextColor = "#ffffff",
    BorderRadius = "8px",
    Shadow = "0 4px 10px rgba(0, 0, 0, 0.2)"
}

-- Paramètres des popups
ConfigUI.Popups = {
    Background = "rgba(15, 15, 18, 0.9)",
    BorderColor = "rgba(255, 255, 255, 0.1)",
    Width = "450px",
    BorderRadius = "12px",
    Shadow = "0 10px 30px rgba(0, 0, 0, 0.6)"
}

-- Animations
ConfigUI.Animations = {
    EnablePopupAnimations = true,
    PopupOpenDuration = 250,  -- en ms
    PopupCloseDuration = 200, -- en ms
    TimerAnimations = true
}

-- Textes
ConfigUI.Texts = {
    Title = "VOUS ÊTES INCONSCIENT",
    Description = "Vous êtes actuellement en état d'inconscience. En attendant l'arrivée des secours, vous pouvez appeler un médecin ou patienter jusqu'à l'unité X.",
    CallMedic = "Appeler les secours",
    Respawn = "Unité X",
    Information = "Informations",
    ReportFreekill = "Signaler un Freekill",
    
    InfoPopupTitle = "Détails de la mort",
    InfoCauseLabel = "Cause",
    InfoKillerLabel = "Identifiant",
    InfoCloseButton = "Fermer",
    
    FreekillPopupTitle = "Signaler un Freekill",
    FreekillPopupContent = "Si vous validez, un report automatique sera envoyé au Staff en signalant un freekill.",
    FreekillConfirmButton = "Confirmer",
    FreekillCancelButton = "Annuler"
}

-- Police de caractères
ConfigUI.Font = {
    Family = "'Manrope', sans-serif",
    TitleSize = "48px",
    TitleWeight = "800",
    DescriptionSize = "16px",
    ButtonTextSize = "14px"
}
