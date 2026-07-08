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
    -- Spawn above the lava sea (Y=31) on the nether terrain surface.
    -- mcl_levelgen generates nether terrain at Y=0..127; Y=64 is a
    -- safe midpoint above the lava level.
    spawn_pos = {x = 0, y = 64, z = 0},
})

-- End
minetest.register_dimension("end", {
    mapgen = "v7",
    settings = {
        mg_flags = "caves,light",
        water_level = 0,
    },
    -- Spawn on the end platform area. mcl_levelgen generates end terrain
    -- around Y=48 (the obsidian platform level).
    spawn_pos = {x = 0, y = 50, z = 0},
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
