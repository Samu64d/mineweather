#
# mineweather:weather_runtime/core/global_climate_system/update_wind_speed/y_loop
#

scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION

# Calculate pressure gradient at grid cell
data modify storage io: param_name set value "pressure"
function mineweather:weather_runtime/core/global_climate_system/common/calc_grid_gradient_inside_loop

# Get wind speed x from grid cell
data modify storage io: param_name set value "wind_x_speed"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Get wind speed y from grid cell
data modify storage io: param_name set value "wind_y_speed"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Calculate new components

# X
scoreboard players operation ::in value0 = ::out fxp_y_gradient
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_3
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_y_gradient_contribute run function math:mulf
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed -= ::mineweather::weather_runtime::core::global_climate_system fxp_y_gradient_contribute

# Y
scoreboard players operation ::in value0 = ::out fxp_x_gradient
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_3
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_x_gradient_contribute run function math:mulf
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed += ::mineweather::weather_runtime::core::global_climate_system fxp_x_gradient_contribute

# Apply friction

# X
scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_0.1
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed_friction run function math:mulf
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed -= ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed_friction

# Y
scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_0.1
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed_friction run function math:mulf
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed -= ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed_friction

# Set wind speed x grid cell
scoreboard players operation ::in value = ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed
data modify storage io: param_name set value "wind_x_speed"
function mineweather:weather_runtime/core/global_climate_system/common/set_grid_param_inside_loop

# Set wind speed y at grid cell
scoreboard players operation ::in value = ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed
data modify storage io: param_name set value "wind_y_speed"
function mineweather:weather_runtime/core/global_climate_system/common/set_grid_param_inside_loop

scoreboard players add ::mineweather::weather_runtime::core::global_climate_system y 1

execute if score ::mineweather::weather_runtime::core::global_climate_system y < ::mineweather::weather_runtime::core::global_climate_system height run function mineweather:weather_runtime/core/global_climate_system/update_wind_speed/y_loop

# Loop
