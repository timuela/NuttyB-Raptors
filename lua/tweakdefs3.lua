--T3 Eco balanced v4
-- Authors: Engi Man, TetrisCo
local unitDefs = UnitDefs or {}
local fusionName = 'lootboxplatinum'
local converterNameSource = 'armdf'
local converterNameNew = 'armdf_t3_converter'
local ArmBuildingsLandEconomy = 'ArmBuildings/LandEconomy'
local u4 = 'uuuu'
local o4 = 'oooo'
local rowU = u4 .. u4 .. u4
local rowM = u4 .. o4 .. u4

local fusionEnergyMake = 27000
local fusion = {
	buildpic = 'other/resourcecheat.dds',
	buildtime = 1000000,
	canmove = false,
	energycost = 550000,
	energymake = fusionEnergyMake,
	energystorage = 90000,
	explodeas = 'korgExplosionSelfd',
	footprintx = 12,
	footprintz = 12,
	health = 10000,
	metalcost = 110000,
	metalmake = 0,
	reclaimable = true,
	transportbyenemy = false,
	yardmap = rowU:rep(4) .. rowM:rep(4) .. rowU:rep(4),
	customparams = {
		i18n_en_humanname = 'Super Fusion Reactor',
		i18n_en_tooltip = 'Produces ' .. fusionEnergyMake .. ' Energy (Very Hazardous)',
		paratrooper = false,
		techlevel = 3,
		subfolder = ArmBuildingsLandEconomy,
		unitgroup = 'energy'
	}
}

local converterCapacity = 4500
local converterEfficiency = 0.0181
local converter = {
	activatewhenbuilt = true,
	buildpic = 'lootboxes/LOOTBOXGOLD.DDS',
	buildtime = 313000,
	canmove = false,
	energycost = 550000,
	energymake = 0,
	explodeas = 'fusionExplosion',
	footprintx = 6,
	footprintz = 6,
	health = 1000,
	metalcost = 9000,
	objectname = 'Units/CORUWFUS.s3o',
	script = 'Units/CORUWFUS.cob',
	selfdestructas = 'fusionExplosionSelfd',
	translatedHumanName = 'Super Energy Converter',
	customparams = {
		energyconv_capacity = converterCapacity,
		energyconv_efficiency = converterEfficiency,
		i18n_en_humanname = 'Super Energy Converter',
		i18n_en_tooltip = 'Converts ' ..
			converterCapacity .. ' energy into ' .. math.floor(0.5 + converterCapacity * converterEfficiency) .. ' metal per sec',
		subfolder = ArmBuildingsLandEconomy,
		techlevel = 3,
		unitgroup = 'metal'
	},
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
	}
}

local builderNames = {
	'armaca',
	'armack',
	'armacv',
	'coraca',
	'corack',
	'coracv',
	'legaca',
	'legack',
	'legacv'
}

table.mergeInPlace(
	unitDefs,
	{
		[fusionName] = fusion,
		[converterNameNew] = table.merge(unitDefs[converterNameSource], converter)
	},
	true
)

-- not pushable by T3
unitDefs[fusionName]['movestate'] = nil
unitDefs[fusionName]['movementclass'] = nil
unitDefs[fusionName]['speed'] = nil
unitDefs[fusionName]['floater'] = nil

for i = 1, #builderNames do
	local builderName = builderNames[i]
	local nBuildOptions = #unitDefs[builderName].buildoptions
	-- grid menu is filled from the bottom up
	unitDefs[builderName].buildoptions[nBuildOptions + 2] = converterNameNew
	unitDefs[builderName].buildoptions[nBuildOptions + 1] = fusionName
end
