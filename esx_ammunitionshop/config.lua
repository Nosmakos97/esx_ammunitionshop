Config = {}

Config.Locale = 'en'

Config.AmmunitionZones = {
	AmmunitionShops = {
		Pos = {
			{x = 12.54,  y = -1105.41, z = 29.8}
		}
	}
}

Config.KeyToOpenShop = 38
Config.ShopMarker = 27
Config.ShopMarkerColor = { r = 255, g = 255, b = 0, a = 100 }
Config.ShopMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }
Config.ShopDraw3DText = "Press ~g~[E]~s~ to purchase ~y~Ammunition~s~"
 
Config.ItemsInAmmunitionShop = {
	{ itemName = '9mm_rounds', label = '9mm Rounds', BuyInAmmunitionShop = true, BuyPrice = 10},
	{ itemName = 'shotgun_shells', label = 'Shotgun Shells', BuyInAmmunitionShop = true, BuyPrice = 25},
}

