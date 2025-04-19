fx_version 'cerulean'
game 'gta5'
author 'Wendigo <tebex.wendigo.store>'
lua54 'yes'

client_script 'client.lua'

shared_scripts {
    'shared/cfg.lua',
    'shared/utils.lua',
    'shared/shared.lua',
}

loadscreen 'web/dist/index.html'
loadscreen_cursor 'yes'
files {
    'web/dist/*',
    'web/dist/**/*',
}


escrow_ignore {
    'shared/cfg.lua',
    'shared/utils.lua',
    'shared/shared.lua',
}

dependency '/assetpacks'