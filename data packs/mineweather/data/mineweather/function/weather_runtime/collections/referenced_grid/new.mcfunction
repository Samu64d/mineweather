#
# mineweather:weather_runtime/collections/referenced_grid/new
#
# Create a new grid
#> Scores
#  @width (in): the grid width
#  @height (in): the grid height
#  @base_value (in): the grid base value
#> Storage
#  @grid_ref (in): the grid reference
#> Return void

# Create the grid
function mineweather:weather_runtime/collections/referenced_grid/new/new with storage io:

# Fill with base value
scoreboard players operation ::in value = ::in base_value
function mineweather:weather_runtime/collections/referenced_grid/fill
