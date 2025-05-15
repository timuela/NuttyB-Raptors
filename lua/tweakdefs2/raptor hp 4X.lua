--NuttyB v1.52 4X HP
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
for f, g in pairs(UnitDefs) do
	if string.sub(f, 1, 24) == 'raptor_land_swarmer_heal' then
		g.reclaimspeed = 100
		g.stealth = 0
		g.builder = false
		g.workertime = g.workertime * 0.45
		g.canassist = 0
		g.maxthisunit = 0
	end
	if
		g.customparams and g.customparams.subfolder and g.customparams.subfolder == 'other/raptors' and g.health and
			not f:match('^raptor_queen_.*')
	 then
		g.health = 4 * g.health
		g.nochasecategory = "OBJECT"
	end
end
local h = UnitDef_Post
function UnitDef_Post(i, j)
	h(i, j)
	for i, k in pairs(UnitDefs) do
		if k.customparams and k.customparams.subfolder and k.customparams.subfolder == 'other/raptors' then
			if k then
				k.metalcost = math.floor(k.health * .25)
			end
		end
	end
end
