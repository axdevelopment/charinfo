webhook = '' -- set your discord webhook here

RegisterCommand("charinfo", function(source, args, rawCommand)	
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	  	if hasPermission(xPlayer) then
	    	if args[1] and tonumber(args[1]) then
	      		local targetId = tonumber(args[1])
	      		local xTarget = ESX.GetPlayerFromId(targetId)
	      		if xTarget then
					local identifier = xTarget.getIdentifier()
					local inventory = xTarget.getInventory()
					local loadout = MySQL.Sync.fetchScalar('SELECT loadout FROM users WHERE identifier = @identifier', {['@identifier'] = identifier})
					local inventory = MySQL.Sync.fetchScalar('SELECT inventory FROM users WHERE identifier = @identifier', {['@identifier'] = identifier})
					local vehicles = json.encode(MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @owner', {['@owner'] = identifier}))
					local name = xTarget.getName()
					local job = json.encode(xTarget.getJob())
					local money = xTarget.getAccount('money').money
					local bank = xTarget.getAccount('bank').money
					local black_money = xTarget.getAccount('black_money').money
					local group = xTarget.getGroup()
					local ingamecommand = {
						{
							["color"] = 15548997,
							["title"] = "šµ Charinfo request",
							["description"] = "ā¤ Staffmember **"..GetPlayerName(source).." ("..xPlayer.getGroup()..") ** requested charinfo \nfor **Player ID "..args[1].." ("..xPlayer.getGroup()..")\n".."\nš­ IDENTIFIER\n**"..identifier.."\n".."**\nš INGAME NAME**\n"..name.."\n".."**\nš¤ STEAM NAME\n**"..GetPlayerName(targetId).."\n".."**\nš¼ JOBINFORMATION\n**"..job.."\n".."**\nšø CASH\n**"..money.."\n".."**\nš± BANK\n**"..bank.."\n".."**\nšŖ BLACK MONEY\n**"..black_money.."\n".."**\nš« LOADOUT\n**"..loadout.."\n".."**\nš INVENTORY\n**"..inventory.."\n".."**\nš OWNED VEHICLES\n**"..vehicles,
							["footer"] = {
							["text"] = "made with ā¤ļø by ardo",
							},
						}
					}
					PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "CHARINFO",  avatar_url = Config.AvatarURL, embeds = ingamecommand}), { ['Content-Type'] = 'application/json' })
					TriggerClientEvent('esx:showNotification', xPlayer.source, "Charinfo of player with ID "..args[1].." was sent to your discord webhook")
	      		else
					TriggerClientEvent('esx:showNotification', xPlayer.source, "No player online with ID "..args[1])
	      		end
	    	else
				TriggerClientEvent('esx:showNotification', xPlayer.source, "Wrong arguments passed! Use /charinfo ID")
	    	end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have the permission to use this command")
	  	end
	else
		if args[1] and tonumber(args[1]) then
	      	local targetId = tonumber(args[1])
	      	local xTarget = ESX.GetPlayerFromId(targetId)
	      	if xTarget then
				local identifier = xTarget.getIdentifier()
				local inventory = xTarget.getInventory()
				local loadout = MySQL.Sync.fetchScalar('SELECT loadout FROM users WHERE identifier = @identifier', {['@identifier'] = identifier})
				local inventory = MySQL.Sync.fetchScalar('SELECT inventory FROM users WHERE identifier = @identifier', {['@identifier'] = identifier})
				local vehicles = json.encode(MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @owner', {['@owner'] = identifier}))
				local name = xTarget.getName()
				local job = json.encode(xTarget.getJob())
				local money = xTarget.getAccount('money').money
				local bank = xTarget.getAccount('bank').money
				local black_money = xTarget.getAccount('black_money').money
				local group = xTarget.getGroup()
				local ingamecommand = {
					{
						["color"] = 15548997,
						["title"] = "šµ Charinfo request",
						["description"] = "ā¤ **Console** requested charinfo for **Player ID "..args[1].."\n".."\nš­ IDENTIFIER\n**"..identifier.."\n".."**\nš INGAME NAME**\n"..name.."\n".."**\nš¤ STEAM NAME\n**"..GetPlayerName(targetId).."\n".."**\nš¼ JOBINFORMATION\n**"..job.."\n".."**\nšø CASH\n**"..money.."\n".."**\nš± BANK\n**"..bank.."\n".."**\nšŖ BLACK MONEY\n**"..black_money.."\n".."**\nš« LOADOUT\n**"..loadout.."\n".."**\nš INVENTORY\n**"..inventory.."\n".."**\nš OWNED VEHICLES\n**"..vehicles,
						["footer"] = {
						["text"] = "made with ā¤ļø by ardo",
						},
					}
				}
				PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "CHARINFO",  avatar_url = Config.AvatarURL, embeds = ingamecommand}), { ['Content-Type'] = 'application/json' })
				print("^2Charinfo for Player ID "..args[1].." was successfully sent to your discord webhook^0")
	      	else
				print("^1No player online with ID ^0"..args[1])
	      	end
	    else
			print("^1Wrong arguments passed! For console use charinfo ID^0")
	    end
	end
end, false)

function hasPermission(xPlayer)
	local playerGroup = xPlayer.getGroup()
	for k,v in pairs(Config.AdminGroups) do
		if v == playerGroup then
			return true
		end
	end
	return false
end

AddEventHandler('onResourceStart', function(resourceName) -- When the resource starts
	if (GetCurrentResourceName() == resourceName) then
		if webhook == '' then
			print("^3Charinfo script started. ^1Please set your discord webhook inside server.lua (line 1) and restart the script!^0")
		else
			print("^2Charinfo script successfully started!^0")
		end
	end
end)
