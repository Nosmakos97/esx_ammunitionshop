Config = {}

Config.Locale = 'en'

Config.AmmunitionZones = {
	AmmunitionShops = {
		Pos = {
			{x = 22.41,  y = -1110.33, z = 29.8}
		}
	}
}

Config.KeyToOpenShop = 38
Config.ShopMarker = 27
Config.ShopMarkerColor = { r = 255, g = 255, b = 0, a = 100 }
Config.ShopMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }
Config.ShopDraw3DText = "Press ~g~[E]~s~ to purchase ~y~Ammunition~s~"
 
Config.ItemsInAmmunitionShop = {
	{ itemName = 'WEAPON_PISTOL', label = 'Pistol', BuyInAmmunitionShop = true, BuyPrice = 10},
	{ itemName = 'WEAPON_PISTOL_MK2', label = 'Pistol II', BuyInAmmunitionShop = true, BuyPrice = 12},
	{ itemName = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', BuyInAmmunitionShop = true, BuyPrice = 15},
	{ itemName = 'WEAPON_APPISTOL', label = 'AP-Pistol', BuyInAmmunitionShop = true, BuyPrice = 25},
	{ itemName = 'WEAPON_ASSAULTRIFLE', label = 'Assault Rifle', BuyInAmmunitionShop = true, BuyPrice = 35},
	{ itemName = 'WEAPON_ASSAULTRIFLE_MK2', label = 'Assault Rifle Mk II', BuyInAmmunitionShop = true, BuyPrice = 35},
	{ itemName = 'WEAPON_CARBINERIFLE', label = 'Carbine Rifle', BuyInAmmunitionShop = true, BuyPrice = 35},
	{ itemName = 'WEAPON_CARBINERIFLE_MK2', label = 'Carbine Rifle Mk II', BuyInAmmunitionShop = true, BuyPrice = 35},
}

