fx_version 'cerulean'

game 'gta5'

author 'Mfrouk'
description 'OX_inventory discord logs'

version '1.0.0'

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'shared/sh_config.lua',
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/CircleZone.lua',
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}

files {
	'locales/*.json'
}

escrow_ignore {
	'shared/*.lua',
	'client/cl_Utils.lua',
	'server/sv_Utils.lua',
}
