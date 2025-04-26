fx_version 'cerulean'
game 'gta5'

author 'Lajcd'
description 'GoFast Mission System with extensive configuration'
version '1.0.0'

shared_scripts {
    'config.lua',
    'config_ui.lua'
}

client_scripts {
    'utils/sound_manager.lua',
    'client/cl_gofast.lua'
}

server_scripts {
    'server/sv_gofast.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

lua54 'yes'