--NuttyB v1.52 Armada Com
-- Authors: ChrispyNut, BackBash
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
return {
	armcom = {
		customparams = {
			evolution_announcement = 'Arm Commanders upgraded',
			evolution_announcement_size = 18.5,
			evolution_target = 'armcomlvl2',
			evolution_condition = 'timer',
			evolution_timer = 420,
			combatradius = 0,
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		energymake = 100,
		metalmake = 10,
		autoheal = 55,
		health = 4500,
		speed = 41,
		canresurrect = true,
		buildoptions = (function()
			local result, seen, additional = {}, {}, {
				'armuwmex',
				'armgeo',
				'armamex',
				'armbeamer',
				'armjamt',
				'armrectr',
				'armclaw'
			}
			local function addUnique(option)
				if not seen[option] then
					seen[option] = true
					result[#result + 1] = option
				end
			end
			-- Add original base game armcom buildoptions
			for _, option in pairs(UnitDefs.armcom.buildoptions) do
				addUnique(option)
			end
			-- Add mod-specific additional buildoptions
			for _, option in pairs(additional) do
				addUnique(option)
			end
			return result
		end)(),
		weapondefs = {
			armcomlaser = {
				range = 330,
				rgbcolor = '0.7 1 1',
				soundstart = 'lasrfir1',
				damage = {
					default = 175
				}
			},
			old_armsnipe_weapon = {
				areaofeffect = 32,
				avoidfeature = true,
				avoidfriendly = true,
				collidefeature = true,
				collidefriendly = false,
				corethickness = 0.75,
				craterareaofeffect = 0,
				craterboost = 0,
				commandfire = true,
				cratermult = 0,
				cegtag = 'railgun',
				duration = 0.12,
				edgeeffectiveness = 0.85,
				energypershot = 400,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 100,
				impulseboost = 0.4,
				impulsefactor = 1,
				intensity = 0.8,
				name = 'Long-range g2g armor-piercing rifle',
				range = 550,
				reloadtime = 1,
				rgbcolor = '0 1 1',
				rgbcolor2 = '0 1 1',
				soundhit = 'sniperhit',
				soundhitwet = 'sizzle',
				soundstart = 'sniper3',
				soundtrigger = true,
				stockpile = true,
				stockpiletime = 7,
				customparams = {
					stockpilelimit = 5
				},
				texture1 = 'shot',
				texture2 = 'empty',
				thickness = 4,
				tolerance = 1000,
				turret = true,
				weapontype = 'LaserCannon',
				weaponvelocity = 3000,
				damage = {
					commanders = 100,
					default = 4900
				}
			}
		},
		weapons = {
			[3] = {
				def = 'old_armsnipe_weapon',
				onlytargetcategory = 'NOTSUB'
			}
		}
	},
	armcomlvl2 = {
		autoheal = 90,
		builddistance = 175,
		canresurrect = true,
		energymake = 315,
		health = 7000,
		speed = 57.5,
		metalmake = 20,
		workertime = 900,
		buildoptions = (function()
			local result, seen, additional = {}, {}, {
				'armadvsol',
				'armgeo',
				'armamex',
				'armnanotcplat',
				'armnanotc',
				'armguard',
				'armcir',
				'armjamt',
				'armjuno'
			}
			local function addUnique(option)
				if not seen[option] then
					seen[option] = true
					result[#result + 1] = option
				end
			end
			for _, option in pairs(UnitDefs.armcomlvl2.buildoptions) do
				addUnique(option)
			end
			for _, option in pairs(additional) do
				addUnique(option)
			end
			return result
		end)(),
		customparams = {
			evolution_announcement = 'Arm Commanders upgraded',
			evolution_announcement_size = 18.5,
			evolution_target = 'armcomlvl3',
			evolution_condition = 'timer',
			evolution_timer = 900,
			combatradius = 0,
			wtboostunittype = '',
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
				range = 425,
				reloadtime = 0.7,
				rgbcolor = '0 1 1',
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
					default = 950,
					fighters = 110
				}
			},
			old_armsnipe_weapon = {
				areaofeffect = 42,
				avoidfeature = true,
				avoidfriendly = true,
				collidefeature = true,
				collidefriendly = false,
				corethickness = 0.75,
				craterareaofeffect = 0,
				craterboost = 0,
				commandfire = true,
				cratermult = 0,
				cegtag = 'railgun',
				duration = 0.12,
				edgeeffectiveness = 0.85,
				energypershot = 700,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 100,
				impulseboost = 0.4,
				impulsefactor = 1,
				intensity = 1,
				name = 'Long-range g2g armor-piercing rifle',
				range = 700,
				reloadtime = 1,
				rgbcolor = '0.2 0.1 1',
				rgbcolor2 = '0.2 0.1 1',
				soundhit = 'sniperhit',
				soundhitwet = 'sizzle',
				soundstart = 'sniper3',
				soundtrigger = true,
				stockpile = true,
				stockpiletime = 6,
				customparams = {
					stockpilelimit = 10
				},
				texture1 = 'shot',
				texture2 = 'empty',
				thickness = 4,
				tolerance = 1000,
				turret = true,
				weapontype = 'LaserCannon',
				weaponvelocity = 3000,
				damage = {
					commanders = 10,
					default = 11000
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
				def = 'old_armsnipe_weapon',
				onlytargetcategory = 'NOTSUB'
			}
		}
	},
	armcomlvl3 = {
		autoheal = 50,
		builddistance = 250,
		canresurrect = true,
		energymake = 2712,
		health = 10000,
		speed = 71.5,
		metalmake = 62,
		workertime = 1500,
		buildoptions = (function()
			local result, seen, additional = {}, {}, {
				'armanni',
				'armpb',
				'armamb',
				'armmoho',
				'armuwmme',
				'armflak',
				'armgate',
				'armsd',
				'armfort',
				'armtarg',
				'armarad',
				'armamd',
				'armveil',
				'armuwadvms',
				'armuwadves',
				'armmmkr',
				'armuwmmm',
				'armuwfus',
				'armplat',
				'armfhlt',
				'armfflak',
				'armatl',
				'armkraken',
				'armbrtha',
				'armannit3',
				'armlwall',
				'armnanotct2',
				'armafus',
				'armfus',
				'armckfus',
				'armraz',
				'armzeus',
				'armsnipe',
				'armvang',
				'armrectr',
				'armgatet3'
			}
			local function addUnique(option)
				if not seen[option] then
					seen[option] = true
					result[#result + 1] = option
				end
			end
			for _, option in pairs(UnitDefs.armcomlvl3.buildoptions) do
				addUnique(option)
			end

			-- Add additional options
			for _, option in pairs(additional) do
				addUnique(option)
			end

			return result
		end)(),
		customparams = {
			evolution_announcement = 'Arm Commanders upgraded',
			evolution_announcement_size = 18.5,
			evolution_target = 'armcomlvl4',
			evolution_condition = 'timer',
			evolution_timer = 420,
			combatradius = 0,
			wtboostunittype = '',
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		weapondefs = {
			old_armsnipe_weapon = {
				areaofeffect = 64,
				avoidfeature = true,
				avoidfriendly = true,
				collidefeature = true,
				collidefriendly = false,
				corethickness = 0.75,
				craterareaofeffect = 0,
				craterboost = 0,
				commandfire = true,
				cratermult = 0,
				cegtag = 'railgun',
				duration = 0.12,
				edgeeffectiveness = 1,
				energypershot = 2000,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 100,
				impulseboost = 0.4,
				impulsefactor = 1,
				intensity = 1.4,
				name = 'Long-range g2g armor-piercing rifle',
				range = 1250,
				reloadtime = .5,
				rgbcolor = '0.4 0.1 0.7',
				rgbcolor2 = '0.4 0.1 0.7',
				soundhit = 'sniperhit',
				soundhitwet = 'sizzle',
				soundstart = 'sniper3',
				soundtrigger = true,
				stockpile = true,
				stockpiletime = 3,
				customparams = {
					stockpilelimit = 10
				},
				texture1 = 'shot',
				texture2 = 'empty',
				thickness = 6,
				tolerance = 1000,
				turret = true,
				weapontype = 'LaserCannon',
				weaponvelocity = 3000,
				damage = {
					commanders = 10,
					default = 35000
				}
			},
			armcomlaser = {
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
				laserflaresize = 7.7,
				name = 'Light close-quarters g2g/g2a laser',
				noselfdamage = true,
				range = 500,
				reloadtime = 0.6,
				rgbcolor = '0.1 0 1',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrcrw2',
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 6,
				tolerance = 10000,
				turret = true,
				weapontype = 'BeamLaser',
				weaponvelocity = 900,
				damage = {
					bombers = 180,
					default = 1450,
					fighters = 110
				}
			}
		},
		weapons = {
			[5] = {
				badtargetcategory = 'MOBILE',
				def = 'armcomlaser',
				onlytargetcategory = 'NOTSUB',
				fastautoretargeting = true
			},
			[3] = {
				def = 'old_armsnipe_weapon',
				onlytargetcategory = 'NOTSUB'
			},
			[4] = {
				def = ''
			},
			[1] = {
				def = ''
			},
			[6] = {
				def = ''
			}
		}
	},
	armcomlvl4 = {
		autoheal = 150,
		builddistance = 300,
		canresurrect = true,
		energymake = 3112,
		health = 20000,
		speed = 82,
		metalmake = 86,
		workertime = 2000,
		buildoptions = (function()
			local result, seen, additional = {}, {}, {
				'armanni',
				'armmoho',
				'armuwmme',
				'armflak',
				'armgate',
				'armsd',
				'armfort',
				'armtarg',
				'armarad',
				'armamd',
				'armveil',
				'armuwadvms',
				'armuwadves',
				'armmmkr',
				'armuwmmm',
				'armuwfus',
				'armplat',
				'armfhlt',
				'armfflak',
				'armatl',
				'armkraken',
				'armbrtha',
				'armannit3',
				'armlwall',
				'armnanotct2',
				'armafus',
				'armfus',
				'armckfus',
				'armraz',
				'armzeus',
				'armsnipe',
				'armvang',
				'armrectr',
				'armgatet3'
			}

			-- Helper function to add unique items
			local function addUnique(option)
				if not seen[option] then
					seen[option] = true
					result[#result + 1] = option
				end
			end

			-- Add options from armcomlvl4
			for _, option in pairs(UnitDefs.armcomlvl4.buildoptions) do
				addUnique(option)
			end

			-- Add additional options
			for _, option in pairs(additional) do
				addUnique(option)
			end

			return result
		end)(),
		customparams = {
			wtboostunittype = '',
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		weapondefs = {
			old_armsnipe_weapon = {
				areaofeffect = 72,
				avoidfeature = true,
				avoidfriendly = true,
				collidefeature = true,
				collidefriendly = false,
				corethickness = 0.75,
				craterareaofeffect = 0,
				craterboost = 0,
				commandfire = true,
				cratermult = 0,
				cegtag = 'railgun',
				duration = 0.12,
				edgeeffectiveness = 1,
				energypershot = 2000,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 100,
				impulseboost = 0.4,
				impulsefactor = 1,
				intensity = 1.4,
				name = 'Long-range g2g armor-piercing rifle',
				range = 1250,
				reloadtime = .5,
				rgbcolor = '0.4 0.1 0.7',
				rgbcolor2 = '0.4 0.1 0.7',
				soundhit = 'sniperhit',
				soundhitwet = 'sizzle',
				soundstart = 'sniper3',
				soundtrigger = true,
				stockpile = true,
				stockpiletime = 2,
				customparams = {
					stockpilelimit = 15
				},
				texture1 = 'shot',
				texture2 = 'empty',
				thickness = 6,
				tolerance = 1000,
				turret = true,
				weapontype = 'LaserCannon',
				weaponvelocity = 3000,
				damage = {
					commanders = 10,
					default = 45000
				}
			},
			ata = {
				areaofeffect = 16,
				avoidfeature = false,
				beamtime = 1.25,
				collidefriendly = false,
				corethickness = 0.5,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.30,
				energypershot = 7000,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 90,
				impulsefactor = 0,
				largebeamlaser = true,
				laserflaresize = 7,
				name = 'Heavy long-range g2g tachyon accelerator beam',
				noselfdamage = true,
				range = 1100,
				reloadtime = 15,
				rgbcolor = '1 0 1',
				scrollspeed = 5,
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'annigun1',
				soundtrigger = 1,
				texture3 = 'largebeam',
				thickness = 10,
				tilelength = 150,
				tolerance = 10000,
				turret = true,
				weapontype = 'BeamLaser',
				weaponvelocity = 3100,
				damage = {
					commanders = 480,
					default = 48000
				}
			},
			armcomlaser = {
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
				laserflaresize = 7.7,
				name = 'Light close-quarters g2g/g2a laser',
				noselfdamage = true,
				range = 550,
				reloadtime = 0.5,
				rgbcolor = '0.1 0 1',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrcrw2',
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 6,
				tolerance = 10000,
				turret = true,
				weapontype = 'BeamLaser',
				weaponvelocity = 900,
				damage = {
					bombers = 180,
					default = 1750,
					fighters = 110
				}
			}
		},
		weapons = {
			[5] = {
				badtargetcategory = 'MOBILE',
				def = 'armcomlaser',
				onlytargetcategory = 'NOTSUB',
				fastautoretargeting = true
			},
			[3] = {
				def = 'old_armsnipe_weapon',
				onlytargetcategory = 'NOTSUB'
			},
			[4] = {
				badtargetcategory = 'VTOL GROUNDSCOUT',
				def = 'ATA',
				onlytargetcategory = 'SURFACE'
			},
			[1] = {
				def = ''
			},
			[6] = {
				def = ''
			}
		}
	}
}
