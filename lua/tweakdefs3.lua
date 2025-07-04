--Hive Spawn
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
	'raptor_land_swarmer_basic_t1_v1',
	'raptor_hive_swarmer_basic',
	{
		name = 'Hive Spawn',
		customparams = {
			i18n_en_humanname = 'Hive Spawn',
			i18n_en_tooltip = 'Raptor spawned to defend hives from attackers.'
		}
	}
)

cloneUnit(
	'raptor_land_assault_basic_t2_v1',
	'raptor_hive_assault_basic',
	{
		name = 'Armored Assualt Raptor',
		customparams = {
			i18n_en_humanname = 'Armored Assualt Raptor',
			i18n_en_tooltip = 'These armored beast are slow but can take a hit.'
		}
	}
)

local h = UnitDef_Post
function UnitDef_Post(i, j)
	if h then
		h(i, j)
	end

	for name, unitDef in pairs(UnitDefs) do
		if unitDef.metalcost then
			if name == 'raptor_hive_swarmer_basic' then
				unitDef.metalcost = 350
				unitDef.nochasecategory = 'OBJECT'
				unitDef.icontype = 'raptor_land_swarmer_basic_t1_v1'
			elseif name == 'raptor_hive_assault_basic' then
				unitDef.metalcost = 3000
				unitDef.health = 25000
				unitDef.speed = 20.0
				unitDef.nochasecategory = 'OBJECT'
				unitDef.icontype = 'raptor_land_swarmer_basic_t1_v1'
			end
		end
	end
end
