

local VORPcore = exports.vorp_core:GetCore()

TriggerEvent("getCore", function(core)
    VorpCore = core
end)

AddEventHandler('onPlayerVote', function (playerName, date)
   sendEmbed(16753920, "Voting", "Jemand hat für den Server gevotet. ".. playerName, "Coded by Tura", CONFIG.Webhook.URL)
    print("[".. GetCurrentResourceName().."] Der Spieler ".. playerName .. " hat am "..date .. " für den Server gevotet.")
    for _,playerSrc in pairs(GetPlayers()) do 
        if GetPlayerName(playerSrc) == playerName then 
            
            for k, v in pairs(CONFIG.Items) do 
                exports.vorp_inventory:addItem(playerSrc, v.id, v.amount, {}, nil , nil)
                TriggerClientEvent("vote:sucess", playerSrc)
            end
        end
    end
end)


function sendEmbed(color, name, message, footer, url)
  local embed = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }

  PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end