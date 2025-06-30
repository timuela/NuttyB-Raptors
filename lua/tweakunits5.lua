--NuttyB Experimental Wave Challenge Backbash
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
return {
    raptor_air_scout_basic_t2_v1 = {
        customparams = {
            raptorcustomsquad = true,
            raptorsquadunitsamount = 20,
            raptorsquadminanger = 20,
            raptorsquadmaxanger = 26,
            raptorsquadweight = 10,
            raptorsquadrarity = "basic",
            raptorsquadbehavior = "raider",
            raptorsquadbehaviordistance = 500,
            raptorsquadbehaviorchance = 0.75,
        },
    },
    raptor_hive_assault_basic = {
        customparams = {
            raptorcustomsquad = true,
            raptorsquadunitsamount = 15,
            raptorsquadminanger = 0,
            raptorsquadmaxanger = 40,
            raptorsquadweight = 1,
            raptorsquadrarity = "basic",
            raptorsquadbehavior = "raider",
            raptorsquadbehaviordistance = 500,
            raptorsquadbehaviorchance = 0.75,
        },
    },
    raptor_land_swarmer_basic_t3_v1 = {
        customparams = {
            raptorcustomsquad = true,
            raptorsquadunitsamount = 25,
            raptorsquadminanger = 0,
            raptorsquadmaxanger = 40,
            raptorsquadweight = 2,
            raptorsquadrarity = "basic",
            raptorsquadbehavior = "raider",
            raptorsquadbehaviordistance = 500,
            raptorsquadbehaviorchance = 0.75,
        },
    },
    raptor_air_kamikaze_basic_t2_v1 = {
        customparams = {
            raptorcustomsquad = true,
            raptorsquadunitsamount = 40,
            raptorsquadminanger = 100,
            raptorsquadmaxanger = 110,
            raptorsquadweight = 2,
            raptorsquadrarity = "basic",
            raptorsquadbehavior = "kamikaze",
            raptorsquadbehaviordistance = 500,
            raptorsquadbehaviorchance = 0.75,
        },
    },
    raptor_matriarch_electric = {
        customparams = {
            raptorcustomsquad = true,
            raptorsquadunitsamount = 25,
            raptorsquadminanger = 110,
            raptorsquadmaxanger = 125,
            raptorsquadweight = 2,
            raptorsquadrarity = "basic",
            raptorsquadbehavior = "berserk",
            raptorsquadbehaviordistance = 500,
            raptorsquadbehaviorchance = 0.75,
        },
		weapons = {
			[5] = {
				def = "",
			},
        },
    },
	raptor_queen_veryeasy = {
		selfdestructas = "customfusionexplo",
		explodeas = "customfusionexplo",
        maxthisunit = 3,
        customparams = {
            raptorcustomsquad = true,
            raptorsquadunitsamount = 1,
            raptorsquadminanger = 70,
            raptorsquadmaxanger = 150,
            raptorsquadweight = 1,
            raptorsquadrarity = "basic",
            raptorsquadbehavior = "berserk",
            raptorsquadbehaviordistance = 500,
            raptorsquadbehaviorchance = 0.75,
        },
		weapondefs = {
			melee = {
				damage = {
					default = 5000,
				},
			},
			yellow_missile = {
				damage = {
					default = 1,
					vtol = 500,
				},
			},
			goo = {
				range = 500,
				damage = {
					default = 1200,
				},
            },
        },
    },
	corcomlvl4 = {
		weapondefs = {
			disintegratorxl = {
				damage = {
					commanders = 0,
					default = 99999,
					scavboss = 1000,
					raptorqueen = 5000,
				},
			},
        },
    }
}