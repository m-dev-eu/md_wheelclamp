local ESX = exports.es_extended:getSharedObject()

---@diagnostic disable-next-line: duplicate-set-field
function server.registerUsableItem(itemName, cb)
    ESX.RegisterUsableItem(itemName, cb)
end

---@diagnostic disable-next-line: duplicate-set-field
function server.GetPlayerFromId(id)
    return ESX.GetPlayerFromId(id)
end

---@diagnostic disable-next-line: duplicate-set-field
function server.HasJob(player, name, grade)
    grade = grade or 0
    return player.getJob().name == name and player.getJob().grade >= grade
end

---@diagnostic disable-next-line: duplicate-set-field
function server.GetJob(player)
    return player.getJob().name, player.getJob().grade
end

---@diagnostic disable-next-line: duplicate-set-field
function server.getVehicleClampState(plate)
    return MySQL.scalar.await('SELECT `wheel_clamp` FROM `owned_vehicles` WHERE `plate` = ?', { plate }) --[[@as boolean]]
end

---@diagnostic disable-next-line: duplicate-set-field
function server.HasItem(player, name, count, remove)
    local hasItem = player.getInventoryItem(name).count > 0
    if hasItem and remove then
        player.removeInventoryItem(name, 1)
    end

    return hasItem
end

---@diagnostic disable-next-line: duplicate-set-field
function server.getPlayers()
    return ESX.GetExtendedPlayers()
end

---@diagnostic disable-next-line: duplicate-set-field
function server.getJobPlayers(job)
    return ESX.GetExtendedPlayers('job', job)
end

---@diagnostic disable-next-line: duplicate-set-field
function server.setVehicleClampState(plate, state)
    MySQL.update.await('UPDATE `owned_vehicles` SET `wheel_clamp` = ? WHERE `plate` = ?', { state, plate })
end

MySQL.ready(function ()
    MySQL.update.await('ALTER TABLE `owned_vehicles` ADD IF NOT EXISTS `wheel_clamp` BOOLEAN NOT NULL DEFAULT false;')
end)