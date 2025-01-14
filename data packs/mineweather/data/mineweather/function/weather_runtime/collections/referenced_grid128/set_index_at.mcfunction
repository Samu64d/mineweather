#
# mineweather:weather_runtime/collections/referenced_grid128/set_index_at
#
# Set the index value of a 128x128 grid at a position
#> Scores
#  @x (in): the x position
#  @y (in): the y position
#  @value (in): the grid base value
#> Storage
#  @grid_ref (in): the grid reference
#> Return void

# Get width
# Check for coordinates out of bounds
scoreboard players operation ::in x %= ::int 128
scoreboard players operation ::in y %= ::int 128

# Calculate index
scoreboard players operation ::in index = ::in x
scoreboard players operation ::in index *= ::int 128
scoreboard players operation ::in index += ::in y

# Set value
execute store result storage io: index int 1.0 run scoreboard players get ::in index
function mineweather:weather_runtime/collections/referenced_grid128/set_index_at/set with storage io:
