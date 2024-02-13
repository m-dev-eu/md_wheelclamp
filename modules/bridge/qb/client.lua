local QBCore = exports['qb-core']:GetCoreObject()

---@diagnostic disable-next-line: duplicate-set-field
function client.getPlayerName()
    return QBCore.Functions.GetPlayerData().charinfo.firstname .. ' ' .. QBCore.Functions.GetPlayerData().charinfo.lastname
end