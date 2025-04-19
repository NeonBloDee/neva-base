fx_version 'adamant'
game 'gta5'

lua54 'yes'

author 'Lajcd'
description 'NEVA Deathscreen'

ui_page 'source/index.html'

escrow_ignore {
    'config.lua',
    'config_ui.lua'
}

client_scripts {
    'config.lua',
    'config_ui.lua',
    'resource/client.lua'
}

server_scripts {
    'config.lua',
    'resource/server.lua'
}

files {
    'source/*',
    'source/images/*',
    'source/fonts/*'
}
