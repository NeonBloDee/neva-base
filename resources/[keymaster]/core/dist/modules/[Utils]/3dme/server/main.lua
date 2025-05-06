local lang = Languages[dmeC.language]

local function processMe(source, text)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local formattedText = "* " .. lang.prefix .. text .. " *"
    
    if string.find(formattedText, "<img src") then
        DropPlayer(source, 'usebug me image')
        return
    end
    
    if string.find(formattedText, "discord") then
        DropPlayer(source, 'usebug me')
        return
    end
    
    if string.find(formattedText, "tiktok") then
        DropPlayer(source, 'usebug me')
        return
    end
    
    TriggerClientEvent('3dme:shareDisplay', -1, formattedText, source)
end

RegisterCommand(lang.commandName, function(source, args)
    if #args > 0 then
        local text = table.concat(args, " ")
        processMe(source, text)
    end
end)

RegisterServerEvent('3dme:sendMe')
AddEventHandler('3dme:sendMe', function(text)
    local source = source
    processMe(source, text)
end)
