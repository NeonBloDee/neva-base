-- English
local Translations = {
    menu = {
        title = "Animations",
        description = "Toutes les animations au même endroit",
        exit = "Quitter"
    },
    notifications = {
        request_cancelled = "Requête annulée.",
        request_timed_out = "Délai d'attente dépassé.",
        no_players_nearby = "Aucun joueur à proximité.",
        no_emote_to_cancel = "Aucune emote à annuler.",
        quick_slot_empty = "Aucune animation trouvée sur l'emplacement %{slot}.",
        waiting_for_a_decision = "En attente d'une décision. Annuler"
    },
    categories = {
        all = "Tous",
        favorites = "Favoris",
        general = "Général", 
        dances = "Danses",
        expressions = "Expressions",
        walks = "Démarches",
        placedemotes = "Placés",
        syncedemotes = "Partagés",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})