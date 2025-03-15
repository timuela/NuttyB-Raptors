--Cross Faction 100% T2 Tax
-- Authors: TetrisCo
local unitDefs, tax, t2Factories, taxedT2Factories = UnitDefs or {}, 1.75, {}, {}
for name, def in pairs(unitDefs) do
	if
		def.customparams and def.customparams.subfolder and
			(def.customparams.subfolder:match 'Fact' or def.customparams.subfolder:match 'Lab') and
			def.customparams.techlevel == 2
	 then
		t2Factories[name] = true
		taxedT2Factories[name .. '_taxed'] =
			table.merge(def, {metalcost = def.metalcost * tax, energycost = def.energycost * tax})
	end
end

for builderName, T1T2BuilderDef in pairs(unitDefs) do
	if T1T2BuilderDef.buildoptions then
		for _, buildoption in pairs(T1T2BuilderDef.buildoptions) do
			if t2Factories[buildoption] then -- has non-cross-faction T2 factory
				for _, faction in pairs {'arm', 'cor', 'leg'} do
					local crossfactionTaxedOption = faction .. buildoption:sub(4) .. '_taxed'
					if buildoption:sub(1, 3) ~= faction and taxedT2Factories[crossfactionTaxedOption] then
						unitDefs[builderName].buildoptions[#unitDefs[builderName].buildoptions + 1] = crossfactionTaxedOption
					end
				end
			end
		end
	end
end

table.mergeInPlace(unitDefs, taxedT2Factories)
