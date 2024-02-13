---@diagnostic disable-next-line: duplicate-set-field
function client.getPlayerName()
    lib.print.warning('client.getPlayerName is not usable with this framework')
end

local success, result = pcall(lib.load, ('modules.bridge.%s.client'):format(shared.framework))

if not success then
    lib.print.error(result)
    lib = nil
    return
end