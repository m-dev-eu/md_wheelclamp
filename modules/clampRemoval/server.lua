if not lib then return end

server.registerUsableItem(settings.items.wheelClampRemover, function (source)
    local playerId = source
    local player = server.GetPlayerFromId(playerId)
    if not player then lib.print.error('Player not found!') return end

    if not server.isAllowed(player, 'wheelClampRemover') then return end

    
    TriggerClientEvent('wheelclamp:requestWheelClampRemoval', playerId)
end)