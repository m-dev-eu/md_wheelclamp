if not lib then return end
lib.locale()

require 'modules.bridge.client'
require 'modules.wheelClamp.client'
require 'modules.clampRemoval.client'
require 'modules.welder.client'

function client.hasSuccess()
	return math.random(1, 10) <= 3
end

function client.hasLowerSuccess()
	return math.random(1, 12) <= 3
end

function client.raycast(flag, destination, size)
	local playerCoords = GetEntityCoords(cache.ped)
	destination = destination or GetOffsetFromEntityInWorldCoords(cache.ped, 0.0, 2.2, -0.25)
	local rayHandle = StartShapeTestCapsule(playerCoords.x, playerCoords.y, playerCoords.z + 0.5, destination.x, destination.y, destination.z, size or 2.2, flag or 30, cache.ped, 4)
	while true do
		Wait(0)
		local result, _, coords, _, entityHit = GetShapeTestResult(rayHandle)
		if result ~= 1 then
            --DrawLine(playerCoords.x, playerCoords.y, playerCoords.z + 0.5, destination.x, destination.y, destination.z, 0, 0, 255, 255)
            --DrawLine(playerCoords.x, playerCoords.y, playerCoords.z + 0.5, coords.x, coords.y, coords.z, 255, 0, 0, 255)
			local entityType
			if entityHit then entityType = GetEntityType(entityHit) end
			if entityHit and entityType ~= 0 then
				return entityHit, entityType
			end
			return false
		end
	end
end

function client.getVehiclePlate(entity)
	return DoesEntityExist(entity) and string.strtrim(GetVehicleNumberPlateText(entity))
end

---https://docs.fivem.net/natives/?_0x29439776AAA00A62
local blacklisted = {13, 14, 15, 16, 18, 19, 21}
function client.isVehicleBlacklisted(entity)
	return blacklisted[GetVehicleClass(entity)]
end

lib.onCache('vehicle', function (value)
    if not value then return end

    SetTimeout(0, function ()
        local plate = client.getVehiclePlate(value)

		local currentState = lib.callback.await('wheelclamp:checkClampState', false, plate)
        if currentState then
            lib.notify({
                title = locale('title'),
                description = locale('vehicle_cannot_be_driven'),
                type = 'error'
            })

            TaskLeaveVehicle(cache.ped, value, 0)
        end
    end)
end)