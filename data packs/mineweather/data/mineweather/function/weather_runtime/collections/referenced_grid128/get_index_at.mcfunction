#
# mineweather:weather_runtime/collections/referenced_grid128/get_index_at
#
# Get the index value of a 128x128 grid at a position
#> Scores
#  @x (in): the x position
#  @y (in): the y position
#> Storage
#  @grid_ref (in): the grid reference
#> Return data
#  index value

# Check for coordinates out of bounds
scoreboard players operation ::in x %= ::int 128
scoreboard players operation ::in y %= ::int 128

# Calculate index
scoreboard players operation ::in index = ::in x
scoreboard players operation ::in index *= ::int 128
scoreboard players operation ::in index += ::in y

# Get value
execute store result storage io: index int 1.0 run scoreboard players get ::in index
return run function mineweather:weather_runtime/collections/referenced_grid128/get_index_at/get with storage io:
