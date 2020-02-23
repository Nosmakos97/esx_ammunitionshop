# esx_ammunitionshop

## [REQUIREMENTS]

- ES_EXTENDED

- pNotify = https://forum.cfx.re/t/release-pnotify-in-game-js-notifications-using-noty/20659

- MYSQL

## Default Location ##

[ 22.41, y = -1110.33, z = 29.8 ]

If the Config.Locale = ‘en’ language will always be set as ‘en’ than the language you choosed, you can always
manually edit the ‘en’ language file and use your language there.

#ItemsInAmmunitionShop Config option also allows you to sell any ammunition you pleased.
You should add the weapon names as ammunition types:

{ itemName = ‘WEAPON_PISTOL’, label = ‘Pistol’, BuyInAmmunitionShop = true, BuyPrice = 10},

If the Config.Locale = 'en' language will always be set as 'en' than the language you choosed, you can always
manually edit the 'en' language file and use your language there.


## [Permitted Limit] ##
Permitted Limit is 1500, to change that, open server/server.lua and just change the 1500 values to your own permitted limit.

 
#ItemsInAmmunitionShop Config option also allows you to sell any item you pleased, not only ammunition types.


## [Installation] ##

1. Place esx_ammunitionshop resource inside [ESX] directory.

2. Add start ammunitionshop on server.cfg

3. Start server!
