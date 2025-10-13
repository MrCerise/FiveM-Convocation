fx_version 'cerulean'
game 'gta5'

author 'MrCerise'
description 'Summon your players following a Non-Roleplay action'
version '1.2'
lua54 'yes'

server_scripts {
    'server/main.lua'
}

client_scripts {
    'client/main.lua'
}

shared_script {
    'config.lua',
    'function.lua'
}

escrow_ignore {
    'config.lua',
    'function.lua'
}
dependency '/assetpacks'