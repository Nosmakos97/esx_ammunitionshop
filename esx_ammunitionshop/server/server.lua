local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx_ammunitionshop:BuyItem")
AddEventHandler("esx_ammunitionshop:BuyItem", function(amountToBuy,totalBuyPrice,weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)

	if amountToBuy <= 100 then
		if xPlayer.getWeapon(weaponName) then
			if xPlayer.getMoney() >= totalBuyPrice then
				local weaponLabel = ESX.GetWeaponLabel(weaponName)
				
				xPlayer.removeMoney(totalBuyPrice)

				xPlayer.addWeapon(weaponName, amountToBuy)

				TriggerClientEvent("esx:showNotification",source,_U('bought') .. " "..amountToBuy.."x ".. weaponLabel .. " " .. _U('ammunition').." " .. _U('for') .. " "..totalBuyPrice.." €")
			else
				TriggerClientEvent("esx:showNotification",source,_U('not_enough_money'))
			end
		else
			TriggerClientEvent("esx:showNotification",source,_U('not_specific_weapon'))
		end
	else
		TriggerClientEvent("esx:showNotification",source,_U('purchase_limit_warning'))
	end
end)