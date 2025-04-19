



fx_version "cerulean"

description "Ui React for FiveM"
author "Sunny"
version '1.0.0'

lua54 'yes'

games {
  "gta5",
}

ui_page 'web/build/index.html'

client_script "client/**/*"
server_script "server/main.lua"
shared_script "config.lua"
escrow_ignore {
	"config.lua"
}
files {
	'web/build/index.html',
	'web/build/**/*',
}
dependency '/assetpacks'
dependency '/assetpacks'