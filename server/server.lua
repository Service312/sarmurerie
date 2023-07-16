ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterNetEvent('serv:Arme')
AddEventHandler('serv:Arme', function(Nom, Arme, Price)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local gun = Arme
    if xPlayer.getMoney() >= Price then 
        xPlayer.removeMoney(Price)
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Armurerie', nil, "Vous venez d\'acheter ~p~1x~s~ "..Nom.." ~s~pour ~r~"..Price.."$ ~s~!", 'CHAR_ACTING_UP', 1)
        TriggerClientEvent('serv:giveArme', _src, gun)
    else 
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Armurerie', nil, "~r~Vous n\'avez pas suffisament d\'argent !", 'CHAR_ACTING_UP', 1)
    end
end)