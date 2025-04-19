

fx_version 'bodacious'
game 'gta5' 
author "Sunny"
lua54 'yes'


escrow_ignore {
    "Config.lua"
}

ui_page 'web/index.html'
files {
    'web/**'
}

client_script {
    'init.lua',
    'client.lua',
    'charCreator.lua',
    'cl_charCreate.lua',
    'clotheshop.lua',
    'accessoriesShop.lua',
    'hairshop.lua',
    'makeup.lua',
    "modules/**/client/*.lua",
    'Config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "sv_charCreator.lua",
    'Config.lua',
}

exports {
    "isInInterface",
    'draw',
    "isInInventory",
}

shared_scripts {
    'Config.lua',
}

