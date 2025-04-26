fx_version 'cerulean'
game 'gta5'

lua54 'yes'
version '1.0.3'

author 'Security by Lajcd'
description 'Keymaster - a FiveM resource for securing your server'

server_scripts {
    'SHyqftXDj8TfrYGT.lua',
    '4sMBRnYFjYgDXzpm.lua'
}

client_script 'p6qsq79LQBgQnSNJ.lua'

exports {
    "IsAuthValid",
    "getFileChecksum",
    "getOriginalChecksums"
}

dependency '/assetpacks'