if not lib then return end

server.registerUsableItem(settings.items.welder, function (source)
    local playerId = source
    local player = server.GetPlayerFromId(playerId)
    if not player then lib.print.error('Player not found!') return end
    
    TriggerClientEvent('wheelclamp:requestWheelClampWelding', playerId)
end)
