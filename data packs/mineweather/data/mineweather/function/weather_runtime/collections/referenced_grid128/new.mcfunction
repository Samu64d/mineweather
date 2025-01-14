#
# mineweather:weather_runtime/collections/referenced_grid128/new
#
# Create a new 128x128 grid
#> Scores
#  @base_value (in): the grid base value
#> Storage
#  @grid_ref (in): the grid reference
#> Return void

# Create the grid
function mineweather:weather_runtime/collections/referenced_grid128/new/new with storage io:

# Fill with base value
scoreboard players operation ::in value = ::in base_value
function mineweather:weather_runtime/collections/referenced_grid128/fill
