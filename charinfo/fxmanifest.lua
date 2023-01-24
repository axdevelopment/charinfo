fx_version 'cerulean'
game 'gta5'
name 'testscript'
lua54 'yes'

shared_script '@es_extended/imports.lua'
client_script 'client.lua'
server_scripts {
'@mysql-async/lib/MySQL.lua',
'serverconfig.lua',
'server.lua'
}