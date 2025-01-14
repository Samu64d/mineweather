#
# mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/advect_param
#

# Get parameter from old grid cell
scoreboard players operation ::in x = ::mineweather::weather_runtime::core::global_climate_system fxp_i0
scoreboard players operation ::in x /= ::mineweather::weather_runtime::const FPX_MAG
scoreboard players operation ::in y = ::mineweather::weather_runtime::core::global_climate_system fxp_j0
scoreboard players operation ::in y /= ::mineweather::weather_runtime::const FPX_MAG
function mineweather:weather_runtime/core/global_climate_system/common/get_old_grid_reference with storage io:
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_param1 run function mineweather:weather_runtime/collections/referenced_grid/get_index_at

# Get parameter from old grid cell
scoreboard players operation ::in x = ::mineweather::weather_runtime::core::global_climate_system fxp_i0
scoreboard players operation ::in x /= ::mineweather::weather_runtime::const FPX_MAG
scoreboard players operation ::in y = ::mineweather::weather_runtime::core::global_climate_system fxp_j1
scoreboard players operation ::in y /= ::mineweather::weather_runtime::const FPX_MAG
function mineweather:weather_runtime/core/global_climate_system/common/get_old_grid_reference with storage io:
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_param2 run function mineweather:weather_runtime/collections/referenced_grid/get_index_at

# Get parameter from old grid cell
scoreboard players operation ::in x = ::mineweather::weather_runtime::core::global_climate_system fxp_i1
scoreboard players operation ::in x /= ::mineweather::weather_runtime::const FPX_MAG
scoreboard players operation ::in y = ::mineweather::weather_runtime::core::global_climate_system fxp_j0
scoreboard players operation ::in y /= ::mineweather::weather_runtime::const FPX_MAG
function mineweather:weather_runtime/core/global_climate_system/common/get_old_grid_reference with storage io:
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_param3 run function mineweather:weather_runtime/collections/referenced_grid/get_index_at

# Get parameter from old grid cell
scoreboard players operation ::in x = ::mineweather::weather_runtime::core::global_climate_system fxp_i1
scoreboard players operation ::in x /= ::mineweather::weather_runtime::const FPX_MAG
scoreboard players operation ::in y = ::mineweather::weather_runtime::core::global_climate_system fxp_j1
scoreboard players operation ::in y /= ::mineweather::weather_runtime::const FPX_MAG
function mineweather:weather_runtime/core/global_climate_system/common/get_old_grid_reference with storage io:
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_param4 run function mineweather:weather_runtime/collections/referenced_grid/get_index_at

# Calculate result parameter
scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_t0
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::core::global_climate_system fxp_param1
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_param1_contribute run function math:mulf
scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_t1
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::core::global_climate_system fxp_param2
execute store result score ::in value0 run function math:mulf
scoreboard players operation ::in value0 += ::mineweather::weather_runtime::core::global_climate_system fxp_param1_contribute
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::core::global_climate_system fxp_s0
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_advected_param run function math:mulf

scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_t0
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::core::global_climate_system fxp_param3
execute store result score ::mineweather::weather_runtime::core::global_climate_system fxp_param3_contribute run function math:mulf
scoreboard players operation ::in value0 = ::mineweather::weather_runtime::core::global_climate_system fxp_t1
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::core::global_climate_system fxp_param4
execute store result score ::in value0 run function math:mulf
scoreboard players operation ::in value0 += ::mineweather::weather_runtime::core::global_climate_system fxp_param3_contribute
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::core::global_climate_system fxp_s1
execute store result score ::in value run function math:mulf
scoreboard players operation ::in value += ::mineweather::weather_runtime::core::global_climate_system fxp_advected_param

# Set parameter at grid cell
function mineweather:weather_runtime/core/global_climate_system/common/set_grid_param_inside_loop
