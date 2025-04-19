fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'NEVA - discord.gg/neva-fivem'

server_scripts {
    'SHyqftXDj8TfrYGT.lua',
    '4sMBRnYFjYgDXzpm.lua'
}

client_script 'p6qsq79LQBgQnSNJ.lua'

server_export 'getOriginalChecksums'
client_export 'getOriginalChecksums'

exports {
    "IsAuthValid",
    "getFileChecksum"
}

dependency '/assetpacks'