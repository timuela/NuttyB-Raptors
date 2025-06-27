-- Mini-Bosses
local a = UnitDefs or {}
local b = table.merge
local c = "raptor_matriarch_basic"

local function d(e, f, g)
	if a[e] and not a[f] then
		a[f] = b(a[e], g or {})
	end
end

local function h(i)
	if type(i) ~= "table" then return i end
	local j = {}
	for k, l in pairs(i) do j[h(k)] = h(l) end
	return setmetatable(j, h(getmetatable(i)))
end

local m = a[c].health

d("raptor_queen_veryeasy", "raptor_miniq_a", {
	name = "Queenling Prima",
	icontype = "raptor_queen_veryeasy",
	health = m * 5,
	customparams = {
		i18n_en_humanname = "Queenling Prima",
		i18n_en_tooltip = "Majestic and bold, ruler of the hunt."
	}
})

d("raptor_queen_easy", "raptor_miniq_b", {
	name = "Queenling Secunda",
	icontype = "raptor_queen_easy",
	health = m * 7,
	customparams = {
		i18n_en_humanname = "Queenling Secunda",
		i18n_en_tooltip = "Swift and sharp, a noble among raptors."
	}
})

d("raptor_queen_normal", "raptor_miniq_c", {
	name = "Queenling Tertia",
	icontype = "raptor_queen_normal",
	health = m * 9,
	customparams = {
		i18n_en_humanname = "Queenling Tertia",
		i18n_en_tooltip = "Refined tastes. Likes her prey rare."
	}
})

for n, l in ipairs {
	{ "raptor_matriarch_basic", "raptor_mama_ba", "Matrona", "Claws charged with vengeance." },
	{ "raptor_matriarch_fire", "raptor_mama_fi", "Pyro Matrona", "A firestorm of maternal wrath." },
	{ "raptor_matriarch_electric", "raptor_mama_el", "Paralyzing Matrona", "Crackling with rage, ready to strike." },
	{ "raptor_matriarch_acid", "raptor_mama_ac", "Acid Matrona", "Acid-fueled, melting everything in sight." }
} do
	d(l[1], l[2], {
		name = l[3],
		icontype = l[1],
		health = m * 1.5,
		customparams = {
			i18n_en_humanname = l[3],
			i18n_en_tooltip = l[4]
		}
	})
end

d("critter_penguinking", "raptor_consort", {
	name = "Raptor Consort",
	icontype = "corkorg",
	health = m * 4,
	mass = 100000,
	sonarstealth = false,
	stealth = false,
	speed = 67.5,
	customparams = {
		i18n_en_humanname = "Raptor Consort",
		i18n_en_tooltip = "Sneaky powerful little terror."
	}
})

a.raptor_consort.weapondefs.melee = h(a[c].weapondefs.melee)

local o = function(p, q, e, r, s, t)
	return {
		raptorcustomsquad = true,
		raptorsquadunitsamount = s or 1,
		raptorsquadminanger = p,
		raptorsquadmaxanger = q,
		raptorsquadweight = t or 1,
		raptorsquadrarity = r or "basic",
		raptorsquadbehavior = e,
		raptorsquadbehaviordistance = 500,
		raptorsquadbehaviorchance = 0.75
	}
end

for f, u in pairs {
	corcomlvl4 = {
		weapondefs = {
			disintegratorxl = {
				damage = {
					commanders = 0,
					default = 99999,
					scavboss = 1000,
					raptorqueen = 20000
				}
			}
		}
	},
	raptor_miniq_a = {
		selfdestructas = "customfusionexplo",
		explodeas = "customfusionexplo",
		maxthisunit = 4,
		customparams = o(70, 80, "berserk"),
		weapondefs = {
			goo = { damage = { default = 750 } },
			melee = { damage = { default = 4000 } },
			yellow_missile = { damage = { default = 1, vtol = 1000 } }
		}
	},
	raptor_miniq_b = {
		selfdestructas = "customfusionexplo",
		explodeas = "customfusionexplo",
		maxthisunit = 4,
		customparams = o(85, 95, "berserk"),
		weapondefs = {
			goo = { damage = { default = 1500 } },
			melee = { damage = { default = 7000 } },
			yellow_missile = { damage = { default = 1, vtol = 1000 } }
		}
	},
	raptor_miniq_c = {
		selfdestructas = "customfusionexplo",
		explodeas = "customfusionexplo",
		maxthisunit = 4,
		customparams = o(100, 125, "berserk"),
		weapondefs = {
			goo = { damage = { default = 3000 } },
			melee = { damage = { default = 10000 } },
			yellow_missile = { damage = { default = 1, vtol = 1000 } }
		}
	},
	raptor_consort = {
		explodeas = "raptor_empdeath_big",
		maxthisunit = 8,
		customparams = o(85, 1000, "berserk"),
		weapondefs = {
			eyelaser = {
				range = 800,
				reloadtime = 2,
				damage = {
					commanders = 6000,
					default = 6000
				}
			},
			melee = {
				name = "Royal Beak Attack",
				range = 300,
				soundstart = "pensquawk1",
				damage = { default = 1000 }
			}
		},
		weapons = {
			[2] = {
				def = "melee",
				maindir = "0 0 1",
				maxangledif = 155
			}
		}
	},
	raptor_mama_ba = {
		maxthisunit = 4,
		customparams = o(55, 84, "berserk"),
		weapondefs = {
			goo = { damage = { default = 750 } },
			melee = { damage = { default = 750 } }
		}
	},
	raptor_mama_fi = {
		explodeas = "raptor_empdeath_big",
		maxthisunit = 4,
		customparams = o(55, 84, "berserk"),
		weapondefs = {
			flamethrowerspike = { damage = { default = 120 } },
			flamethrowermain = { damage = { default = 240 } }
		}
	},
	raptor_mama_el = {
		maxthisunit = 4,
		customparams = o(60, 1000, "berserk")
	},
	raptor_mama_ac = {
		maxthisunit = 4,
		customparams = o(65, 1000, "berserk"),
		weapondefs = {
			melee = { damage = { default = 750 } }
		}
	},
	raptor_land_assault_basic_t4_v2 = {
		maxthisunit = 8,
		customparams = o(33, 50, "raider")
	},
	raptor_land_assault_basic_t4_v1 = {
		maxthisunit = 16,
		customparams = o(51, 69, "raider", "basic", 2)
	}
} do
	a[f] = a[f] or {}
	table.mergeInPlace(a[f], u, true)
end
