

fx_version 'adamant'
game 'gta5'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/locale.lua',
}

client_scripts {
	'cl_item.lua',
} 

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'sv_item.lua',
}

dependencies {
    'ox_lib'
}