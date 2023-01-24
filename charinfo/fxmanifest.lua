fx_version 'cerulean'
game 'gta5'
name 'charinfo'
description 'get player information with a single command!'
lua54 'yes'

shared_script '@es_extended/imports.lua'
client_script 'client.lua'
server_scripts {
'@mysql-async/lib/MySQL.lua',
'serverconfig.lua',
'server.lua'
}
