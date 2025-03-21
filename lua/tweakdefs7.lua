--T3 Eco builtin v5
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local unitDefs, cons =
	UnitDefs or {},
	{
		'armack',
		'armaca',
		'armacv',
		'corack',
		'coraca',
		'coracv',
		'legack',
		'legaca',
		'legacv'
	}

for _, builderName in pairs(cons) do
	local faction, nBuildOptions = builderName:sub(1, 3), #unitDefs[builderName].buildoptions
	unitDefs[builderName].buildoptions[nBuildOptions + 1] = faction .. 'afust3'
	unitDefs[builderName].buildoptions[nBuildOptions + 2] = faction == 'leg' and 'legadveconvt3' or faction .. 'mmkrt3'
end
