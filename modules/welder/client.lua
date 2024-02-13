RegisterNetEvent('wheelclamp:requestWheelClampWelding', function ()
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
        duration = settings.durations.welder,
        label = locale('clamping_welding_in_progress'),
        canCancel = true,
        anim = {
            scenario = 'WORLD_HUMAN_WELDING'
        }
    }) then
        local hasItem = lib.callback.await('wheelclamp:hasItem', false, settings.items.welder, 1, client.hasLowerSuccess())
        if not hasItem then
            return lib.notify({
                title = locale('title'),
                description = locale('not_enough_items'),
                type = 'error'
            })
        end

        if not client.hasSuccess() then
            return lib.notify({
                title = locale('title'),
                description = locale('clamping_welding_failed'),
                type = 'error'
            })
        end

        TriggerServerEvent('wheelclamp:setVehicleClampState', plate, false)
        lib.notify({
            title = locale('title'),
            description = locale('clamping_welding_finished'),
            type = 'success'
        })
    else
        lib.notify({
            title = locale('title'),
            description = locale('clamping_welding_cancelled'),
            type = 'error'
        })
    end
end)