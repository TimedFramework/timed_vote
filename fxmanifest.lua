fx_version 'cerulean'
game 'common'

name 'vote'
description ''
author 'Top-Games/Top-Serveurs'
version '3.0.2'
url 'https://github.com/Top-Serveurs/cfx-vote-plugin'


shared_script 'shared/config.lua'

server_scripts {
    'vote.js',
    'server/main.lua',
    -- '@mysql-async/lib/MySQL.lua', -- Required if you use 'example_esx.lua'
    -- 'example_esx.lua',
    -- 'example_vorp.lua',
}