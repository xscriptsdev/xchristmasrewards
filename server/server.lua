ESX = nil
QBCore = nil


if GetResourceState('es_extended') == 'started' then
    ESX = exports["es_extended"]:getSharedObject()
elseif GetResourceState('qb-core') == 'started' then
    QBCore = exports['qb-core']:GetCoreObject()
end


local function fetchScalar(query, params, cb)
    if Config.DatabaseSystem == 'oxmysql' then
        exports.oxmysql:scalar(query, params, cb)
    elseif Config.DatabaseSystem == 'mysql-async' then
        MySQL.Async.fetchScalar(query, params, cb)
    end
end

local function execute(query, params)
    if Config.DatabaseSystem == 'oxmysql' then
        exports.oxmysql:execute(query, params)
    elseif Config.DatabaseSystem == 'mysql-async' then
        MySQL.Async.execute(query, params)
    end
end


local function hasUsedReward(identifier, cb)
    if Config.AllowMultipleUses then
        cb(false)
        return
    end

    fetchScalar('SELECT 1 FROM christmas_rewards WHERE identifier = ?', {identifier}, function(result)
        cb(result ~= nil)
    end)
end


local function markRewardUsed(identifier)
    execute('INSERT INTO christmas_rewards (identifier) VALUES (?)', {identifier})
end

RegisterNetEvent('xchristmasrewards:giveReward', function(chosenNumber)
    local playerId = source
    local identifier

    if ESX then
        local xPlayer = ESX.GetPlayerFromId(playerId)
        identifier = xPlayer.identifier
    elseif QBCore then
        local Player = QBCore.Functions.GetPlayer(playerId)
        identifier = Player.PlayerData.citizenid
    end

    if not identifier then return end

    hasUsedReward(identifier, function(alreadyUsed)
        if alreadyUsed then
            TriggerClientEvent('ox_lib:notify', playerId, {type = 'error', description = Config.AlreadyClaimed})
            return
        end

        local reward = Config.Rewards[chosenNumber]

        if not reward then
            TriggerClientEvent('ox_lib:notify', playerId, {type = 'error', description = Config.InvalidReward})
            return
        end

        if reward.type == 'money' then
            if ESX then
                local xPlayer = ESX.GetPlayerFromId(playerId)
                xPlayer.addMoney(reward.value)
            elseif QBCore then
                local Player = QBCore.Functions.GetPlayer(playerId)
                Player.Functions.AddMoney('cash', reward.value)
            end
            TriggerClientEvent('ox_lib:notify', playerId, {type = 'success', description = Config.Received .. reward.value})
        
        elseif reward.type == 'item' then
            if ESX then
                local xPlayer = ESX.GetPlayerFromId(playerId)
                xPlayer.addInventoryItem(reward.item, reward.count)
            elseif QBCore then
                local Player = QBCore.Functions.GetPlayer(playerId)
                Player.Functions.AddItem(reward.item, reward.count)
            end
            TriggerClientEvent('ox_lib:notify', playerId, {type = 'success', description = Config.YouReceived .. reward.count .. 'x ' .. reward.item})
        
        elseif reward.type == 'weapon' then
            if ESX then
                local xPlayer = ESX.GetPlayerFromId(playerId)
                xPlayer.addInventoryItem(reward.weapon, 1)
            elseif QBCore then
                local Player = QBCore.Functions.GetPlayer(playerId)
                Player.Functions.AddItem(reward.weapon, 1) 
            end
            TriggerClientEvent('ox_lib:notify', playerId, {type = 'success', description = Config.YouReceivedAweapon .. reward.weapon})
        
        else
            TriggerClientEvent('ox_lib:notify', playerId, {type = 'error', description = Config.InvalidRewardType})
        end

        
        markRewardUsed(identifier)
    end)
end)

RegisterCommand('christmasreward', function(source)
    local playerId = source
    TriggerClientEvent('xchristmasrewards:openRewardDialog', playerId)
end)
