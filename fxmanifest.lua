fx_version 'cerulean'
games { 'gta5' }
use_experimental_fxv2_oal 'yes'
lua54 'yes'

author 'm-dev.eu'
description 'Wheelclamp'
version '1.1'

dependencies {
    'oxmysql',
    'ox_lib',
}

shared_script '@ox_lib/init.lua'

client_script 'init.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'init.lua'
}

files {
    'locales/*.json',
    'data/*.*',
    'client.lua',
    'modules/**/client.lua',
}

-- setr mdevelopment:framework "esx"