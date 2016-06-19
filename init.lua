local COLORS = {
"black",
"cyan",
"brown",
"blue",
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


for number = 1, 15 do

	local color = COLORS[number]


  minetest.register_node("painted_stone:"..color, {
      description = color.." stone",
      tiles = {"painted_stone.png ^[colorize:#FF0000"},
      groups = {cracky = 3},
      sounds = default.node_sound_defaults(),
  })



  stairsplus:register_all("colouredstonebricks", color, "colouredstonebricks:"..colour2, {
        description = color.." stone",
		tiles = {"painted_stone_"..color..".png"},
		groups = {cracky=3},
		sounds = default.node_sound_defaults(),
        sunlight_propagates = true,
    })
end
