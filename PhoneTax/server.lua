local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

Citizen.CreateThread(function()

    while true do 

        for k, playerid in pairs(GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(playerid)
            if xPlayer.getInventoryItem("phone") ~= nil then
                local phoneCount = xPlayer.getInventoryItem("phone").count
                if phoneCount > 0 then
                    -- PhoneTax gets paid
                    local price = 50
                    xPlayer.removeAccountMoney('bank', price)
                    TriggerClientEvent('PhoneTax:picturemsg', xPlayer.source, 'CHAR_CHAT_CALL', '>You paid ~g~' .. price .. '$ ~s~for your ~g~phonetax', 'PhoneTax', 'Paid fees')
                end
            end
        end

        Citizen.Wait(1800000)
    end

end)