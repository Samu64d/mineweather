#
# mineweather:weather_runtime/core/global_climate_system/update_pressure/y_loop
#

scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION

# Get irradiance from grid cell
data modify storage io: param_name set value "irradiance"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_irradiance run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Get temperature from grid cell
data modify storage io: param_name set value "temperature"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_temperature run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Get old temperature from grid cell
data modify storage io: param_name set value "old_temperature"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_old_temperature run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Get pressure from grid cell
data modify storage io: param_name set value "pressure"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_pressure run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Get moisture from grid cell
data modify storage io: param_name set value "moisture"
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_moisture run function mineweather:weather_runtime/core/global_climate_system/common/get_grid_param_inside_loop

# Add irradiance contribue
scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_irradiance
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_0.031
execute store result score ::in value0 run function math:mulf
scoreboard players operation ::in value0 += ::mineweather::weather_runtime::core::global_climate_system::const FXP_BASE_PRESSURE
scoreboard players operation ::in value0 -= ::mineweather::weather_runtime::core::global_climate_system fxp_pressure
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_0.01
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_irradiance_contribute run function math:mulf
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_pressure += ::mineweather::weather_runtime::core::global_climate_system fxp_irradiance_contribute

# Check for low pressure areas

# Calculate temperature difference
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_temperature_difference = ::mineweather::weather_runtime::core::global_climate_system fxp_temperature
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_temperature_difference -= ::mineweather::weather_runtime::core::global_climate_system fxp_old_temperature
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_temperature_difference matches ..-1 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_temperature_difference *= ::const NEGONE
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_temperature matches 1.. if score ::mineweather::weather_runtime::core::global_climate_system fxp_old_temperature matches ..-1 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_temperature_difference *= ::mineweather::weather_runtime::const FXP_2
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_temperature matches ..-1 if score ::mineweather::weather_runtime::core::global_climate_system fxp_old_temperature matches 1.. run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_temperature_difference *= ::mineweather::weather_runtime::const FXP_2

# Calculate factor
scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_moisture
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::core::global_climate_system fxp_temperature_difference
execute store result score ::in value0 run function math:mulf
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_3
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_factor run function math:mulf
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_factor > ::mineweather::weather_runtime::const FXP_10 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_factor = ::mineweather::weather_runtime::const FXP_10

# Check for factor and pressure
scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_pressure
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_0.001
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_pressure_factor run function math:mulf
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_factor > ::mineweather::weather_runtime::core::global_climate_system fxp_pressure_factor run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_pressure -= ::mineweather::weather_runtime::core::global_climate_system fxp_factor
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_factor < ::mineweather::weather_runtime::core::global_climate_system fxp_pressure_factor run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_pressure += ::mineweather::weather_runtime::core::global_climate_system fxp_factor

# Clamp pressure
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_pressure > ::mineweather::weather_runtime::const FXP_1070 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_pressure = ::mineweather::weather_runtime::const FXP_1070
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_pressure < ::mineweather::weather_runtime::const FXP_880 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_pressure = ::mineweather::weather_runtime::const FXP_880

# Set pressure at grid cell
scoreboard players operation ::in value = ::mineweather::weather_runtime::core::global_climate_system fxp_pressure
data modify storage io: param_name set value "pressure"
function mineweather:weather_runtime/core/global_climate_system/common/set_grid_param_inside_loop

scoreboard players add ::mineweather::weather_runtime::core::global_climate_system y 1

execute if score ::mineweather::weather_runtime::core::global_climate_system y < ::mineweather::weather_runtime::core::global_climate_system height run function mineweather:weather_runtime/core/global_climate_system/update_pressure/y_loop

# Loop
