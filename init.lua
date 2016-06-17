local COLORS = {
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
"#5C4033",
"#000054",
"#005400",
"#404040",
"#FF01FC",
"#01FF01",
"#808080",
"#FF7F01",
"#FF7FFC",
"#8401FF",
"#FF0000",
"#FFFFFF",
"#FFFC01",
}

for number = 1, 15 do

			local color = COLORS[number]
			local hex = HEXCODES[number]

			minetest.register_node("paintedstone:"..color.."_stone", {
						description = color.." Stone",
						tiles = {"paintedstone_stone.png^[colorize:"..hex..":120"},
						groups = {cracky = 3},
			})

			minetest.register_node("paintedstone:"..color.."_stone_brick", {
						description = color.." Stone Brick",
						tiles = {"paintedstone_stone_brick.png^[colorize:"..hex..":120"},
						groups = {cracky = 3},
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

--Stairsplus support
			stairsplus:resgister_all("paintedstone", color, "paintedstone:"..color.."_stone", {
								description = color.."Stone",
								tiles = {"paintedstone_stone.png^[colorize:"..hex..":120"},
								groups = {cracky = 3},
			})

			stairsplus:resgister_all("paintedstone", color, "paintedstone:"..color.."_stone_brick", {
								description = color.."Stone Brick",
								tiles = {"paintedstone_stone_brick.png^[colorize:"..hex..":120"},
								groups = {cracky = 3},
			})
end


minetest.register_alias("dye:dark_blue","dye:blue")
minetest.register_alias("dye:dark_pink","dye:magenta")
minetest.register_alias("dye:purple","dye:violet")
