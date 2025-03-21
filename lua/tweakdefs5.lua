--Playable raptors test balance
-- Authors: TetrisCo
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local unitDefs = UnitDefs or {}
for key, value in pairs(unitDefs) do
	if key.name:find('raptor') then
		value.speed = value.speed * 0.5
	end
end
-- TODO disable hive shooting raptors
-- raptor_hive = {
-- 	weapondefs = {
-- 		antiground = {
-- 			burst = 5,
-- 			burstrate = 0.01,
-- 			cegtag = 'arty-heavy-purple',
-- 			explosiongenerator = 'custom:dirt',
-- 			model = 'Raptors/s_raptor_white.s3o',
-- 			range = 1500,
-- 			reloadtime = 4,
-- 			rgbcolor = '0.5 0 1',
-- 			soundhit = 'smallraptorattack',
-- 			soundstart = 'bugarty',
-- 			sprayangle = 512,
-- 			turret = true,
-- 			damage = {
-- 				default = 1,
-- 				shields = 200
-- 			},
-- 			customparams = {
-- 				spawns_name = 'raptor_land_swarmer_basic_t1_v1',
-- 				spawns_surface = 'LAND SEA' -- Available: "LAND SEA"
-- 			}
-- 		}
-- 	}
-- }
