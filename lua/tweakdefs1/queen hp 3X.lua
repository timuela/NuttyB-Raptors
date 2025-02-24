--NuttyB v1.52 3X QHP
local a = {
	health = 1380000,
	repairable = false,
	canbehealed = false,
	buildtime = 9999999,
	autoheal = 2,
	canSelfRepair = false
}
for b, c in pairs(UnitDefs) do
	if b:match('^raptor_queen_.*') then
		for d, e in pairs(a) do
			c[d] = e
		end
	end
end
