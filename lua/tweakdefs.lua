--NuttyB v1.52 Def Main
-- Authors: ChrispyNut, BackBash
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local unitDefs, repulsor, pairs, tableMerge = UnitDefs or {}, 'repulsor', pairs, table.merge

function addWeapon(h, i, j)
	unitDefs[h] = unitDefs[h] or {}
	unitDefs[h].weapons = unitDefs[h].weapons or {}
	unitDefs[h].weapondefs = unitDefs[h].weapondefs or {}
	unitDefs[h].customparams = unitDefs[h].customparams or {}
	table.insert(
		unitDefs[h].weapons,
		{
			def = repulsor,
			onlytargetcategory = j or ''
		}
	)
	unitDefs[h].weapondefs[repulsor] = i
	if i.shield and i.shield.power > 0 then
		i.range = i.shield.radius
		unitDefs[h].customparams =
			tableMerge(
			unitDefs[h].customparams or {},
			{
				off_on_stun = 'true',
				shield_color_mult = 0.8,
				shield_power = i.shield.power,
				shield_radius = i.shield.radius
			}
		)
	end
end

for _, shieldedUnit in ipairs(
	{
		'armcom',
		'armcomlvl2',
		'armcomlvl3',
		'armcomlvl4',
		'corcom',
		'corcomlvl2',
		'corcomlvl3',
		'corcomlvl4',
		'legcom',
		'legcomlvl2',
		'legcomlvl3',
		'legcomlvl4',
		'legcomt2com'
	}
) do
	addWeapon(
		shieldedUnit,
		{
			avoidfeature = false,
			craterareaofeffect = 0,
			craterboost = 0,
			cratermult = 0,
			edgeeffectiveness = 0.15,
			name = 'PlasmaRepulsor',
			range = 50,
			soundhitwet = 'sizzle',
			weapontype = 'Shield',
			damage = {
				default = 100
			},
			shield = {
				alpha = 0.15,
				armortype = 'shields',
				energyuse = 1,
				force = 2.5,
				intercepttype = 1,
				power = 500,
				powerregen = 3,
				powerregenenergy = 3,
				radius = 100,
				repulser = true,
				smart = true,
				startingpower = 100,
				visiblerepulse = true,
				badcolor = {
					1,
					0.2,
					0.2,
					0.2
				},
				goodcolor = {
					0.2,
					1,
					0.2,
					0.17
				}
			}
		}
	)
end

for name, def in pairs(unitDefs) do
	if string.sub(name, 1, 24) == 'raptor_air_fighter_basic' then
		if def.weapondefs then
			for _, s in pairs(def.weapondefs) do
				s.name = 'Spike'
				s.accuracy = 200
				s.collidefriendly = 0
				s.collidefeature = 0
				s.avoidfeature = 0
				s.avoidfriendly = 0
				s.areaofeffect = 64
				s.edgeeffectiveness = 0.3
				s.explosiongenerator = 'custom:raptorspike-large-sparks-burn'
				s.cameraShake = {}
				s.dance = {}
				s.interceptedbyshieldtype = 0
				s.model = 'Raptors/spike.s3o'
				s.reloadtime = 1.1
				s.soundstart = 'talonattack'
				s.startvelocity = 200
				s.submissile = 1
				s.smoketrail = 0
				s.smokePeriod = {}
				s.smoketime = {}
				s.smokesize = {}
				s.smokecolor = {}
				s.soundhit = {}
				s.texture1 = {}
				s.texture2 = {}
				s.tolerance = {}
				s.tracks = 0
				s.turnrate = 60000
				s.weaponacceleration = 100
				s.weapontimer = 1
				s.weaponvelocity = 1000
				s.weapontype = {}
				s.wobble = {}
			end
		end
	elseif name:match '^[acl][ore][rgm]com' then
		unitDefs[name].featuredefs.dead.reclaimable = false
		unitDefs[name].featuredefs.dead.damage = 560000
	end
end

local weaponMods = {
	raptor_air_kamikaze_basic_t2_v1 = {
		selfdestructas = 'raptor_empdeath_big'
	},
	raptor_land_swarmer_emp_t2_v1 = {
		weapondefs = {
			raptorparalyzersmall = {
				damage = {shields = 60},
				paralyzetime = 6
			}
		}
	},
	raptor_land_assault_emp_t2_v1 = {
		weapondefs = {
			raptorparalyzerbig = {
				damage = {shields = 140},
				paralyzetime = 10
			}
		}
	},
	raptor_allterrain_arty_emp_t2_v1 = {
		weapondefs = {
			goolauncher = {
				paralyzetime = 6
			}
		}
	},
	raptor_allterrain_arty_emp_t4_v1 = {
		weapondefs = {
			goolauncher = {
				paralyzetime = 10
			}
		}
	},
	raptor_air_bomber_emp_t2_v1 = {
		weapondefs = {
			weapon = {
				damage = {
					shields = 1000,
					default = 2000
				},
				paralyzetime = 10
			}
		}
	},
	raptor_allterrain_swarmer_emp_t2_v1 = {
		weapondefs = {
			raptorparalyzersmall = {
				damage = {shields = 60},
				paralyzetime = 6
			}
		}
	},
	raptor_allterrain_assault_emp_t2_v1 = {
		weapondefs = {
			raptorparalyzerbig = {
				damage = {shields = 140},
				paralyzetime = 6
			}
		}
	},
	raptor_matriarch_electric = {
		weapondefs = {
			goo = {paralyzetime = 13},
			melee = {paralyzetime = 13},
			spike_emp_blob = {paralyzetime = 13}
		}
	}
}

for unitName, modifications in pairs(weaponMods) do
	if unitDefs[unitName] then
		unitDefs[unitName] = tableMerge(unitDefs[unitName], modifications)
	end
end

for _, raptorTurretName in pairs(
	{
		'raptor_antinuke',
		'raptor_turret_acid_t2_v1',
		'raptor_turret_acid_t3_v1',
		'raptor_turret_acid_t4_v1',
		'raptor_turret_antiair_t2_v1',
		'raptor_turret_antiair_t3_v1',
		'raptor_turret_antiair_t4_v1',
		'raptor_turret_antinuke_t2_v1',
		'raptor_turret_antinuke_t3_v1',
		'raptor_turret_basic_t2_v1',
		'raptor_turret_basic_t3_v1',
		'raptor_turret_basic_t4_v1',
		'raptor_turret_burrow_t2_v1',
		'raptor_turret_emp_t2_v1',
		'raptor_turret_emp_t3_v1',
		'raptor_turret_emp_t4_v1',
		'raptor_worm_green'
	}
) do
	local raptorTurretDef = unitDefs[raptorTurretName]
	raptorTurretDef.maxthisunit = 10
	raptorTurretDef.health = raptorTurretDef.health * 2
	if raptorTurretDef.weapondefs then
		for _, weapon in pairs(raptorTurretDef.weapondefs) do
			weapon.reloadtime = weapon.reloadtime / 1.5
			weapon.range = weapon.range / 2
		end
	end
end

for _, q in pairs(unitDefs) do
	if q.builder == true then
		if q.canfly == true then
			q.explodeas = ''
			q.selfdestructas = ''
		end
	end
end

local bombers = {
	'raptor_air_bomber_basic_t2_v1',
	'raptor_air_bomber_basic_t2_v2',
	'raptor_air_bomber_basic_t4_v1',
	'raptor_air_bomber_basic_t4_v2',
	'raptor_air_bomber_basic_t1_v1'
}

for _, toChangeName in pairs(bombers) do
	local def = unitDefs[toChangeName]
	if def.weapondefs then
		for _, weaponDef in pairs(def.weapondefs) do
			weaponDef.damage.default = weaponDef.damage.default / 1.33
		end
	end
end

local units = {'armrespawn', 'correspawn', 'legnanotcbase'}
for _, name in ipairs(units) do
    local u = UnitDefs[name]
    if u then
        u.cantbetransported, u.footprintx, u.footprintz = false, 4, 4
        u.customparams = u.customparams or {}
        u.customparams.paratrooper = true
        u.customparams.fall_damage_multiplier = 0
    end
end
