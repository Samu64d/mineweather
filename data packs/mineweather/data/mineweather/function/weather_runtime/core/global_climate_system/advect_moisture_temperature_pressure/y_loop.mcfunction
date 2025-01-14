#
# mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/y_loop
#

scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION

# Get wind speed x from grid cell
data modify storage io: param_name set value "wind_x_speed"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Get wind speed y from grid cell
data modify storage io: param_name set value "wind_y_speed"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Apply global motion
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system half_height = ::mineweather::weather_runtime::core::global_climate_system height
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system half_height /= ::int 2
execute if score ::mineweather::weather_runtime::core::global_climate_system y < ::mineweather::weather_runtime::core::global_climate_system half_height run function mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/apply_global_motion_north
execute if score ::mineweather::weather_runtime::core::global_climate_system y >= ::mineweather::weather_runtime::core::global_climate_system half_height run function mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/apply_global_motion_south

# Check for wind speed
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system advect = ::const TRUE
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed matches 0 if score ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed matches 0 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system advect = ::const FALSE
execute if score ::mineweather::weather_runtime::core::global_climate_system advect = ::const TRUE run function mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/advect

scoreboard players add ::mineweather::weather_runtime::core::global_climate_system y 1

execute if score ::mineweather::weather_runtime::core::global_climate_system y < ::mineweather::weather_runtime::core::global_climate_system height run function mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/y_loop

# Loop
