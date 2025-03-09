--NuttyB v1.52 13X QHP
for b, c in pairs(UnitDefs) do
	if b:match('^raptor_queen_.*') then
		c.repairable = false
		c.canbehealed = false
		c.buildtime = 9999999
		c.autoheal = 2
		c.canSelfRepair = false
		c.health = c.health * 13
	end
end
