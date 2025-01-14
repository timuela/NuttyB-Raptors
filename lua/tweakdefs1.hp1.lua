-- NuttyB v1.52 1.3X Raptor HP
local a = {
	health = 1740000,
	repairable = false,
	canbehealed = false,
	buildtime = 9999999,
	autoheal = 2,
	canSelfRepair = false
}
for b, c in pairs(UnitDefs) do
	if b == 'raptor_queen_epic' then
		for d, e in pairs(a) do
			c[d] = e
		end
	end
end
for f, g in pairs(UnitDefs) do
	if string.sub(f, 1, 24) == 'raptor_land_swarmer_heal' then
		g.reclaimspeed = 100
		g.stealth = 0
		g.builder = false
		g.workertime = g.workertime * 0.5
		g.canassist = 0
	end
end
for b, c in pairs(UnitDefs) do
	if c.customparams and c.customparams.subfolder and c.customparams.subfolder == 'other/raptors' then
		if c.health then
			c.health = 1.3 * c.health
		end
	end
end
