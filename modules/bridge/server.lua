---@diagnostic disable-next-line: duplicate-set-field
function server.registerUsableItem()
    lib.print.warn('Usable Items are not supported with the current framework!')
end

---@diagnostic disable-next-line: duplicate-set-field
function server.GetPlayerFromId()
    lib.print.warn('GetPlayerFromId is not supported with the current framework!')
end

---@diagnostic disable-next-line: duplicate-set-field
function server.HasJob(player, name, grade)
    lib.print.warn('HasJob is not supported with the current framework!')
end

---@diagnostic disable-next-line: duplicate-set-field
function server.GetJob(player)
    lib.print.warn('getJob is not supported with the current framework!')
end

---@diagnostic disable-next-line: duplicate-set-field
function server.getVehicleClampState()
    lib.print.warn('getVehicleClampState is not supported with the current framework!')
end

---@diagnostic disable-next-line: duplicate-set-field
function server.HasItem()
    lib.print.warn('isAllowed is not supported with the current framework!')
end

---@diagnostic disable-next-line: duplicate-set-field
function server.getPlayers()
    lib.print.warn('getPlayers is not supported with the current framework!')
end

---@diagnostic disable-next-line: duplicate-set-field
function server.getJobPlayers()
    lib.print.warn('getJobPlayers is not supported with the current framework!')
end

---@diagnostic disable-next-line: duplicate-set-field
function server.setVehicleClampState()
    lib.print.warn('setVehicleClampState is not supported with the current framework!')
end

local success, result = pcall(lib.load, ('modules.bridge.%s.server'):format(shared.framework))

if not success then
    lib.print.error(result)
    lib = nil
    return
end
