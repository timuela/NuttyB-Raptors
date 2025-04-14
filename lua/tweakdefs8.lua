--Nervensaege's T3 Mod Construction Turret Overhaul with T3 Taxed Factories
-- Authors: Nervensaege
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local unitDefs, factions, tableMerge = UnitDefs or {}, {'arm', 'cor', 'leg'}, table.merge

-- Helper function: Checks if a table contains a specific element
local function tableContains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

for _, faction in pairs(factions) do
	local isArm, isCor, isLeg = faction == 'arm', faction == 'cor', faction == 'leg'

	-- T3 Construction Turret
	local baseUnit = faction .. 'nanotct2'
	local newUnit = faction .. 'nanotct3'
	if unitDefs[baseUnit] and not unitDefs[newUnit] then
		unitDefs[newUnit] =
			tableMerge(
			unitDefs[baseUnit],
			{
				metalcost = 3700,
				energycost = 62000,
				builddistance = 550,
				buildtime = 108000,
				collisionvolumescales = '61 128 61',
				footprintx = 6,
				footprintz = 6,
				health = 8800,
				mass = 37200,
				sightdistance = 575,
				workertime = 1900,
				canrepeat = true,
				objectname = isLeg and 'Units/legnanotcbase.s3o' or isCor and 'Units/CORRESPAWN.s3o' or 'Units/ARMRESPAWN.s3o',
				customparams = {
					i18n_en_humanname = 'T3 Construction Turret',
					i18n_en_tooltip = 'More BUILDPOWER! For the connoisseur'
				}
			}
		)
	end

	-- T3 Metal Storage
	baseUnit = isLeg and 'legamstor' or faction .. 'uwadvms'
	newUnit = isLeg and 'legamstort3' or faction .. 'uwadvmst3'
	if unitDefs[baseUnit] and not unitDefs[newUnit] then
		unitDefs[newUnit] =
			tableMerge(
			unitDefs[baseUnit],
			{
				metalstorage = 30000,
				metalcost = 4200,
				energycost = 231150,
				buildtime = 142800,
				health = 53560,
				maxthisunit = 3,
				name = faction:upper() .. ' T3 Metal Storage',
				customparams = {
					i18n_en_humanname = 'T3 Hardened Metal Storage',
					i18n_en_tooltip = 'The big metal storage tank for your most precious resources. Chopped chicken!'
				}
			}
		)
	end

	-- T3 Energy Storage
	baseUnit = isLeg and 'legadvestore' or faction .. 'uwadves'
	newUnit = isLeg and 'legadvestoret3' or faction .. 'advestoret3'
	if unitDefs[baseUnit] and not unitDefs[newUnit] then
		unitDefs[newUnit] =
			tableMerge(
			unitDefs[baseUnit],
			{
				energystorage = 272000,
				metalcost = 2100,
				energycost = 59000,
				buildtime = 93380,
				health = 49140,
				maxthisunit = 3,
				name = faction:upper() .. ' T3 Energy Storage',
				customparams = {
					i18n_en_humanname = 'T3 Hardened Energy Storage',
					i18n_en_tooltip = 'Power! Power! We need power!1!'
				}
			}
		)
	end

	-- T1/T2 Turret Overhaul
	for _, unit in pairs({faction .. 'nanotc', faction .. 'nanotct2'}) do
		if unitDefs[unit] then
			unitDefs[unit].canrepeat = true
		end
	end

	-- T3 Taxed Factories (specific to Gantrys: armshltx, corgant, leggant)
	local CostMultiplier = 1.5

	local baseFactory = isArm and 'armshltx' or isCor and 'corgant' or 'leggant'
	local taxedFactory = baseFactory .. '_taxed'
	if unitDefs[baseFactory] and not unitDefs[taxedFactory] then
		unitDefs[taxedFactory] =
			tableMerge(
			unitDefs[baseFactory],
			{
				metalcost = unitDefs[baseFactory].metalcost * CostMultiplier,
				energycost = unitDefs[baseFactory].energycost * CostMultiplier,
				name = faction:upper() .. ' Experimental Gantry Taxed',
				customparams = tableMerge(
					unitDefs[baseFactory].customparams or {},
					{
						i18n_en_humanname = faction:upper() .. ' Experimental Gantry Taxed',
						i18n_en_tooltip = 'Produces Experimental Units'
					}
				)
			}
		)
	end

	-- Epic Ground Constructor Aide
	newUnit = faction .. 't3aide'
	if not unitDefs[newUnit] then
		unitDefs[newUnit] =
			tableMerge(
			unitDefs[faction .. 'decom'],
			{
				blocking = true,
				builddistance = 350,
				buildtime = 140000,
				energycost = 200000,
				energyupkeep = 2000,
				health = 10000,
				idleautoheal = 5,
				idletime = 1800,
				maxthisunit = 1,
				metalcost = 12600,
				speed = 85,
				terraformspeed = 3000,
				turninplaceanglelimit = 1.890,
				turnrate = 1240,
				workertime = 6000,
				reclaimable = true,
				candgun = false,
				name = faction:upper() .. ' Epic Aide',
				customparams = {
					subfolder = 'ArmBots/T3',
					techlevel = 3,
					unitgroup = 'buildert3',
					i18n_en_humanname = 'Epic Ground Construction Aide',
					i18n_en_tooltip = 'Your Aide that helps you construct buildings'
				},
				buildoptions = {
					isLeg and 'legadveconvt3' or faction .. 'mmkrt3',
					faction .. 'afust3',
					faction .. 'nanotct2',
					faction .. 'nanotct3',
					faction .. 'alab',
					faction .. 'avp',
					faction .. 'aap',
					faction .. 'gatet3',
					faction .. 'flak',
					isLeg and 'legamstort3' or faction .. 'uwadvmst3',
					isLeg and 'legadvestoret3' or faction .. 'advestoret3',
					isLeg and 'legdeflector' or faction .. 'gate',
					isLeg and 'legforti' or faction .. 'fort',
					isArm and 'armshltx' or faction .. 'gant',
					faction ~= 'arm' and 'armshltx_taxed' or nil,
					faction ~= 'cor' and 'corgant_taxed' or nil,
					faction ~= 'leg' and 'leggant_taxed' or nil,
					isArm and 'armamd' or nil,
					isArm and 'armmercury' or nil,
					isArm and 'armbrtha' or nil,
					isArm and 'armminivulc' or nil,
					isArm and 'armvulc' or nil,
					isArm and 'armanni' or nil,
					isArm and 'armannit3' or nil,
					isArm and 'armlwall' or nil,
					isCor and 'corfmd' or nil,
					isCor and 'corscreamer' or nil,
					isCor and 'cordoomt3' or nil,
					isCor and 'corbuzz' or nil,
					isCor and 'corminibuzz' or nil,
					isCor and 'corint' or nil,
					isCor and 'cordoom' or nil,
					isCor and 'corhllllt' or nil,
					isCor and 'cormwall' or nil,
					isLeg and 'legabm' or nil,
					isLeg and 'legstarfall' or nil,
					isLeg and 'legministarfall' or nil,
					isLeg and 'leglraa' or nil,
					isLeg and 'legbastion' or nil,
					isLeg and 'legrwall' or nil,
					isLeg and 'leglrpc' or nil
				}
			}
		)

		-- Remove nil entries from buildoptions
		local cleanedBuildOptions = {}
		for _, option in pairs(unitDefs[newUnit].buildoptions) do
			if option then
				table.insert(cleanedBuildOptions, option)
			end
		end
		unitDefs[newUnit].buildoptions = cleanedBuildOptions
		unitDefs[newUnit].weapondefs = {}
		unitDefs[newUnit].weapons = {}
	end

	-- Epic Air Constructor Aide
	newUnit = faction .. 't3airaide'
	if not unitDefs[newUnit] then
		unitDefs[newUnit] =
			tableMerge(
			unitDefs['armfify'],
			{
				blocking = false,
				canassist = true,
				cruisealtitude = 3000,
				builddistance = 1750,
				buildtime = 140000,
				energycost = 200000,
				energyupkeep = 2000,
				health = 1100,
				idleautoheal = 5,
				idletime = 1800,
				maxthisunit = 1,
				metalcost = 13400,
				speed = 25,
				terraformspeed = 3000,
				turninplaceanglelimit = 1.890,
				turnrate = 1240,
				workertime = 1600,
				buildpic = 'ARMFIFY.DDS',
				name = faction:upper() .. ' Epic Aide',
				customparams = {
					subfolder = 'ArmBots/T3',
					techlevel = 3,
					unitgroup = 'buildert3',
					i18n_en_humanname = 'Epic Air Construction Aide',
					i18n_en_tooltip = 'Your Aide that helps you construct buildings'
				},
				buildoptions = {
					isLeg and 'legadveconvt3' or faction .. 'mmkrt3',
					faction .. 'afust3',
					faction .. 'nanotct2',
					faction .. 'nanotct3',
					faction .. 'alab',
					faction .. 'avp',
					faction .. 'aap',
					faction .. 'gatet3',
					faction .. 'flak',
					isLeg and 'legamstort3' or faction .. 'uwadvmst3',
					isLeg and 'legadvestoret3' or faction .. 'advestoret3',
					isLeg and 'legdeflector' or faction .. 'gate',
					isLeg and 'legforti' or faction .. 'fort',
					isArm and 'armshltx' or faction .. 'gant',
					faction ~= 'arm' and 'armshltx_taxed' or nil,
					faction ~= 'cor' and 'corgant_taxed' or nil,
					faction ~= 'leg' and 'leggant_taxed' or nil,
					isArm and 'armamd' or nil,
					isArm and 'armmercury' or nil,
					isArm and 'armbrtha' or nil,
					isArm and 'armminivulc' or nil,
					isArm and 'armvulc' or nil,
					isArm and 'armanni' or nil,
					isArm and 'armannit3' or nil,
					isArm and 'armlwall' or nil,
					isCor and 'corfmd' or nil,
					isCor and 'corscreamer' or nil,
					isCor and 'cordoomt3' or nil,
					isCor and 'corbuzz' or nil,
					isCor and 'corminibuzz' or nil,
					isCor and 'corint' or nil,
					isCor and 'cordoom' or nil,
					isCor and 'corhllllt' or nil,
					isCor and 'cormwall' or nil,
					isLeg and 'legabm' or nil,
					isLeg and 'legstarfall' or nil,
					isLeg and 'legministarfall' or nil,
					isLeg and 'leglraa' or nil,
					isLeg and 'legbastion' or nil,
					isLeg and 'legrwall' or nil,
					isLeg and 'leglrpc' or nil
				}
			}
		)

		-- Remove nil entries from buildoptions
		local cleanedBuildOptions = {}
		for _, option in pairs(unitDefs[newUnit].buildoptions) do
			if option then
				table.insert(cleanedBuildOptions, option)
			end
		end
		unitDefs[newUnit].buildoptions = cleanedBuildOptions
		unitDefs[newUnit].weapondefs = {}
		unitDefs[newUnit].weapons = {}
	end

	-- Buildoptions for T3 Gantrys (Ground)
	local factoryName = isArm and 'armshltx' or isCor and 'corgant' or 'leggant'
	if unitDefs[factoryName] and unitDefs[factoryName].buildoptions then
		local groundAide = faction .. 't3aide'
		if not tableContains(unitDefs[factoryName].buildoptions, groundAide) then
			table.insert(unitDefs[factoryName].buildoptions, groundAide)
		end
	end

	-- Buildoptions for T3 Gantrys (air)
	factoryName = faction .. 'apt3'
	if unitDefs[factoryName] and unitDefs[factoryName].buildoptions then
		local airAide = faction .. 't3airaide'
		if not tableContains(unitDefs[factoryName].buildoptions, airAide) then
			table.insert(unitDefs[factoryName].buildoptions, airAide)
		end
	end
end
