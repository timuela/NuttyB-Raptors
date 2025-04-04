--NuttyB lrpc rebalance v1
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
return {
	armbrtha = {
		health = 13000,
		weapondefs = {
			ARMBRTHA_MAIN = {
				areaofeffect = 60,
				energypershot = 8000,
				range = 2400,
				reloadtime = 9,
				damage = {
					commanders = 480,
					default = 33000
				}
			}
		}
	},
	corint = {
		health = 13000,
		weapondefs = {
			CORINT_MAIN = {
				areaofeffect = 230,
				edgeeffectiveness = 0.6,
				energypershot = 15000,
				range = 2700,
				reloadtime = 20,
				damage = {
					commanders = 480,
					default = 80000
				}
			}
		}
	},
	leglrpc = {
		health = 13000,
		weapondefs = {
			LEGLRPC_MAIN = {
				areaofeffect = 140,
				energypershot = 5000,
				range = 2000,
				reloadtime = 2,
				damage = {
					commanders = 480,
					default = 17000
				}
			}
		}
	}
}
