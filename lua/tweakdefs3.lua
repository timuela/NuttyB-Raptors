-- Hive Spawn
-- Authors: Backbash
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko

local UnitDefs = UnitDefs or {}

local function deepCopy(orig)
	local copy = {}
	for k, v in pairs(orig) do
		if type(v) == 'table' then
			copy[k] = deepCopy(v)
		else
			copy[k] = v
		end
	end
	return copy
end

local function insertMissing(target, source)
	for k, v in pairs(source) do
		if type(v) == 'table' then
			target[k] = target[k] or {}
			if type(target[k]) == 'table' then
				insertMissing(target[k], v)
			end
		elseif target[k] == nil then
			target[k] = v
		end
	end
end

local function cloneUnit(base, new, additions)
	if UnitDefs[base] and not UnitDefs[new] then
		local copy = deepCopy(UnitDefs[base])
		insertMissing(copy, additions or {})
		UnitDefs[new] = copy
	end
end

cloneUnit(
    "raptor_land_swarmer_basic_t1_v1",
    "raptor_hive_swarmer_basic",
    {
        name = "Hive Spawn",
        customparams = {
            i18n_en_humanname = "Hive Spawn",
            i18n_en_tooltip = "Raptor spawned to defend hives from attackers."
        }
    }
)

cloneUnit(
    "raptor_land_assault_basic_t2_v1",
    "raptor_hive_assault_basic",
    {
        name = "Armored Assault Raptor",
        customparams = {
            i18n_en_humanname = "Armored Assault Raptor",
            i18n_en_tooltip = "Heavy, slow, and unyielding—these beasts are made to take the hits others cant."
        }
    }
)

cloneUnit(
    "raptor_land_assault_basic_t4_v1",
    "raptor_hive_assault_heavy",
    {
        name = "Heavy Armored Assault Raptor",
        customparams = {
            i18n_en_humanname = "Heavy Armored Assault Raptor",
            i18n_en_tooltip = "Lacking speed, these armored monsters make up for it with raw, unbreakable toughness."
        }
    }
)

cloneUnit(
    "raptor_land_assault_basic_t4_v2",
    "raptor_hive_assault_superheavy",
    {
        name = "Super Heavy Armored Assault Raptor",
        customparams = {
            i18n_en_humanname = "Super Heavy Armored Assault Raptor",
            i18n_en_tooltip = "These super-heavy armored beasts may be slow, but they’re built to take a pounding and keep rolling."
        }
    }
)

cloneUnit(
    "raptorartillery",
    "raptor_evolved_motort4",
    {
        name = "Evolved Lobber",
        customparams = {
            i18n_en_humanname = "Evolved Lobber",
            i18n_en_tooltip = "These lobbers did not just evolve—they became deadlier than anything before them."
        }
    }
)

local oldUnitDef_Post = UnitDef_Post
function UnitDef_Post(i, j)
	if oldUnitDef_Post and oldUnitDef_Post ~= UnitDef_Post then
		oldUnitDef_Post(i, j)
	end

	local commonWeaponDefs = {
		aaweapon = {
			texture1 = {},
			texture2 = {},
			tracks = false,
			weaponvelocity = 4000,
			smokePeriod = {},
			smoketime = {},
			smokesize = {},
			smokecolor = {},
			smoketrail = 0,
		}
	}

	local overrides = {
		raptor_hive_swarmer_basic = {
			metalcost = 350,
			nochasecategory = 'OBJECT',
			icontype = 'raptor_land_swarmer_basic_t1_v1',
		},
		raptor_hive_assault_basic = {
			metalcost = 3000,
			health = 25000,
			speed = 20.0,
			nochasecategory = 'OBJECT',
			icontype = 'raptor_land_assault_basic_t2_v1',
			weapondefs = commonWeaponDefs,
		},
		raptor_hive_assault_heavy = {
			metalcost = 6000,
			health = 30000,
			speed = 17.0,
			nochasecategory = 'OBJECT',
			icontype = 'raptor_land_assault_basic_t4_v1',
			weapondefs = commonWeaponDefs,
		},
		raptor_hive_assault_superheavy = {
			metalcost = 9000,
			health = 35000,
			speed = 16.0,
			nochasecategory = 'OBJECT',
			icontype = 'raptor_land_assault_basic_t4_v2',
			weapondefs = commonWeaponDefs,
		},
		raptor_evolved_motort4 = {
			icontype = 'raptor_allterrain_arty_basic_t4_v1',
			weapondefs = {
				poopoo = {
					accuracy = 2048,
					areaofeffect = 256,
					collidefriendly = 0,
					collidefeature = 0,
					avoidfeature = 0,
					avoidfriendly = 0,
					burst = 4,
					burstrate = 0.4,
					flighttime = 12,
					dance = 25,
					craterareaofeffect = 256,
					craterboost = 0.2,
					cratermult = 0.2,
					edgeeffectiveness = 0.70,
					cegtag = "blob_trail_blue",
					explosiongenerator = "custom:genericshellexplosion-huge-bomb",
					impulsefactor = 0.4,
					intensity = 0.3,
					interceptedbyshieldtype = 1,
					noselfdamage = true,
					proximitypriority = -1,
					range = 2300,
					reloadtime = 10,
					rgbcolor = "0.2 0.5 0.9",
					size = 8,
					sizedecay = 0.09,
					soundhit = "bombsmed2",
					soundstart = "bugarty",
					sprayangle = 2048,
					tolerance = 60000,
					turnrate = 6000,
					trajectoryheight = 2,
					turret = true,
					weapontype = "Cannon",
					weaponvelocity = 520,
					startvelocity = 140,
					weaponacceleration = 125,
					weapontimer = 0.2,
					wobble = 14500,
					highTrajectory = 1,
					damage = {
						default = 900,
						shields = 600,
					}
				}
			},
			weapons = {
				[1] = {
					badtargetcategory = "MOBILE",
					def = "poopoo",
					maindir = "0 0 1",
					maxangledif = 50,
					onlytargetcategory = "NOTAIR",
				}
			}
		}
	}

	for name, patch in pairs(overrides) do
		local unitDef = UnitDefs[name]
		if unitDef then
			for key, value in pairs(patch) do
				if key == 'weapondefs' then
					unitDef.weapondefs = unitDef.weapondefs or {}
					for weaponName, weaponParams in pairs(value) do
						unitDef.weapondefs[weaponName] = unitDef.weapondefs[weaponName] or {}
						for k, v in pairs(weaponParams) do
							unitDef.weapondefs[weaponName][k] = v
						end
					end
				elseif key == 'weapons' then
					unitDef.weapons = value
				else
					unitDef[key] = value
				end
			end
		end
	end
end
