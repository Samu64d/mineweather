#
# mineweather:weather_runtime/collections/referenced_grid128/fill
#
# Fill a 128x128 grid with a value
#> Scores
#  @base_value (in): the grid base value
#> Storage
#  @grid_ref (in): the grid reference
#> Return void

execute store result storage mineweather:volatile weather_runtime.collections.referenced_grid128.temp_value int 1.0 run scoreboard players get ::in value

# Start loop
scoreboard players set ::mineweather::weather_runtime::collections::referenced_grid128 length 16384
function mineweather:weather_runtime/collections/referenced_grid128/fill/loop with storage io:
