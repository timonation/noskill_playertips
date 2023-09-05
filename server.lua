ESX = exports["es_extended"]:getSharedObject()

local function selectNotification()
    return Config.Tips[math.random(#Config.Tips)]
end

local function triggerNotification()
    local notification = selectNotification()
    if Config.NotifySystem == 'esx' then
    TriggerClientEvent('esx:showNotification', -1, notification)
    else
    TriggerClientEvent('okokNotify:Alert', -1, 'Wusstest du schon?', notification, Config.NotifyTime*1000, 'info')
    end
end

Citizen.CreateThread(function()
    while true do
        triggerNotification()
        Citizen.Wait(Config.TimeInterval*60000)
    end
end)