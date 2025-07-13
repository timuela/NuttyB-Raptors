local unitDefs = UnitDefs or {}

unitDefs.legendary_pulsar = {
	name = 'Legendary Pulsar',
	description = 'A pinnacle of Armada engineering that fires devastating, rapid-fire tachyon bolts.',
	buildpic = 'ARMANNIT3.DDS',
	buildtime = 280000,
	health = 75000,
	metalcost = 32000,
	energycost = 800000,
	damagemodifier = 0.15,
	energystorage = 6000,
	idleautoheal = 10,
	maxacc = 0,
	activatewhenbuilt = true,
	maxdec = 0,
	buildangle = 4096,
	canrepeat = false,
	collisionvolumeoffsets = '0 15 0',
	collisionvolumescales = '81 122 81',
	collisionvolumetype = 'Box',
	corpse = 'DEAD',
	explodeas = 'fusionExplosion',
	footprintx = 6,
	footprintz = 6,
	idletime = 1800,
	sightemitheight = 72,
	maxslope = 10,
	maxwaterdepth = 0,
	nochasecategory = 'MOBILE',
	objectname = 'Units/scavbuildings/ARMANNIT3.s3o',
	onoffable = true,
	radardistance = 1800,
	radaremitheight = 72,
	script = 'Units/ARMANNI.cob',
	usePieceCollisionVolumes = 1,
	seismicsignature = 0,
	selfdestructas = 'fusionExplosion',
	sightdistance = 1200,
	yardmap = 'oooooo oooooo oooooo oooooo oooooo oooooo',
	customparams = {
		i18n_en_humanname = 'Legendary Pulsar',
		i18n_en_tooltip = 'Fires devastating, rapid-fire tachyon bolts at extreme range.',
		usebuildinggrounddecal = true,
		buildinggrounddecaltype = 'decals/armannit3_aoplane.dds',
		buildinggrounddecalsizey = 9,
		buildinggrounddecalsizex = 9,
		buildinggrounddecaldecayspeed = 30,
		unitgroup = 'weapon',
		model_author = 'Cremuss',
		normaltex = 'unittextures/Arm_normal.dds',
		removewait = true,
		subfolder = 'ArmBuildings/LandDefenceOffence',
		techlevel = 4
	},
	featuredefs = {
		dead = {
			blocking = true,
			category = 'corpses',
			collisionvolumeoffsets = '0.0 1.06567382829e-05 -0.0',
			collisionvolumescales = '62.5 81.7362213135 62.5',
			collisionvolumetype = 'Box',
			damage = 3600,
			featuredead = 'HEAP',
			footprintx = 5,
			footprintz = 5,
			height = 20,
			metal = 11640,
			object = 'Units/scavbuildings/armannit3_dead.s3o',
			reclaimable = true
		},
		heap = {
			blocking = false,
			category = 'heaps',
			collisionvolumescales = '55.0 4.0 6.0',
			collisionvolumetype = 'cylY',
			damage = 1800,
			footprintx = 5,
			footprintz = 5,
			height = 4,
			metal = 4656,
			object = 'Units/arm3X3B.s3o',
			reclaimable = true,
			resurrectable = 0
		}
	},
	sfxtypes = {
		pieceexplosiongenerators = {
			[1] = 'deathceg2',
			[2] = 'deathceg3',
			[3] = 'deathceg4'
		}
	},
	sounds = {
		canceldestruct = 'cancel2',
		underattack = 'warning1',
		cant = {
			[1] = 'cantdo4'
		},
		count = {
			[1] = 'count6',
			[2] = 'count5',
			[3] = 'count4',
			[4] = 'count3',
			[5] = 'count2',
			[6] = 'count1'
		},
		ok = {
			[1] = 'obli'
		},
		select = {
			[1] = 'obli'
		}
	},
	weapondefs = {
		tachyon_burst_cannon = {
			name = 'Tachyon Burst Cannon',
			weapontype = 'LaserCannon',
			rgbcolor = '0.2 0.7 1.0',
			burst = 3,
			burstrate = 0.15,
			reloadtime = 1.8,
			accuracy = 400,
			areaofeffect = 128,
			range = 1800,
			energypershot = 500,
			turret = true,
			soundstart = 'annigun1',
			soundhit = 'xplolrg3',
			impulsefactor = 0,
			weaponvelocity = 1500,
			thickness = 10,
			explosiongenerator = 'custom:tachyonshot',
			damage = {
				default = 3550
			},
			allowNonBlockingAim = true,
			avoidfeature = false,
			avoidfriendly = false,
			collidefriendly = false
		}
	},
	weapons = {
		[1] = {
			def = 'tachyon_burst_cannon',
			onlytargetcategory = 'SURFACE'
		}
	}
}
unitDefs.legendary_bastion = {
	name = 'Legendary Bastion',
	description = 'The ultimate defensive emplacement. Projects a devastating, pulsating heatray.',
	health = 75000,
	metalcost = 48000,
	energycost = 1450000,
	buildtime = 180000,
	objectname = 'scavs/scavbeacon_t4.s3o',
	script = 'scavs/scavbeacon.cob',
	buildpic = 'scavengers/SCAVBEACON.DDS',
	maxacc = 0,
	activatewhenbuilt = true,
	maxdec = 0,
	buildangle = 4096,
	canrepeat = false,
	collisionvolumeoffsets = '0.0 0.0 0.0',
	collisionvolumescales = '102 151 97',
	collisionvolumetype = 'CylY',
	corpse = 'DEAD',
	damagemodifier = 0.20,
	energystorage = 1000,
	explodeas = 'largeBuildingexplosiongeneric',
	footprintx = 5,
	footprintz = 5,
	idleautoheal = 2,
	idletime = 1800,
	losemitheight = 80,
	maxslope = 10,
	maxwaterdepth = 0,
	nochasecategory = 'VTOL',
	onoffable = true,
	radardistance = 1200,
	radaremitheight = 80,
	seismicsignature = 0,
	selfdestructas = 'largeBuildingExplosionGenericSelfd',
	sightdistance = 780,
	yardmap = 'yoooy ooooo ooooo ooooo yoooy',
	customparams = {
		i18n_en_humanname = 'Legendary Bastion',
		i18n_en_tooltip = 'Projects a devastating, pulsating purple heatray.',
		maxrange = 1400,
		usebuildinggrounddecal = true,
		buildinggrounddecaltype = 'decals/legbastion_aoplane.dds',
		buildinggrounddecalsizey = 9,
		buildinggrounddecalsizex = 9,
		buildinggrounddecaldecayspeed = 30,
		unitgroup = 'weapon',
		model_author = 'Gabs',
		normaltex = 'unittextures/leg_normal.dds',
		removewait = true,
		subfolder = 'CorBuildings/LandDefenceOffence',
		techlevel = 3
	},
	featuredefs = {
		dead = {
			blocking = true,
			category = 'corpses',
			collisionvolumeoffsets = '0.0 0.0 0.0',
			collisionvolumescales = '102 151 97',
			collisionvolumetype = 'CylY',
			damage = 5400,
			featuredead = 'HEAP',
			footprintx = 3,
			footprintz = 3,
			height = 20,
			metal = 2911,
			object = 'Units/legbastion_dead.s3o',
			reclaimable = true
		},
		heap = {
			blocking = false,
			category = 'heaps',
			collisionvolumescales = '55.0 4.0 6.0',
			collisionvolumetype = 'cylY',
			damage = 2700,
			footprintx = 3,
			footprintz = 3,
			height = 4,
			metal = 1644,
			object = 'Units/cor3X3E.s3o',
			reclaimable = true,
			resurrectable = 0
		}
	},
	sfxtypes = {
		pieceexplosiongenerators = {
			[1] = 'deathceg2',
			[2] = 'deathceg3',
			[3] = 'deathceg4'
		}
	},
	sounds = {
		canceldestruct = 'cancel2',
		underattack = 'warning1',
		cant = {
			[1] = 'cantdo4'
		},
		count = {
			[1] = 'count6',
			[2] = 'count5',
			[3] = 'count4',
			[4] = 'count3',
			[5] = 'count2',
			[6] = 'count1'
		},
		ok = {
			[1] = 'doom'
		},
		select = {
			[1] = 'doom'
		}
	},
	weapondefs = {
		legendary_bastion_ray = {
			name = 'Legendary Heat Ray',
			thickness = 15,
			rgbcolor = '1.0 0.2 1.0',
			range = 1400,
			damage = {
				default = 2995,
				vtol = 15
			},
			weapontype = 'BeamLaser',
			reloadtime = 0.3,
			soundstart = 'banthie2',
			soundtrigger = true,
			areaofeffect = 120,
			avoidfeature = false,
			avoidfriendly = true,
			beamtime = 0.3,
			camerashake = 0.1,
			corethickness = 0.3,
			craterareaofeffect = 120,
			craterboost = 0,
			cratermult = 0,
			edgeeffectiveness = 0.45,
			energypershot = 500,
			explosiongenerator = 'custom:laserhit-medium-purple',
			firestarter = 90,
			firetolerance = 300,
			impulsefactor = 0,
			laserflaresize = 6,
			noselfdamage = true,
			predictboost = 0.3,
			proximitypriority = 1,
			rgbcolor2 = '0.9 1.0 0.5',
			soundhitdry = '',
			soundhitwet = 'sizzle',
			turret = true,
			weaponvelocity = 1500,
			allowNonBlockingAim = true,
			collidefriendly = false
		}
	},
	weapons = {
		[1] = {
			badtargetcategory = 'VTOL GROUNDSCOUT',
			def = 'legendary_bastion_ray',
			onlytargetcategory = 'SURFACE'
		}
	}
}
unitDefs.legendary_bulwark = {
	name = 'Legendary Bulwark',
	description = 'A pinnacle of defensive technology, the Legendary Bulwark annihilates all who approach.',
	buildpic = 'CORDOOMT3.DDS',
	buildtime = 250000,
	health = 95000,
	metalcost = 45000,
	energycost = 1250000,
	damagemodifier = 0.15,
	energystorage = 5000,
	idleautoheal = 15,
	maxacc = 0,
	activatewhenbuilt = true,
	maxdec = 0,
	buildangle = 4096,
	canrepeat = false,
	collisionvolumeoffsets = '0.0 -7.5 0.0',
	collisionvolumescales = '72.0 165.0 72.0',
	collisionvolumetype = 'box',
	corpse = 'DEAD',
	explodeas = 'fusionExplosion',
	footprintx = 6,
	footprintz = 6,
	idletime = 1800,
	sightemitheight = 80,
	maxslope = 10,
	maxwaterdepth = 0,
	nochasecategory = 'VTOL',
	objectname = 'Units/scavbuildings/CORDOOMT3.s3o',
	usePieceCollisionVolumes = 1,
	onoffable = true,
	radardistance = 1400,
	radaremitheight = 80,
	script = 'Units/CORDOOM.cob',
	seismicsignature = 0,
	selfdestructas = 'fusionExplosion',
	sightdistance = 1100,
	yardmap = 'yyooyy oooooo oooooo oooooo oooooo yyooyy',
	customparams = {
		i18n_en_humanname = 'Legendary Bulwark',
		i18n_en_tooltip = 'The ultimate defensive structure.',
		usebuildinggrounddecal = true,
		buildinggrounddecaltype = 'decals/cordoomt3_aoplane.dds',
		buildinggrounddecalsizey = 9,
		buildinggrounddecalsizex = 9,
		buildinggrounddecaldecayspeed = 30,
		unitgroup = 'weapon',
		model_author = 'Mr Bob',
		normaltex = 'unittextures/cor_normal.dds',
		removewait = true,
		paralyzemultiplier = 0.2,
		subfolder = 'CorBuildings/LandDefenceOffence',
		techlevel = 4
	},
	featuredefs = {
		dead = {
			blocking = true,
			category = 'corpses',
			collisionvolumeoffsets = '0.281730651855 -0.153618286133 3.57356262207',
			collisionvolumescales = '80.6815948486 91.7637634277 82.1471252441',
			collisionvolumetype = 'Box',
			damage = 10800,
			featuredead = 'HEAP',
			footprintx = 5,
			footprintz = 5,
			height = 20,
			metal = 9666,
			object = 'Units/scavbuildings/cordoomt3_dead.s3o',
			reclaimable = true
		},
		heap = {
			blocking = false,
			category = 'heaps',
			collisionvolumescales = '55.0 4.0 6.0',
			collisionvolumetype = 'cylY',
			damage = 5400,
			footprintx = 5,
			footprintz = 5,
			height = 4,
			metal = 3864,
			object = 'Units/cor3X3E.s3o',
			reclaimable = true,
			resurrectable = 0
		}
	},
	sfxtypes = {
		pieceexplosiongenerators = {
			[1] = 'deathceg2',
			[2] = 'deathceg3',
			[3] = 'deathceg4'
		}
	},
	sounds = {
		canceldestruct = 'cancel2',
		underattack = 'warning1',
		cant = {
			[1] = 'cantdo4'
		},
		count = {
			[1] = 'count6',
			[2] = 'count5',
			[3] = 'count4',
			[4] = 'count3',
			[5] = 'count2',
			[6] = 'count1'
		},
		ok = {
			[1] = 'armag'
		},
		select = {
			[1] = 'armag'
		}
	},
	weapondefs = {
		legendary_overload_scatter = {
			name = 'Overload Scatter Beamer',
			weapontype = 'BeamLaser',
			range = 1500,
			reloadtime = 0.1,
			sprayangle = 3000,
			projectiles = 12,
			rgbcolor = '0.8 0.1 1.0',
			accuracy = 50,
			allowNonBlockingAim = true,
			areaofeffect = 10,
			beamdecay = 0.05,
			beamtime = 0.1,
			beamttl = 1,
			corethickness = 0.25,
			burnblow = true,
			cylindertargeting = 1,
			edgeeffectiveness = 0.15,
			explosiongenerator = 'custom:laserhit-medium-purple',
			firestarter = 100,
			impulsefactor = 0.123,
			intensity = 0.7,
			laserflaresize = 9.35,
			noselfdamage = true,
			soundhitwet = 'sizzle',
			soundstart = 'beamershot2',
			tolerance = 5000,
			thickness = 6,
			turret = true,
			weaponvelocity = 1000,
			damage = {
				default = 500
			},
			avoidfeature = false,
			avoidfriendly = false,
			collidefriendly = false
		},
		legendary_heat_ray = {
			name = 'Armageddon Heat Ray',
			weapontype = 'BeamLaser',
			range = 1300,
			reloadtime = 4.0,
			areaofeffect = 72,
			avoidfeature = false,
			beamtime = 0.6,
			cameraShake = 350,
			corethickness = 0.40,
			craterareaofeffect = 72,
			energypershot = 1200,
			explosiongenerator = 'custom:genericshellexplosion-medium-beam',
			impulsefactor = 0,
			largebeamlaser = true,
			laserflaresize = 8.8,
			noselfdamage = true,
			rgbcolor = '1 0.8 0',
			rgbcolor2 = '0.8 0 0',
			scrollspeed = 5,
			soundhitdry = '',
			soundhitwet = 'sizzle',
			soundstart = 'heatray2xl',
			soundtrigger = 1,
			thickness = 7,
			tolerance = 10000,
			turret = true,
			weaponvelocity = 1800,
			damage = {
				default = 10000,
				commanders = 1350
			},
			allowNonBlockingAim = true,
			avoidfriendly = false,
			collidefriendly = false
		},
		legendary_point_defense = {
			name = 'Point Defense Laser',
			weapontype = 'BeamLaser',
			range = 750,
			reloadtime = 0.5,
			areaofeffect = 12,
			avoidfeature = false,
			beamtime = 0.3,
			corethickness = 0.32,
			energypershot = 500,
			explosiongenerator = 'custom:laserhit-large-blue',
			firestarter = 90,
			impactonly = 1,
			impulsefactor = 0,
			largebeamlaser = true,
			laserflaresize = 8.8,
			noselfdamage = true,
			proximitypriority = 0,
			rgbcolor = '0 0 1',
			soundhitdry = '',
			soundhitwet = 'sizzle',
			soundstart = 'annigun1',
			soundtrigger = 1,
			texture3 = 'largebeam',
			thickness = 5.5,
			tilelength = 150,
			tolerance = 10000,
			turret = true,
			weaponvelocity = 1500,
			damage = {
				default = 500,
				commanders = 999
			},
			allowNonBlockingAim = true,
			avoidfriendly = false,
			collidefriendly = false
		}
	},
	weapons = {
		[1] = {
			def = 'legendary_overload_scatter'
		},
		[2] = {
			def = 'legendary_heat_ray'
		},
		[3] = {
			def = 'legendary_point_defense'
		}
	}
}

local builders = {
	'armcom',
	'corcom',
	'legcom',
	'legcomt2com'
}
for i = 1, 10 do
	for _, faction in pairs {'arm', 'cor', 'leg'} do
		local comName = faction .. 'comlvl' .. i
		table.insert(builders, comName)
	end
end

for _, builder in ipairs(builders) do
	if unitDefs[builder] then
		local faction = string.sub(builder, 1, 3)
		table.insert(unitDefs[builder].buildoptions, faction == 'arm' and 'legendary_pulsar' or faction == 'cor' and 'legendary_bulwark' or 'legendary_bastion')
	end
end
