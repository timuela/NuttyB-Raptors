--T3 Eco
local unitDefs = UnitDefs or {}
local t3Afus = 'lootboxplatinum'
local t3Conv = 'armdf'
local energy = {
	buildpic = 'other/resourcecheat.dds',
	buildtime = 1000000,
	energycost = 500000,
	energymake = 30000,
	energystorage = 90000,
	explodeas = 'korgExplosionSelfd',
	health = 10000,
	metalcost = 97000,
	metalmake = 0,
	reclaimable = true
}
local converter = {
	activatewhenbuilt = true,
	buildpic = 'lootboxes/LOOTBOXGOLD.DDS',
	buildtime = 313000,
	energycost = 500000,
	energymake = 0,
	explodeas = 'fusionExplosion',
	decoyfor = nil,
	health = 1000,
	maxwaterdepth = 20,
	metalcost = 8000,
	objectname = 'Units/CORUWFUS.s3o',
	script = 'Units/CORUWFUS.cob',
	selfdestructas = 'fusionExplosionSelfd'
}
local converterCustomparams = {
	energyconv_capacity = 5000,
	energyconv_efficiency = 0.02,
	decoyfor = nil,
	i18n_en_humanname = 'Super Energy Converter',
	i18n_en_tooltip = 'Converts 5000 energy into 125 metal per sec',
	subfolder = 'ArmBuildings/LandEconomy',
	techlevel = '3',
	translatedHumanName = 'Super Energy Converter',
	unitgroup = 'metal'
}
local converterFeaturedefsDead = {
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
}
local converterFeaturedefsHeap = {
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

for key, value in pairs(energy) do
	unitDefs[t3Afus][key] = value
end

unitDefs[t3Afus].customparams.i18n_en_humanname = 'Super Fusion Reactor'
unitDefs[t3Afus].customparams.i18n_en_tooltip = 'Produces 30000 Energy, Transportable (Very Hazardous)'
unitDefs[t3Afus].customparams.techlevel = '3'
-- unitDefs[t3Afus].customparams.modCategories['object'] = false
unitDefs[t3Afus].translatedHumanName = 'Super Fusion Reactor'
-- unitDefs[t3Afus].modCategories['object'] = false
unitDefs[t3Afus].canMove = nil
unitDefs[t3Afus].canmove = nil

for key, value in pairs(converter) do
	unitDefs[t3Conv][key] = value
end

for key, value in pairs(converterCustomparams) do
	unitDefs[t3Conv].customparams[key] = value
end

for key, value in pairs(converterFeaturedefsDead) do
	unitDefs[t3Conv].featuredefs.dead[key] = value
end
for key, value in pairs(converterFeaturedefsHeap) do
	unitDefs[t3Conv].featuredefs.heap[key] = value
end

for i = 1, #builderNames do
	local builderName = builderNames[i]
	local nBuildOptions = #unitDefs[builderName].buildoptions
	unitDefs[builderName].buildoptions[nBuildOptions + 1] = t3Conv
	unitDefs[builderName].buildoptions[nBuildOptions + 2] = t3Afus
end

local h = UnitDef_Post
function UnitDef_Post(i, j)
	h(i, j)
	unitDefs[t3Afus].canMove = nil
	unitDefs[t3Afus].canmove = nil
	unitDefs[t3Conv].decoyfor = nil
end
