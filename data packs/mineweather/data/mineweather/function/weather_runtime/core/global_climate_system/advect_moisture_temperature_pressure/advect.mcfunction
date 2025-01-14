#
# mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/advect
#

# Calculate factors

# X
scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_0.1
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_i run function math:mulf
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_i > ::mineweather::weather_runtime::const FXP_32 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_i = ::mineweather::weather_runtime::const FXP_32
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_i < ::mineweather::weather_runtime::const FXP_-32 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_i = ::mineweather::weather_runtime::const FXP_-32
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_x = ::mineweather::weather_runtime::core::global_climate_system x
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_x *= ::mineweather::weather_runtime::const FPX_MAG
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_i -= ::mineweather::weather_runtime::core::global_climate_system fxp_x
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_i *= ::const NEGONE
scoreboard players operation ::in value = ::mineweather::weather_runtime::core::global_climate_system fxp_i
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_i0 run function math:floorf
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_i1 = ::mineweather::weather_runtime::core::global_climate_system fxp_i0
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_i1 += ::mineweather::weather_runtime::const FXP_1

# Y
scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_wind_y_speed
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_0.1
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_j run function math:mulf
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_j > ::mineweather::weather_runtime::const FXP_32 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_j = ::mineweather::weather_runtime::const FXP_32
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_j < ::mineweather::weather_runtime::const FXP_-32 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_j = ::mineweather::weather_runtime::const FXP_-32
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_y = ::mineweather::weather_runtime::core::global_climate_system y
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_y *= ::mineweather::weather_runtime::const FPX_MAG
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_j -= ::mineweather::weather_runtime::core::global_climate_system fxp_y
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_j *= ::const NEGONE
scoreboard players operation ::in value = ::mineweather::weather_runtime::core::global_climate_system fxp_j
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_j0 run function math:floorf
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_j1 = ::mineweather::weather_runtime::core::global_climate_system fxp_j0
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_j1 += ::mineweather::weather_runtime::const FXP_1

# Calculate interpolant factors

# X
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_s1 = ::mineweather::weather_runtime::core::global_climate_system fxp_i
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_s1 -= ::mineweather::weather_runtime::core::global_climate_system fxp_i0
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_s0 = ::mineweather::weather_runtime::const FXP_1
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_s0 -= ::mineweather::weather_runtime::core::global_climate_system fxp_s1

# Y
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_t1 = ::mineweather::weather_runtime::core::global_climate_system fxp_j
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_t1 -= ::mineweather::weather_runtime::core::global_climate_system fxp_j0
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_t0 = ::mineweather::weather_runtime::const FXP_1
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_t0 -= ::mineweather::weather_runtime::core::global_climate_system fxp_t1

# Advect parameters

# Moisture
data modify storage io: param_name set value "moisture"
function mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/advect_param

# Temperature
data modify storage io: param_name set value "temperature"
function mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/advect_param

# Pressure
data modify storage io: param_name set value "pressure"
function mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/advect_param
