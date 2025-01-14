#
# mineweather:weather_runtime/collections/referenced_grid/fill
#
# Fill a grid with a value
#> Scores
#  @base_value (in): the grid base value
#> Storage
#  @grid_ref (in): the grid reference
#> Return void

execute store result storage mineweather:volatile weather_runtime.collections.referenced_grid.temp_value int 1.0 run scoreboard players get ::in value

# Calculate length
execute store result score ::mineweather::weather_runtime::collections::referenced_grid temp0 run function mineweather:weather_runtime/collections/referenced_grid/get_width
execute store result score ::mineweather::weather_runtime::collections::referenced_grid length run function mineweather:weather_runtime/collections/referenced_grid/get_height
scoreboard players operation ::mineweather::weather_runtime::collections::referenced_grid length *= ::mineweather::weather_runtime::collections::referenced_grid temp0

# Start loop
function mineweather:weather_runtime/collections/referenced_grid/fill/loop with storage io:
