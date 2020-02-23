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

				TriggerClientEvent("pNotify:SendNotification", source, {
					text = _U('bought') .. " "..amountToBuy.."x ".. weaponLabel .. " " .. _U('ammunition').." " .. _U('for') .. " "..totalBuyPrice.." €",type = "success",queue = "ammunition",timeout = 2500,
					layout = "bottomCenter"
				})

			else
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = _U('not_enough_money') ,type = "error",queue = "ammunition",timeout = 2500,
					layout = "bottomCenter"
				})
			end
		else
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = _U('not_specific_weapon') ,type = "error",queue = "ammunition",timeout = 2500,
				layout = "bottomCenter"
			})
		end
	else
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = _U('purchase_limit_warning') ,type = "error",queue = "ammunition",timeout = 2500,
			layout = "bottomCenter"
		})
	end
end)
