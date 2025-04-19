Config = {}

-- Paramètres de gameplay
Config.DefaultRespawnTime = 360 -- Temps en secondes (6 minutes)
Config.AllowKillCommand = true -- Autoriser la commande /kill
Config.KillCommandPermissions = {"admin", "superadmin", "mod"} -- Permissions nécessaires pour la commande /kill

-- Contrôles
Config.Controls = {
    CallMedic = 'E',     -- Touche pour appeler les secours
    Respawn = 'X',       -- Touche pour réapparaître
    Info = 'I',          -- Touche pour afficher les infos
    Report = 'R',        -- Touche pour signaler un freekill
    ClosePopup = 'ESCAPE' -- Touche pour fermer les popups
}

-- Notifications
Config.NotificationDuration = 5000 -- Durée d'affichage des notifications en ms
Config.DefaultMessages = {
    MedicCalled = "Les secours ont été contactés. Veuillez patienter.",
    MedicEnRoute = "Les secours sont actuellement en route !",
    TimerNotFinished = "Vous devez attendre la fin du timer avant de respawn.",
    ReportSent = "Votre signalement a été envoyé au Staff."
}

-- Système de rapports
Config.Report = {
    Enabled = true,
    AutoFormat = "[Auto] J'ai été freekill, raison: %s, ID du tueur: %s", -- %s sera remplacé par la raison et l'ID
    Command = "report" -- Commande serveur utilisée pour les reports
}

-- Interactions avec d'autres ressources
Config.HideHUD = true -- Masquer le HUD pendant la mort
Config.HideRadar = true -- Masquer le radar pendant la mort
