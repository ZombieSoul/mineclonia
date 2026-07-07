-- Dimension registration for Mineclonia: overworld, nether, end
-- Engine dimensions. Terrain generation is handled by Mineclonia's
-- own mcl_levelgen which runs in all dimensions via register_on_generated.
-- Mods can use the dim_name parameter to differentiate terrain per dimension.

minetest.log("action", "[mcl_dimensions] registering dimensions")

-- Nether
minetest.register_dimension("nether", {
    mapgen = "v7",
    settings = {
        mg_flags = "caves,light,decorations,biomes,ores",
        water_level = 31,
    },
})

-- End
minetest.register_dimension("end", {
    mapgen = "v7",
    settings = {
        mg_flags = "caves,light",
        water_level = 0,
    },
})

-- Log dimensions on startup
minetest.register_on_mods_loaded(function()
    minetest.after(0, function()
        local dims = minetest.get_registered_dimensions()
        local names = {}
        for name, def in pairs(dims) do
            table.insert(names, name .. " (id=" .. def.id .. ")")
        end
        minetest.log("action", "[mcl_dimensions] registered: " .. table.concat(names, ", "))
    end)
end)
