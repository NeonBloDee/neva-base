Webhooks = {}
Webhooks = {
    vehicle = "https://discord.com/api/webhooks/1305924570703986758/RqQ2i3LGf2vJkkqNuUBhg2WtZTj2OUKFlvBVDlIGt7jPyuqSYXYQ0SIIY5LMSU8EagCE",
    item = "https://discord.com/api/webhooks/1305926147413905460/J8_816YGhHCqnNr8bJnSLUTQ8-WGfe9Ln0qJCDsqtUGdaNsV3TM4ZFQEzoaJC6zBe_-J",
    weapon = "https://discord.com/api/webhooks/1305924710130913371/zgGs6v60a--wXpS7QEJdo4KPFMboeAAToH5s6qAnZnD9UOTWGLmwvimjuKi-0EMZ8eqE",
    money = "https://discord.com/api/webhooks/1305925409745010719/6c_KbpTSB9kL4PxrkwiDIA9vtz53RXB6vzvgWjUn1DQRZqBKVzkaxpp_ZSzGqHkpLHW6",
    coins = "https://discord.com/api/webhooks/1305926011174653973/9MAs0YASKcGYTBuql__kVdRVMwqnBxlrLfxVP7-GTrVuabQBCPOlXhuAys5bNasNqk29",
    selling = "https://discord.com/api/webhooks/1305925957802262590/Tf68NrD_or_PTesMKv7TjwOgE-Qm8_8NXjPu5CEJRtQ2D9W86DSBNp1SgTBLWIDj2stf",
    lootbox = "https://discord.com/api/webhooks/1305924465959370822/LYP_GUMgz1YoApIsZeEf6_xxY3G8YdIkAcAiQTkhyuTT4w23s-zgFbm4sW85uhrlAnT2",
    givepoint = "https://discord.com/api/webhooks/1305924394018934856/KLnN6aTC9F_0XapCvN5zPs52zuq90dqT8bv-fYjg0p55X9TxglxTM8JeLrThY56o-BNm",
}

function SendToDiscord(type, name, message, color)
    local discordweb = Webhooks[type]
    if discordweb ~= "" then
        local connect = {
            {
                ["color"] = "16769280", 
                ["title"] = "**".. name .."**",
                ["description"] = message,
                ["footer"] = {["text"] = "N E V A"},
            },
        }
        PerformHttpRequest(discordweb, function(err, text, headers) end, 'POST', json.encode({username = "BoutiqueV4", embeds = connect}), { ['Content-Type'] = 'application/json' })
    else
        print("------------------------------------------\nLe webhook " .. type .. " n'est pas configuré.\n------------------------------------------")
    end
end
