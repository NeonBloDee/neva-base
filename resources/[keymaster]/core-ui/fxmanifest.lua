fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lajcd'
description 'Un pack de différent UI'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua'
}

ui_page 'modules/web/index.html'

files {
    'modules/web/index.html',
    'modules/web/root/*.css',
    'modules/web/**/*.html',
    'modules/web/**/css/*.css',
    'modules/web/**/js/*.js',
}

client_scripts {
    'modules/**/client/*.lua'
}

server_scripts {
    'modules/**/server/*.lua'
}

exports {
    -- Weazel News
    'ShowWeazelNotification',
    'OpenWeazelNewsMenu',
    -- UI Info
    'drawInfo',
    'hideInfo'
}

dependencies {
    'frwk',
    'ox_lib'
}

dependency '/assetpacks'