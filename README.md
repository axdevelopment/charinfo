# [esx] charinfo
Get informations about a specific players inventory, loadout, money and much more with a simple command.

we are back at it - back at what?
back at stopping people selling overpriced, simple resources.

## usage
### ingame
open your ingame-chat and type the command '/charinfo ID'
the ID represents the server id of the targeted player.
if you do not have a chat resource, simply press F8 and type 'charinfo ID'
after executing the command, you will get a log sent to your discord webhook, which looks like this:i
![preview](https://media.discordapp.net/attachments/1032645376819339345/1067427072835862538/image.png?width=536&height=689)

### console
same command here, just without the prefix. type in 'charinfo ID' and you'll get the same discord log.

either if it's via ingame chat/f8 console or via serverconsole, you will always see who requested the charinfo.

feel free to improve, convert to qb, or whatever - simply open a PR on github

## installation
simply add the folder into your resources, add 'start charinfo' to your server.cfg and don't forget to set your discord webhook inside server.lua on line 1

## dependencies
- [esx](https://github.com/esx-framework/esx_core)
- [oxmysql](https://github.com/overextended/oxmysql)
