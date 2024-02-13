if not lib then return end

server.registerUsableItem(settings.items.wheelClamp, function (source)
    local playerId = source
    local player = server.GetPlayerFromId(playerId)
    if not player then lib.print.error('Player not found!') return end

    if not server.isAllowed(player, 'wheelClamp') then return end

    
    TriggerClientEvent('wheelclamp:requestWheelClamp', playerId)
end)
