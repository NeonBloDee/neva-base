

fx_version 'adamant'
game 'gta5'

author 'lajcd'
description 'Blackmarket Script'

lua54 'yes'
version '1.0.0'

client_scripts {
    'config.lua',
	'client/main.lua',
    'client/client_hook.lua',
}

escrow_ignore {
    'config.lua'
}

server_scripts {
    'config.lua',
    'server/server_hook.lua',
	'server/main.lua',
	-- 'server/server.lua',
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
    'html/app.css',
    'html/app.js',
    'html/*.png',
    'html/*.otf'
}
dependency '/assetpacks'