RegisterNetEvent('wheelclamp:requestWheelClampRemoval', function ()
    local entity, entityType = client.raycast(2|16)
    if not entity then return end

    if entityType ~= 2 then return end

    local coords = GetEntityCoords(entity)

    TaskTurnPedToFaceCoord(cache.ped, coords.x, coords.y, coords.z, 0)

    local plate = client.getVehiclePlate(entity)
    local currentState = lib.callback.await('wheelclamp:checkClampState', false, plate)
    if not currentState then
        return lib.notify({
            title = locale('title'),
            description = locale('vehicle_not_clamped'),
            type = 'error'
        })
    end

    if lib.progressBar({
        duration = settings.durations.wheelClampRemoval,
        label = locale('clamping_removal_in_progress'),
        canCancel = true,
        anim = {
            scenario = 'PROP_HUMAN_PARKING_METER'
        }
    }) then
        local hasItem = lib.callback.await('wheelclamp:hasItem', false, settings.items.wheelClampRemover, 1, true)
        if not hasItem then
            return lib.notify({
                title = locale('title'),
                description = locale('not_enough_items'),
                type = 'error'
            })
        end

        TriggerServerEvent('wheelclamp:setVehicleClampState', plate, false)
        lib.notify({
            title = locale('title'),
            description = locale('clamping_removal_finished'),
            type = 'success'
        })

        if settings.factionNotifys.wheelClampRemoval then
            TriggerServerEvent('wheelclamp:notifyFaction', {
                title = locale('title'),
                description = locale('clamping_removal_notify_faction', client.getPlayerName(), plate),
                type = 'info'
            } --[[@as NotifyProps]])
        end
    else
        lib.notify({
            title = locale('title'),
            description = locale('clamping_removal_cancelled'),
            type = 'error'
        })
    end
end)