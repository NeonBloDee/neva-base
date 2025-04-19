fx_version "cerulean"
lua54 'yes'
game 'gta5'

author "lacjd"
description 'Notification system for lajcd Framework'
version '1.0.0'

ui_page 'web/build/index.html'

escrow_ignore {
	'editable.lua',
	'utils.lua'
}

files {
	'web/build/index.html',
  'images/*.png',
	'web/build/**/*',
	'icons/**/*'
}

client_scripts {
	'editable.lua',
	'utils.lua'
}

escrow_ignore {
	'editable.lua',
	'utils.lua'
}
dependency '/assetpacks'
dependency '/assetpacks'

server_scripts {
	'server/server.lua'
}