RegisterNetEvent('esx_anticombatlog:PlayerDisconnect')
AddEventHandler('esx_anticombatlog:PlayerDisconnect', function (data)
    local ppeds = GetPlayerPed(-1)
    local pcoords = GetEntityCoords(ppeds)
    local distence = Vdist2(pcoords.x, pcoords.y, pcoords.z, data.pos.x, data.pos.y, data.pos.z)
    if distence < 30 then
        sendMessage('Player : ^3'..data.name..'^1(^2'..data.src..'^1) Left Server , Resson : ^3'..data.resson..'')
    end
end)

function sendMessage(message)
    TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {"[Anti CL]", "^0" .. message}})
end
