#
# mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop
#

scoreboard players operation ::in x = ::mineweather::weather_runtime::core::global_climate_system x
scoreboard players operation ::in y = ::mineweather::weather_runtime::core::global_climate_system y
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
return run function mineweather:weather_runtime/collections/referenced_grid/get_index_at
