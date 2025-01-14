#
# mineweather:weather_runtime/core/global_climate_system/update_temperature_from_irradiance/y_loop
#

scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION

# Get irradiance from grid cell
data modify storage io: param_name set value "irradiance"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_irradiance run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Get temperature from grid cell
data modify storage io: param_name set value "temperature"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_temperature run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Calculate irradiance temperature
scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_irradiance
scoreboard players operation ::in value0 -= ::mineweather::weather_runtime::const FXP_100
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_1.3
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_irradiance_temperature run function math:mulf
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_irradiance_temperature += ::mineweather::weather_runtime::const FXP_5

# Calculate difference temperature
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_temperature_difference = ::mineweather::weather_runtime::core::global_climate_system fxp_irradiance_temperature
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_temperature_difference -= ::mineweather::weather_runtime::core::global_climate_system fxp_temperature

# Check for time
execute if score ::in time matches 1 run function mineweather:weather_runtime/core/global_climate_system/update_temperature_from_irradiance/on_first_tick
execute if score ::in time matches 2.. run function mineweather:weather_runtime/core/global_climate_system/update_temperature_from_irradiance/on_regular_tick

# Set temperature at grid cell
scoreboard players operation ::in value = ::mineweather::weather_runtime::core::global_climate_system fxp_temperature
data modify storage io: param_name set value "temperature"
function mineweather:weather_runtime/core/global_climate_system/common/set_grid_param_inside_loop

scoreboard players add ::mineweather::weather_runtime::core::global_climate_system y 1

execute if score ::mineweather::weather_runtime::core::global_climate_system y < ::mineweather::weather_runtime::core::global_climate_system height run function mineweather:weather_runtime/core/global_climate_system/update_temperature_from_irradiance/y_loop

# Loop
