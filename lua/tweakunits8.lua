--T4 Eco
return {
	lootboxplatinum = {
		buildtime = 1000000,
		energycost = 500000,
		metalcost = 97000,
		buildpic = 'other/resourcecheat.dds',
		energymake = 30000,
		metalmake = 0,
		explodeas = 'korgExplosionSelfd',
		energystorage = 90000,
		health = 10000,
		reclaimable = true,
		customparams = {
			i18n_en_humanname = 'Super Fusion Reactor',
			i18n_en_tooltip = 'Produces 30000 Energy, Transportable (Very Hazardous)'
		}
	},
	armdf = {
		activatewhenbuilt = true,
		buildtime = 313000,
		buildpic = 'lootboxes/LOOTBOXGOLD.DDS',
		health = 1000,
		explodeas = 'fusionExplosion',
		selfdestructas = 'fusionExplosionSelfd',
		energycost = 500000,
		metalcost = 8000,
		objectname = 'Units/CORUWFUS.s3o',
		script = 'Units/CORUWFUS.cob',
		maxwaterdepth = 20,
		energymake = 0,
		featuredefs = {
			dead = {
				blocking = true,
				category = 'corpses',
				collisionvolumeoffsets = '1.8653717041 -0.0807505981445 0.994560241699',
				collisionvolumescales = '89.9762878418 27.3368988037 72.5986480713',
				collisionvolumetype = 'Box',
				damage = 3210,
				featuredead = 'HEAP',
				footprintx = 5,
				footprintz = 5,
				height = 20,
				metal = 3099,
				object = 'Units/coruwfus_dead.s3o',
				reclaimable = true
			},
			heap = {
				blocking = false,
				category = 'heaps',
				damage = 1605,
				footprintx = 5,
				footprintz = 5,
				height = 4,
				metal = 1240,
				object = 'Units/cor5X5A.s3o',
				reclaimable = true,
				resurrectable = 0
			}
		},
		customparams = {
			energyconv_capacity = 5000,
			energyconv_efficiency = 0.02500,
			i18n_en_humanname = 'Super Energy Converter',
			i18n_en_tooltip = 'Converts 5000 energy into 125 metal per sec'
		}
	},
	armaca = {
		buildoptions = {
			[34] = 'lootboxplatinum',
			[35] = 'armdf'
		}
	},
	armack = {
		buildoptions = {
			[31] = 'lootboxplatinum',
			[32] = 'armdf'
		}
	},
	armacv = {
		buildoptions = {
			[31] = 'lootboxplatinum',
			[32] = 'armdf'
		}
	},
	coraca = {
		buildoptions = {
			[33] = 'lootboxplatinum',
			[34] = 'armdf'
		}
	},
	corack = {
		buildoptions = {
			[30] = 'lootboxplatinum',
			[31] = 'armdf'
		}
	},
	coracv = {
		buildoptions = {
			[30] = 'lootboxplatinum',
			[31] = 'armdf'
		}
	},
	legaca = {
		buildoptions = {
			'legfus',
			'legafus',
			'legageo',
			'coruwageo',
			'legrampart',
			'legmoho',
			'cormexp',
			'cormmkr',
			'coruwadves',
			'legamstor',
			'corarad',
			'corshroud',
			'legforti',
			'corasp',
			'corfasp',
			'cortarg',
			'corsd',
			'corgate',
			'legacluster',
			'legbombard',
			'legbastion',
			'legflak',
			'leglraa',
			'legperdition',
			'legabm',
			'legsilo',
			'leglrpc',
			'legstarfall',
			'legap',
			'legaap',
			'corplat',
			'leggant',
			'lootboxplatinum',
			'armdf'
		}
	},
	legack = {
		buildoptions = {
			'legfus',
			'legafus',
			'leggant',
			'legageo',
			'legrampart',
			'legmoho',
			'cormexp',
			'cormmkr',
			'coruwadves',
			'legamstor',
			'corarad',
			'corshroud',
			'legforti',
			'corasp',
			'cortarg',
			'corsd',
			'corgate',
			'legacluster',
			'legbombard',
			'legbastion',
			'legflak',
			'leglraa',
			'legperdition',
			'legabm',
			'legsilo',
			'leglrpc',
			'legstarfall',
			'leglab',
			'legalab',
			'lootboxplatinum',
			'armdf'
		}
	},
	legacv = {
		buildoptions = {
			[30] = 'lootboxplatinum',
			[31] = 'armdf'
		}
	}
}
