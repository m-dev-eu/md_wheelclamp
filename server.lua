if not lib then return end
lib.locale()

require 'modules.bridge.server'
require 'modules.wheelClamp.server'
require 'modules.clampRemoval.server'
require 'modules.welder.server'

local permissions = settings.permissions
function server.isAllowed(player, key)
    local permission = permissions[key]
    if not permission then return false end

    local name, grade = server.GetJob(player)
    return permission[name] and permission[name] <= grade
end

function server.notifyFaction(player, data)
    local job, _ = server.GetJob(player)
    for _, target in pairs(server.getJobPlayers(job)) do
        lib.notify(player.source, data)
    end
end

lib.callback.register('wheelclamp:hasItem', function (source, name, count, remove)
    local player = server.GetPlayerFromId(source)
    return server.HasItem(player, name, count, remove)
end)

lib.callback.register('wheelclamp:checkClampState', function (_, plate)
    return server.getVehicleClampState(plate)
end)


RegisterServerEvent('wheelclamp:notifyFaction', function (data)
    local playerId = source
    local player = server.GetPlayerFromId(playerId)
    server.notifyFaction(player, data)
end)

RegisterServerEvent('wheelclamp:setVehicleClampState', function (plate, state)
    server.setVehicleClampState(plate, state)
end)

exports('IsVehicleClamped', server.getVehicleClampState)
exports('SetVehicleClampState', server.setVehicleClampState)