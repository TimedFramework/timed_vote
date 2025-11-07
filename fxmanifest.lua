fx_version 'cerulean'
game 'common'

name 'timed_vote'
description ''
author 'tura'
version '1.0.0'


shared_script 'shared/config.lua'

server_scripts {
    'vote.js',
    'server/main.lua',
    -- '@mysql-async/lib/MySQL.lua', -- Required if you use 'example_esx.lua'
    -- 'example_esx.lua',
    -- 'example_vorp.lua',
}