CONFIG = {}

-- for server cfg; set vote_token "dein vote token"

CONFIG.Framework = {
    VORP = true,
    TIMED = false -- WIP
}

CONFIG.Webhook = {
    URL = "https://discord.com/api/webhooks/1436683947026153512/fDBAAmo0d5j3-p_RI8BAIxmrwQLOcBkGOASy_tPOFtJdeERQ8rYyNL7DlZknWibwIMEo",
}

CONFIG.Items = {
    {id = "lootbox", amount = math.random(1, 3)},
}

CONFIG.Language = {
     ["VOTE_MSG"] = "Du hast für den Server gevotet",
   }