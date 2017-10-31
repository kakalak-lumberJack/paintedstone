
colors = {
	{"black", "Black", "#000000"},
	{"grey", "Grey", "#C0C0C0"},
	{"dark_grey", "Dark Grey", "#404040"},
	{"white", "White", "#FFFFFF"},
	{"cyan", "Cyan", "#01FFFC"},
	{"brown", "Brown", "#8B4513"},
	{"dark_blue", "Dark Blue", "#0000FF"},
	{"dark_green", "Dark Green", "#005400"},
	{"magenta", "Magenta", "#FF01FC"},
	{"green", "Green", "#01FF01"},
	{"orange", "Orange", "#FF7F01"},
	{"pink", "Pink", "#FFC0CB"},
	{"violet", "Violet", "#8401FF"},
	{"red", "Red", "#FF0000"},
	{"yellow", "Yellow", "#FFFC01"}
}

for _, val in ipairs(colors) do
	local Color = val[2]
	local color = val[1]
	local hex = val[3]
--Register Stone
	minetest.register_node("paintedstone:"..color.."_stone", {
		description = Color.." Stone",
		tiles = {"default_stone.png^[colorize:"..hex..":120"},
		groups = {cracky = 3, stone = 1},
		sounds = default.node_sound_stone_defaults()
	})
--Register Stone Brick
	minetest.register_node("paintedstone:"..color.."_stone_brick", {
		description = Color.." Stone Brick",
		tiles = {"default_stone_brick.png^[colorize:"..hex..":120"},
		groups = {cracky = 3},
		sounds = default.node_sound_stone_defaults()
	})
--Register Steel Block
	minetest.register_node("paintedstone:"..color.."_steel_block",{
		description = Color.." Steel Block",
		tiles = {"default_steel_block.png^[colorize:"..hex..":120"},
		groups = {cracky = 2},
		sounds = default.node_sound_stone_defaults()
	})
--Register Glass	
	minetest.register_node("paintedstone:"..color.."_glow_glass",{
		description = Color.." Glow Glass Block",
		tiles = {"paintedstone_glow_glass.png^[colorize:"..hex..":120"},
		drawtype = "glasslike_framed_optional",
		paramtype = "light",
		sunlight_propogates = true,
		light_source = 14,
		groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = default.node_sound_glass_defaults()
	})
-- Register darkened and lightened stone blocks	
	if val[1] ~= "black"  and val[1] ~= "grey" and val[1] ~= "dark_grey"
	and val[1] ~= "white" then
		minetest.register_node("paintedstone:darkened_"..color.."_stone", {
			description = "Darkened "..Color.." Stone",
			tiles = {"default_stone.png^[colorize:#181818:90^[colorize:"..hex..":110"},
			groups = {cracky = 2, stone = 1},
			sounds = default.node_sound_stone_defaults()
		})
		
		minetest.register_node("paintedstone:bright_"..color.."_stone", {
			description = "Bright "..Color.." Stone",
			tiles = {"default_stone.png^[colorize:#D8D8D8:90^[colorize:"..hex..":100"},
			groups = {cracky = 2, stone = 1},
			sounds = default.node_sound_stone_defaults()
		})
	end

--crafting recipes
	minetest.register_craft({
		type = "shapeless",
		output = "paintedstone:"..color.."_stone",
		recipe = {
					'dye:'..color, 'default:stone',
		}
	})
	
	minetest.register_craft({
		type = "shapeless",
		output = "paintedstone:"..color.."_stone_brick",
		recipe = {
					'dye:'..color, 'default:stonebrick',
		}
	})

	minetest.register_craft({
		type = "shapeless",
		output = "paintedstone:"..color.."_steel_block",
		recipe = {
				'dye:'..color, 'default:steelblock',
		}
	})

	minetest.register_craft({
		output = "paintedstone:"..color.."_glow_glass",
		recipe = {
			{"", "dye:"..color, ""},
			{"default:torch", "default:glass", "default:torch"}
		}	
	})
end

for _, val in ipairs(colors) do
	local Color = val[2]
	local color = val[1]
	local hex = val[3]
	
	if val[1] ~= "black"  and val[1] ~= "grey" and val[1] ~= "dark_grey"
	and val[1] ~= "white" then
		minetest.register_craft({
			type = "shapeless",
			output = "paintedstone:darkened_"..color.."_stone",
			recipe = {
				'dye:black', 'paintedstone:'..color.."_stone",
			}
		})

		minetest.register_craft({
			type = "shapeless",
			output = "paintedstone:bright_"..color.."_stone",
			recipe = {
				'dye:white', 'paintedstone:'..color.."_stone",
			}
		})
	end
end

--Stairsplus support

if minetest.get_modpath("moreblocks") ~= nil then
	for _, val in ipairs(colors) do
		local Color = val[2]
		local color = val[1]
		local hex = val[3]

		stairsplus:register_all("paintedstone", color.."_stone", "paintedstone:"
		..color.."_stone", {
			description = Color.." Stone",
			tiles = {"default_stone.png^[colorize:"..hex..":120"},
			groups = {cracky = 3},
			sounds = default.node_sound_stone_defaults(),
		})

		stairsplus:register_all("paintedstone", color.. "_stone_brick", "paintedstone:"
		..color.."_stone_brick", {
			description = Color.." Stone Brick",
			tiles = {"default_stone_brick.png^[colorize:"..hex..":120"},
			groups = {cracky = 3},
			sounds = default.node_sound_stone_defaults(),
		})

		stairsplus:register_all("paintedstone", color.."_steel_block", "paintedstone:"
		..color.."_steel_block", {
			description = Color.." Steel Block",
			tiles = {"default_steel_block.png^[colorize:"..hex..":120"},
			groups = {cracky = 2},
			sounds = default.node_sound_stone_defaults(),
		})
		
		stairsplus:register_all("paintedstone", color.."_glow_glass", "paintedstone:"
		..color.."_glow_glass", {
			description = Color.." Glow Glass",
			tiles = {"paintedstone_glow_glass.png^[colorize:"..hex..":120"},
			paramtype = "light",
			groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3},
			sunlight_propogates = true,
			light_source = 14,
			sounds = default.node_sound_glass_defaults(),
		})
	end
--Stairs and Slabs
elseif
	minetest.get_modpath("stairs") ~= nil then
	for _, val in ipairs(colors) do
		local Color = val[2]
		local color = val[1]
		local hex = val[3]

		stairs.register_stair_and_slab(
			color.."_painted_stone",
			"paintedstone:"..color.."_stone",
			{cracky = 3, not_in_creative_inventory = 1},
			{"default_stone.png^[colorize:"..hex..":120"},
			color.." stone stair",
			color.." stone slab",
			default.node_sound_stone_defaults()				
		)

		stairs.register_stair_and_slab(
			color.."_painted_stone_brick",
			"paintedstone:"..color.."_stone_brick",
			{cracky = 3, not_in_creative_inventory = 1},
			{"default_stone_brick.png.png^[colorize:"..hex..":120"},
			color.." stone brick stair",
			color.." stone brick slab",
			default.node_sound_stone_defaults()
		)

		stairs.register_stair_and_slab(
			color.."_painted_steel_block",
			"paintedstone:"..color.."_steel_block",
			{cracky = 2, not_in_creative_inventory = 1},
			{"default_steel_block.png^[colorize:"..hex..":120"},
			Color.." Steel Block Stair",
			Color.." Steel Block Slab",
			default.node_sound_stone_defaults()
		)
		
		stairs.register_stair_and_slab(
			color.."_glow_glass",
			"paintedstone:"..color.."_glow_glass",
			{snappy = 2, cracky = 3, oddly_breakable_by_hand = 3, not_in_creative_inventory = 1},
			{"paintedstone_glow_glass.png^[colorize:"..hex..":120"},
			Color.." Glow Glass Stair",
			Color.." Glow Glass Slab",
			default.node_sound_glass_defaults()
		)
	end
end

minetest.register_alias("dye:dark_blue","dye:blue")
minetest.register_alias("dye:dark_pink","dye:magenta")
minetest.register_alias("dye:purple","dye:violet")


