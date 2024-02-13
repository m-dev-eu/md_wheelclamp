local QBCore = exports['qb-core']:GetCoreObject()

---@diagnostic disable-next-line: duplicate-set-field
function server.registerUsableItem(itemName, cb)
    QBCore.Functions.CreateUseableItem(itemName, cb)
end

---@diagnostic disable-next-line: duplicate-set-field
function server.GetPlayerFromId(id)
    local player = QBCore.Functions.GetPlayer(id)
    player.source = player.PlayerData.sourced
    return player
end

---@diagnostic disable-next-line: duplicate-set-field
function server.HasJob(player, name, grade)
    grade = grade or 0
    return player.job.name == name and player.job.grade >= grade
end

---@diagnostic disable-next-line: duplicate-set-field
function server.GetJob(player)
    return player.job.name, player.job.grade
end

---@diagnostic disable-next-line: duplicate-set-field
function server.getVehicleClampState(plate)
    return MySQL.scalar.await('SELECT `wheel_clamp` FROM `player_vehicles` WHERE `plate` = ?', { plate }) --[[@as boolean]]
end

---@diagnostic disable-next-line: duplicate-set-field
function server.HasItem(player, name, count, remove)
    local hasItem = QBCore.Functions.HasItem(player.source, name, 1)
    if hasItem and remove then
        exports.qb_inventory:RemoveItem(player.source, name, 1)
    end

    return hasItem
end

---@diagnostic disable-next-line: duplicate-set-field
function server.getPlayers()
    return QBCore.Functions.GetQBPlayers()
end

---@diagnostic disable-next-line: duplicate-set-field
function server.getJobPlayers(job)
    return QBCore.Functions.GetPlayersOnDuty(job)
end

---@diagnostic disable-next-line: duplicate-set-field
function server.setVehicleClampState(plate, state)
    MySQL.execute.await('UPDATE `player_vehicles` SET `wheel_clamp` = ? WHERE `plate` = ?', { state, plate })
end

MySQL.ready(function ()
    MySQL.update.await('ALTER TABLE `player_vehicles` ADD IF NOT EXISTS `wheel_clamp` BOOLEAN NOT NULL DEFAULT false;')
end)