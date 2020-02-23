ESX = nil
local insideMarker = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

-- Core Thread Function:
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.AmmunitionZones) do
			for i = 1, #v.Pos, 1 do
				local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.ShopMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.975, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.ShopMarkerScale.x, Config.ShopMarkerScale.y, Config.ShopMarkerScale.z, Config.ShopMarkerColor.r,Config.ShopMarkerColor.g,Config.ShopMarkerColor.b,Config.ShopMarkerColor.a, false, true, 2, true, false, false, false)						
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.ShopDraw3DText)
					if IsControlJustPressed(0, Config.KeyToOpenShop) then
						AmmunitionShopMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
	end
end)

AmmunitionShopMenu = function()
	local player = PlayerPedId()
	FreezeEntityPosition(player,true)
	
	local elements = {
		{ label = _U("main_option_title"), action = "ammunition_buy_menu" },
	}
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_ammunition_main_menu",
		{
			title    = _U("title"),
			align    = "top-right",
			elements = elements
		},
	function(data, menu)
		local action = data.current.action

		if action == "ammunition_buy_menu" then
			AmmunitionShopBuyMenu()
		end	
	end, function(data, menu)
		menu.close()
		insideMarker = false
		FreezeEntityPosition(player,false)
	end, function(data, menu)
	end)
end

function AmmunitionShopBuyMenu()
	local player = PlayerPedId()
	FreezeEntityPosition(player,true)
	local elements = {}
			
	for k,v in pairs(Config.ItemsInAmmunitionShop) do
		if v.BuyInAmmunitionShop == true then
			table.insert(elements,{label = v.label .. " | "..('<span style="color:gray;">%s</span>'):format("  x1 - "..v.BuyPrice..".00 €"), itemName = v.itemName, BuyInAmmunitionShop = v.BuyInAmmunitionShop, BuyPrice = v.BuyPrice})
		end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_ammunition_buy_menu",
		{
			title    = _U("title"),
			align    = "top-right",
			elements = elements
		},
	function(data, menu)
			if data.current.itemName == data.current.itemName then
				OpenBuyDialogMenu(data.current.itemName,data.current.BuyPrice)
			end	
	end, function(data, menu)
		menu.close()
		insideMarker = false
		FreezeEntityPosition(player,false)
	end, function(data, menu)
	end)
end

function OpenBuyDialogMenu(itemName, BuyPrice)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'esx_ammunitionshop_amount_to_buy_dialog', {
		title = _U("purchase_amount")
	}, function(data, menu)
		menu.close()
		amountToBuy = tonumber(data.value)
		totalBuyPrice = (BuyPrice * amountToBuy)
		TriggerServerEvent("esx_ammunitionshop:BuyItem",amountToBuy,totalBuyPrice,itemName)
	end,
	function(data, menu)
		menu.close()	
	end) 
end

-- Function for 3D text:
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end
