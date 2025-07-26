-- NuttyB v1.52 5X HP
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
for unitName, unitDef in pairs(UnitDefs) do
    if string.sub(unitName, 1, 24) == "raptor_land_swarmer_heal" then
        unitDef.reclaimspeed = 100
        unitDef.stealth = 0
        unitDef.builder = 0
        unitDef.workertime = unitDef.workertime * 0.25
        unitDef.canassist = 0
        unitDef.maxthisunit = 0
    end

    if unitDef.customparams and unitDef.customparams.subfolder == "other/raptors" and unitDef.health then
        unitDef.health = unitDef.health * 5
        unitDef.sfxtypes = {}
        unitDef.explodas = unitDef.explodas
        unitDef.nochasecategory = "OBJECT"
    end
end

local oldUnitDef_Post = UnitDef_Post
function UnitDef_Post(unitID, unitDef)
    if oldUnitDef_Post and oldUnitDef_Post ~= UnitDef_Post then
        oldUnitDef_Post(unitID, unitDef)
    end

    for unitName, def in pairs(UnitDefs) do
        if def.customparams and def.customparams.subfolder == "other/raptors" and def.health then
            def.metalcost = math.floor(def.health * 0.15)
        end
    end
end
