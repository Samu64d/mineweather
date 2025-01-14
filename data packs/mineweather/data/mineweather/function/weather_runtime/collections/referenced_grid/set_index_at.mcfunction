#
# mineweather:weather_runtime/collections/referenced_grid/set_index_at
#
# Set the index value of a grid at a position
#> Scores
#  @x (in): the x position
#  @y (in): the y position
#  @value (in): the grid base value
#> Storage
#  @grid_ref (in): the grid reference
#> Return void

# Get width
execute store result score ::mineweather::weather_runtime::collections::referenced_grid width run function mineweather:weather_runtime/collections/referenced_grid/get_width

# Get height
execute store result score ::mineweather::weather_runtime::collections::referenced_grid height run function mineweather:weather_runtime/collections/referenced_grid/get_height

# Check for coordinates out of bounds
scoreboard players operation ::in x %= ::mineweather::weather_runtime::collections::referenced_grid width
scoreboard players operation ::in y %= ::mineweather::weather_runtime::collections::referenced_grid height

# Calculate index
scoreboard players operation ::in index = ::in x
scoreboard players operation ::in index *= ::mineweather::weather_runtime::collections::referenced_grid height
scoreboard players operation ::in index += ::in y

# Set value
execute store result storage io: index int 1.0 run scoreboard players get ::in index
function mineweather:weather_runtime/collections/referenced_grid/set_index_at/set with storage io:
