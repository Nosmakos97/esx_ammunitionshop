resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'ESX Ammunition Store'

client_scripts {
    '@es_extended/locale.lua',
    'languages/en.lua',
    'languages/gr.lua',
    "config.lua",
    "client/client.lua"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    '@es_extended/locale.lua',
    'languages/en.lua',
    'languages/gr.lua',
    "config.lua",
    "server/server.lua"
}