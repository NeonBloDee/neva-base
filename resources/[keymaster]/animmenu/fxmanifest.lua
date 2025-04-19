fx_version 'cerulean'
game 'gta5'
lua54 'yes'
escrow_ignore {
    'shared/*.lua',
    'client/*.lua',
    'server/*.lua',
    'locales/*.lua'
}
shared_scripts {
    'shared/cores.lua',
	'shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'shared/config.lua',
    'shared/AnimationList.lua'
}

client_scripts {
	'client/*.lua'
}
server_scripts {
    'server/*.lua'
}
ui_page 'html/index.html'
files {'html/**'}
dependency '/assetpacks'
dependency '/assetpacks'