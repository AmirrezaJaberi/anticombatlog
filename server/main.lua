AddEventHandler('playerDropped', function (reason)
    local src = source
    local data = {
        src = src,
        pos = GetEntityCoords(GetPlayerPed(src)),
        resson = reason,
        name = GetPlayerName(src),
        steam = GetPlayerIdentifier(src, 1)
    }
    SendLog(data)
    TriggerClientEvent('esx_anticombatlog:PlayerDisconnect', -1, data)
end)

function SendLog(data)
    if data then
        PerformHttpRequest(Config.Webhook, function(E, F, G)
		end, "POST", json.encode({
			embeds = {
				{
					author = {
					name = Config.log.name,
					url = Config.log.discord,
					icon_url = Config.log.logo
					},
					title = "🟥 Player Disconnect 🟥",
					description = "**Player:** "..data.name.."\n**ID:** "..data.src.."\n**Reason:** "..data.resson.."\n**Steam Hex:** "..data.steam.."\n",
					color = Config.log.color,
					footer = {
						text = ''..Config.log.name..' | ('..data.src..') '..data.name..' | '..os.date('%X')..'',
					}
				}
			}
		}), {
			["Content-Type"] = "application/json"
		})
    end
end