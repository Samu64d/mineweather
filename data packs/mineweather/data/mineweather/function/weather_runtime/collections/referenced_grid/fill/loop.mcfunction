#
# mineweather:weather_runtime/collections/referenced_grid/fill/loop
#

# Append element
$data modify $(grid_ref).data append from storage mineweather:volatile weather_runtime.collections.referenced_grid.temp_value

scoreboard players remove ::mineweather::weather_runtime::collections::referenced_grid length 1
execute if score ::mineweather::weather_runtime::collections::referenced_grid length matches 1.. run function mineweather:weather_runtime/collections/referenced_grid/fill/loop with storage io:

# Loop
