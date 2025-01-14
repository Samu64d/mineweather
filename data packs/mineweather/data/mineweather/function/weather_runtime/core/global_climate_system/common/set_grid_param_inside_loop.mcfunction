#
# mineweather:weather_runtime/core/global_climate_system/common/set_grid_param_inside_loop
#

scoreboard players operation ::in x = ::mineweather::weather_runtime::core::global_climate_system x
scoreboard players operation ::in y = ::mineweather::weather_runtime::core::global_climate_system y
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/collections/referenced_grid/set_index_at
