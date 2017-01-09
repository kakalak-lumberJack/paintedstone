local COLORS = {
"Black",
"Cyan",
"brown",
"Dark Blue",
"Dark Green",
"Dark Grey",
"Magenta",
"Green",
"Grey",
"Orange",
"Pink",
"Violet",
"Red",
"White",
"Yellow"
}

local colors = {
"black",
"cyan",
"brown",
"dark_blue",
"dark_green",
"dark_grey",
"magenta",
"green",
"grey",
"orange",
"pink",
"violet",
"red",
"white",
"yellow"
}

local HEXCODES = {
"#000000",
"#01FFFC",
"#43382E",
"#0000FF",
"#005400",
"#404040",
"#FF01FC",
"#01FF01",
"#808080",
"#FF7F01",
"#FFC0CB",
"#8401FF",
"#FF0000",
"#FFFFFF",
"#FFFC01",
}

for number = 1, 15 do
			local Color = COLORS[number]
			local color = colors[number]
			local hex = HEXCODES[number]
--Register Stone
			minetest.register_node("paintedstone:"..color.."_stone", {
						description = Color.." Stone",
						tiles = {"paintedstone_stone.png^[colorize:"..hex..":120"},
						groups = {cracky = 3},
						sounds = default.node_sound_stone_defaults()
			})
--Register Stone Brick
			minetest.register_node("paintedstone:"..color.."_stone_brick", {
						description = Color.." Stone Brick",
						tiles = {"paintedstone_stone_brick.png^[colorize:"..hex..":120"},
						groups = {cracky = 3},
						sounds = default.node_sound_stone_defaults()
			})
--Register Steel Block
			minetest.register_node("paintedstone:"..color.."_steel_block",{
						description = Color.." Steel Block",
						tiles = {"paintedstone_steel_block.png^[colorize:"..hex..":120"},
						groups = {cracky = 2},
						sounds = default.node_sound_stone_defaults()
			})

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
end
--Stairsplus support

if minetest.get_modpath("moreblocks") ~= nil then

				for number = 1, 15 do
								local Color = COLORS[number]
								local color = colors[number]
								local hex = HEXCODES[number]


								stairsplus:register_all("paintedstone", color.."_stone", "paintedstone:"
								..color.."_stone", {
												description = Color.." Stone",
												tiles = {"paintedstone_stone.png^[colorize:"..hex..":120"},
												groups = {cracky = 3},
												sounds = default.node_sound_stone_defaults(),
								})

								stairsplus:register_all("paintedstone", color.. "_stone_brick", "paintedstone:"
								..color.."_stone_brick", {
													description = Color.." Stone Brick",
													tiles = {"paintedstone_stone_brick.png^[colorize:"..hex..":120"},
													groups = {cracky = 3},
													sounds = default.node_sound_stone_defaults(),
								})

								stairsplus:register_all("paintedstone", color.."_steel_block", "paintedstone:"
								..color.."_steel_block", {
											description = Color.." Steel Block",
											tiles = {"paintedstone_steel_block.png^[colorize:"..hex..":120"},
											groups = {cracky = 2},
											sounds = default.node_sound_stone_defaults(),
								})
					end
--Stairs and Slabs
elseif
		minetest.get_modpath("stairs") ~= nil then

			for number = 1, 15 do
							local Color = COLORS[number]
							local color = colors[number]
							local hex = HEXCODES[number]

							stairs.register_stair_and_slab(
												color.."_painted_stone",
												"paintedstone:"..color.."_stone",
												{cracky = 3},
												{"paintedstone_stone.png^[colorize:"..hex..":120"},
												color.." stone stair",
												color.." stone slab",
												default.node_sound_stone_defaults()
													)

									stairs.register_stair_and_slab(
												color.."_painted_stone_brick",
												"paintedstone:"..color.."_stone_brick",
												{cracky = 3},
												{"paintedstone_stone_brick.png^[colorize:"..hex..":120"},
												color.." stone brick stair",
												color.." stone brick slab",
												default.node_sound_stone_defaults()
									)

									stairs.register_stair_and_slab(
											color.."_painted_steel_block",
											"paintedstone:"..color.."_steel_block",
											{cracky = 2},
											{"paintedstone_steel_block.png^[colorize:"..hex..":120"},
											Color.." Steel Brick Stair",
											Color.." Steel Brick Slab",
											default.node_sound_stone_defaults()
									)
			end
end

minetest.register_alias("dye:dark_blue","dye:blue")
minetest.register_alias("dye:dark_pink","dye:magenta")
minetest.register_alias("dye:purple","dye:violet")
