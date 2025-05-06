print("Initialisation du système 3dme...")

RegisterNetEvent('3dme:command')
AddEventHandler('3dme:command', function(args)
    local source = source
    local _source = source
    
    print("3dme:command triggered by " .. GetPlayerName(source))
    
    if not args or #args == 0 then
        TriggerClientEvent('esx:showNotification', source, "~r~Erreur: ~s~Vous devez spécifier une action.")
        return
    end
    
    local lang = Languages[dmeC.language]
    local text = "* " .. lang.prefix .. table.concat(args, " ") .. " *"
    
    if (string.find(text:lower(), "<img")) or 
       (string.find(text:lower(), "discord")) or 
       (string.find(text:lower(), "tiktok")) then
        DropPlayer(source, 'Tentative de contenu non autorisé dans la commande /me')
        return
    end
    
    TriggerClientEvent('3dme:shareDisplay', -1, text, source)
end)

print("Système 3dme initialisé avec succès!")
