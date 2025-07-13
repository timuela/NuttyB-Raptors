--NuttyB v1.52 Cortex Com
-- Authors: ChrispyNut, BackBash
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
return {
	corcom = {
		customparams = {
			evolution_announcement = 'Cor Commanders upgraded',
			evolution_announcement_size = 18.5,
			evolution_target = 'corcomlvl2',
			evolution_condition = 'timer',
			evolution_timer = 420, -- Adjusted timer value
			combatradius = 0,
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		autoheal = 80,
		speed = 45,
		energymake = 75,
		metalmake = 6,
		health = 5500,
		buildoptions = (function()
			local result, seen, additional = {}, {}, {
				'corhllt',
				'cornecro',
				'corlevlr',
				'corak',
				'cormaw'
			}
			local function addUnique(option)
				if not seen[option] then
					seen[option] = true
					result[#result + 1] = option
				end
			end
			-- Add original base game corcom buildoptions
			for _, option in pairs(UnitDefs.corcom.buildoptions) do
				addUnique(option)
			end
			-- Add mod-specific additional buildoptions
			for _, option in pairs(additional) do
				addUnique(option)
			end
			return result
		end)(),
		weapondefs = {
			corcomlaser = {
				range = 370,
				damage = {
					bombers = 180,
					default = 260,
					fighters = 110,
					subs = 5
				}
			},
			disintegrator = {
				energypershot = 1000,
				reloadtime = 8
			}
		}
	},
	corcomlvl2 = {
		speed = 62,
		health = 8500,
		energymake = 255,
		metalmake = 16,
		autoheal = 300,
		builddistance = 200,
		workertime = 600,
		buildoptions = (function()
			local result, seen, additional = {}, {}, {
				'corsolar',
				'coradvsol',
				'corwin',
				'corgeo',
				'cormstor',
				'corestor',
				'cormex',
				'corexp',
				'cormakr',
				'corcan',
				'correap',
				'corlab',
				'corvp',
				'corap',
				'corhp',
				'cornanotc',
				'coreyes',
				'corrad',
				'cordrag',
				'cormaw',
				'corllt',
				'corhllt',
				'corhlt',
				'corpun',
				'corrl',
				'cormadsam',
				'corerad',
				'cordl',
				'corjamt',
				'corjuno',
				'corsy',
				'coruwgeo',
				'corfasp',
				'cornerco',
				'coruwes',
				'corplat',
				'corfhp',
				'coruwms',
				'corfhlt',
				'cornanotcplat',
				'corfmkr',
				'cortide',
				'corfrad',
				'corfrt',
				'corfdrag',
				'cortl',
				'cornecro'
			}
			local function addUnique(option)
				if not seen[option] then
					seen[option] = true
					result[#result + 1] = option
				end
			end
			-- Add original base game corcomlvl2 buildoptions
			for _, option in pairs(UnitDefs.corcomlvl2.buildoptions) do
				addUnique(option)
			end
			-- Add mod-specific additional buildoptions
			for _, option in pairs(additional) do
				addUnique(option)
			end
			return result
		end)(),
		customparams = {
			evolution_announcement = 'Combat Commanders upgraded',
			evolution_announcement_size = 18.5,
			evolution_target = 'corcomlvl3',
			evolution_condition = 'timer',
			evolution_timer = 900,
			combatradius = 0,
			shield_power = 500,
			shield_radius = 100,
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		weapondefs = {
			armcomlaser = {
				areaofeffect = 16,
				avoidfeature = false,
				beamtime = 0.1,
				corethickness = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 1,
				explosiongenerator = 'custom:laserhit-small-red',
				firestarter = 70,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 7.7,
				name = 'Light close-quarters g2g/g2a laser',
				noselfdamage = true,
				range = 500,
				reloadtime = 0.4,
				rgbcolor = '0.6 0.3 0.8',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrfir1',
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 4,
				tolerance = 10000,
				turret = true,
				weapontype = 'BeamLaser',
				weaponvelocity = 900,
				damage = {
					bombers = 180,
					default = 1500,
					fighters = 110,
					subs = 5
				}
			},
			disintegrator = {
				areaofeffect = 36,
				avoidfeature = false,
				avoidfriendly = false,
				avoidground = false,
				bouncerebound = 0,
				cegtag = 'dgunprojectile',
				commandfire = true,
				craterboost = 0,
				cratermult = 0.15,
				edgeeffectiveness = 0.15,
				energypershot = 500,
				explosiongenerator = 'custom:expldgun',
				firestarter = 100,
				firesubmersed = false,
				groundbounce = true,
				impulseboost = 0,
				impulsefactor = 0,
				name = 'Disintegrator',
				noexplode = true,
				noselfdamage = true,
				range = 250,
				reloadtime = 6,
				paralyzer = {},
				soundhit = 'xplomas2s',
				soundhitwet = 'sizzlexs',
				soundstart = 'disigun1',
				soundhitvolume = 36,
				soundstartvolume = 96,
				soundtrigger = true,
				tolerance = 10000,
				turret = true,
				waterweapon = true,
				weapontimer = 4.2,
				weapontype = 'DGun',
				weaponvelocity = 300,
				damage = {
					commanders = 0,
					default = 20000,
					raptors = 10000
				}
			}
		},
		weapons = {
			[1] = {
				def = 'armcomlaser',
				onlytargetcategory = 'NOTSUB',
				fastautoretargeting = true
			},
			[3] = {
				def = 'DISINTEGRATOR',
				onlytargetcategory = 'NOTSUB'
			}
		}
	},
	corcomlvl3 = {
		speed = 80,
		health = 30000,
		energymake = 2180,
		metalmake = 49,
		autoheal = 1500,
		workertime = 1200,
		builddistance = 250,
		buildoptions = (function()
			local result, seen, additional = {}, {}, {
				'corfus',
				'corafus',
				'corageo',
				'corbhmth',
				'cormoho',
				'cormexp',
				'cormmkr',
				'coruwadves',
				'coruwadvms',
				'corarad',
				'corshroud',
				'corfort',
				'cortarg',
				'corsd',
				'corgate',
				'cortoast',
				'corvipe',
				'cordoom',
				'corflak',
				'corscreamer',
				'corfmd',
				'corint',
				'corplat',
				'coruwmme',
				'coruwmmm',
				'corenaa',
				'corfdoom',
				'coratl',
				'coruwfus',
				'corjugg',
				'corshiva',
				'corsumo',
				'corgol',
				'corkorg',
				'cornanotc2plat',
				'cornanotct2',
				'cornecro',
				'cordoomt3',
				'corhllllt',
				'cormaw',
				'cormwall',
				'corgatet3'
			}
			local function addUnique(option)
				if not seen[option] then
					seen[option] = true
					result[#result + 1] = option
				end
			end
			-- Add original base game corcomlvl3 buildoptions
			for _, option in pairs(UnitDefs.corcomlvl3.buildoptions) do
				addUnique(option)
			end
			-- Add mod-specific additional buildoptions
			for _, option in pairs(additional) do
				addUnique(option)
			end
			return result
		end)(),
		customparams = {
			evolution_announcement = 'Cor Commanders upgraded',
			evolution_announcement_size = 18.5,
			evolution_target = 'corcomlvl4',
			evolution_condition = 'timer',
			evolution_timer = 420, -- Adjusted timer value
			combatradius = 0,
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		weapondefs = {
			corcomlaser = {
				areaofeffect = 12,
				avoidfeature = false,
				beamtime = 0.1,
				corethickness = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 1,
				explosiongenerator = 'custom:laserhit-small-red',
				firestarter = 70,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 5.5,
				name = 'J7Laser',
				noselfdamage = true,
				range = 900,
				reloadtime = 0.4,
				rgbcolor = '0.7 0 1',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrfir1',
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 3,
				tolerance = 10000,
				turret = true,
				weapontype = 'BeamLaser',
				weaponvelocity = 900,
				damage = {
					default = 2000,
					subs = 5
				}
			},
			disintegrator = {
				areaofeffect = 36,
				avoidfeature = false,
				avoidfriendly = false,
				avoidground = false,
				bouncerebound = 0,
				cegtag = 'dgunprojectile',
				commandfire = true,
				craterboost = 0,
				cratermult = 0.15,
				edgeeffectiveness = 0.15,
				energypershot = 500,
				explosiongenerator = 'custom:expldgun',
				firestarter = 100,
				firesubmersed = false,
				groundbounce = true,
				impulseboost = 0,
				impulsefactor = 0,
				name = 'Disintegrator',
				noexplode = true,
				noselfdamage = true,
				range = 250,
				reloadtime = 3,
				paralyzer = {},
				soundhit = 'xplomas2s',
				soundhitwet = 'sizzlexs',
				soundstart = 'disigun1',
				soundhitvolume = 36,
				soundstartvolume = 96,
				soundtrigger = true,
				tolerance = 10000,
				turret = true,
				waterweapon = true,
				weapontimer = 4.2,
				weapontype = 'DGun',
				weaponvelocity = 300,
				damage = {
					commanders = 0,
					default = 20000,
					scavboss = 1000,
					raptors = 10000
				}
			}
		},
		weapons = {
			[1] = {
				def = 'CORCOMLASER',
				onlytargetcategory = 'NOTSUB',
				fastautoretargeting = true
			},
			[5] = {
				def = ''
			}
		}
	},
	corcomlvl4 = {
		speed = 80,
		health = 50000,
		energymake = 2380,
		metalmake = 56,
		autoheal = 3550,
		workertime = 1800,
		builddistance = 300,
		buildoptions = (function()
			local result, seen, additional = {}, {}, {
				'corfus',
				'corafus',
				'corageo',
				'corbhmth',
				'cormoho',
				'cormexp',
				'cormmkr',
				'coruwadves',
				'coruwadvms',
				'corarad',
				'corshroud',
				'corfort',
				'cortarg',
				'corsd',
				'corgate',
				'cortoast',
				'corvipe',
				'cordoom',
				'corflak',
				'corscreamer',
				'corfmd',
				'corint',
				'corplat',
				'coruwmme',
				'coruwmmm',
				'corenaa',
				'corfdoom',
				'coratl',
				'coruwfus',
				'corjugg',
				'corshiva',
				'corsumo',
				'corgol',
				'corkorg',
				'cornanotc2plat',
				'cornanotct2',
				'cornecro',
				'cordoomt3',
				'corhllllt',
				'cormaw',
				'cormwall',
				'corgatet3'
			}
			local function addUnique(option)
				if not seen[option] then
					seen[option] = true
					result[#result + 1] = option
				end
			end
			-- Add original base game corcomlvl4 buildoptions
			for _, option in pairs(UnitDefs.corcomlvl4.buildoptions) do
				addUnique(option)
			end
			-- Add mod-specific additional buildoptions
			for _, option in pairs(additional) do
				addUnique(option)
			end
			return result
		end)(),
		customparams = {
			shield_power = 500,
			shield_radius = 100,
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		weapondefs = {
			CORCOMLASER = {
				areaofeffect = 12,
				avoidfeature = false,
				beamtime = 0.1,
				corethickness = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 1,
				explosiongenerator = 'custom:laserhit-small-red',
				firestarter = 70,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 5.5,
				name = 'J7Laser',
				noselfdamage = true,
				range = 1000,
				reloadtime = 0.4,
				rgbcolor = '0.7 0 1',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrfir1',
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 3,
				tolerance = 10000,
				turret = true,
				weapontype = 'BeamLaser',
				weaponvelocity = 900,
				damage = {
					default = 2500,
					subs = 5
				}
			},
			disintegratorxl = {
				areaofeffect = 105,
				avoidfeature = false,
				avoidfriendly = true,
				avoidground = false,
				burst = 1,
				burstrate = 0,
				bouncerebound = 0,
				cegtag = 'gausscannonprojectilexl',
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				commandfire = true,
				cameraShake = 0,
				edgeeffectiveness = 1,
				energypershot = 0,
				explosiongenerator = 'custom:burnblackbiggest',
				firestarter = 100,
				firesubmersed = false,
				gravityaffected = true,
				impulsefactor = 0,
				intensity = 4,
				name = 'Darkmatter Photon-Disruptor',
				noexplode = true,
				noselfdamage = true,
				range = 500,
				reloadtime = 1,
				rgbcolor = '0.7 0.3 1.0',
				size = 5.5,
				soundhit = 'xplomas2',
				soundhitwet = 'sizzlexs',
				soundstart = 'disigun1',
				soundtrigger = true,
				tolerance = 10000,
				turret = true,
				weapontimer = 4.2,
				weapontype = 'DGun',
				weaponvelocity = 505,
				damage = {
					commanders = 0,
					default = 20000,
					scavboss = 1000,
					raptors = 10000
				}
			},
			corcomeyelaser = {
				allowNonBlockingAim = true,
				avoidfriendly = true,
				areaofeffect = 6,
				avoidfeature = false,
				beamtime = 0.033,
				camerashake = 0.1,
				collidefriendly = false,
				corethickness = 0.35,
				craterareaofeffect = 12,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 1,
				energypershot = 0,
				explosiongenerator = 'custom:laserhit-small-red',
				firestarter = 90,
				firetolerance = 300,
				impulsefactor = 0,
				laserflaresize = 2,
				name = 'EyeLaser',
				noselfdamage = true,
				proximitypriority = 1,
				range = 870,
				reloadtime = 0.033,
				rgbcolor = '0 1 0',
				rgbcolor2 = '0.8 0 0',
				scrollspeed = 5,
				soundhitdry = 'flamhit1',
				soundhitwet = 'sizzle',
				soundstart = 'heatray3burn',
				soundstartvolume = 7,
				soundtrigger = 1,
				thickness = 2.5,
				turret = true,
				weapontype = 'BeamLaser',
				weaponvelocity = 1500,
				damage = {
					default = 185
				}
			}
		},
		weapons = {
			[1] = {
				def = 'CORCOMLASER',
				onlytargetcategory = 'NOTSUB',
				fastautoretargeting = true
			},
			[3] = {
				badtargetcategory = 'VTOL',
				def = 'disintegratorxl',
				onlytargetcategory = 'SURFACE'
			},
			[6] = {
				def = ''
			},
			[5] = {
				badtargetcategory = 'VTOL GROUNDSCOUT',
				def = 'corcomeyelaser',
				onlytargetcategory = 'SURFACE'
			}
		}
	}
}
