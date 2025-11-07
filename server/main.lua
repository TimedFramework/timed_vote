

local VORPcore = exports.vorp_core:GetCore()

TriggerEvent("getCore", function(core)
    VorpCore = core
end)

AddEventHandler('onPlayerVote', function (playerName, date)
      local user = VORPcore.getUser(source)
    if not user then return end

    for _,playerSrc in pairs(GetPlayers()) do 
        if GetPlayerName(playerSrc) == playerName then 
            for k, v in pairs(CONFIG.Items) do 
                exports.vorp_inventory:addItem(source, v.id, v.amount, {}, nil , nil)
            end
        end
    end
end)
