#
# mineweather:weather_runtime/core/global_climate_system/common/calc_grid_gradient_inside_loop
#

scoreboard players operation ::in x = ::mineweather::weather_runtime::core::global_climate_system x
scoreboard players operation ::in y = ::mineweather::weather_runtime::core::global_climate_system y
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/grid_utils/calc_gradient_at
