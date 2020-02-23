local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx_ammunitionshop:BuyItem")
AddEventHandler("esx_ammunitionshop:BuyItem", function(amountToBuy,totalBuyPrice,itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local itemLabel = ESX.GetItemLabel(itemName)

	if amountToBuy < 1500 then
		if xPlayer.getInventoryItem(itemName).count + amountToBuy  <= 1500 then
			if xPlayer.getMoney() >= totalBuyPrice then
	
				xPlayer.removeMoney(totalBuyPrice)
				xPlayer.addInventoryItem(itemName, amountToBuy)
		
				TriggerClientEvent("pNotify:SendNotification", -1, {
					text = _U('bought') .. " "..amountToBuy.."x "..itemLabel.." " .. _U('for') .. " "..totalBuyPrice.." €",type = "success",queue = "ammunition",timeout = 2500,
					layout = "centerLeft"
				})
			else
				TriggerClientEvent("pNotify:SendNotification", -1, {text = _U('not_enough_money'),type = "error",queue = "ammunition",timeout = 2500,
					layout = "centerLeft"
				})
			end
		else
		TriggerClientEvent("pNotify:SendNotification", -1, {text = _U('purchase_limit_warning'),type = "error",queue = "ammunition",timeout = 2500,
			layout = "centerLeft"
		})
		end
	else
		TriggerClientEvent("pNotify:SendNotification", -1, {text = _U('purchase_limit_warning'),type = "error",queue = "ammunition",timeout = 2500,
			layout = "centerLeft"
		})
	end
end)