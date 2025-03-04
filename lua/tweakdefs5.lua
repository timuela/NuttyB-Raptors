--Raptor speed 50%
local unitDefs = UnitDefs or {}
for key, value in pairs(unitDefs) do
	if key.name:find('raptor') then
		value.speed = value.speed * 0.5
	end
end
