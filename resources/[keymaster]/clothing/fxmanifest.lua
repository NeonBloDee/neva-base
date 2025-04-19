fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '1.0.1'

escrow_ignore {
    'shared/*.lua'
}
shared_scripts {
	'shared/cores.lua',
    'shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'shared/config.lua',
    'shared/peds.lua'
}
client_scripts {
    'converter/*.lua',
	'client/*.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}
ui_page 'html/index.html'
files {'html/**', 'converter/*.lua', 'AllTattoos.json'}
dependency '/assetpacks'