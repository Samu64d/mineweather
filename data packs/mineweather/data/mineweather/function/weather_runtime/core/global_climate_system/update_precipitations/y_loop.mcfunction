#
# mineweather:weather_runtime/core/global_climate_system/update_precipitations/y_loop
#

scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION

# Get wind speed x from grid cell
data modify storage io: param_name set value "wind_x_speed"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Get wind speed y from grid cell
data modify storage io: param_name set value "wind_y_speed"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Set wind speed y at grid cell
scoreboard players operation ::in value = ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed
data modify storage io: param_name set value "wind_y_speed"
function mineweather:weather_runtime/core/global_climate_system/common/set_grid_param_inside_loop

scoreboard players add ::mineweather::weather_runtime::core::global_climate_system y 1

execute if score ::mineweather::weather_runtime::core::global_climate_system y < ::mineweather::weather_runtime::core::global_climate_system height run function mineweather:weather_runtime/core/global_climate_system/update_precipitations/y_loop

# Loop
