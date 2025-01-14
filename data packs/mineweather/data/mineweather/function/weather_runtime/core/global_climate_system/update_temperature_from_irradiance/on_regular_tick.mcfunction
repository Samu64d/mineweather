#
# mineweather:weather_runtime/core/global_climate_system/update_temperature_from_irradiance/on_regular_tick
#

execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_temperature_difference > ::mineweather::weather_runtime::const FXP_2 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_temperature += ::mineweather::weather_runtime::const FXP_1
execute if score ::mineweather::weather_runtime::core::global_climate_system fxp_temperature_difference <= ::mineweather::weather_runtime::const FXP_2 run scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_temperature -= ::mineweather::weather_runtime::const FXP_1
