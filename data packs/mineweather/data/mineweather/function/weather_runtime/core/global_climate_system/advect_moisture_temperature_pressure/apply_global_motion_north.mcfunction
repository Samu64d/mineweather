#
# mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/add_global_motion_north
#

scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system global_motion = ::mineweather::weather_runtime::core::global_climate_system half_height
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system global_motion -= ::mineweather::weather_runtime::core::global_climate_system y
execute if score ::mineweather::weather_runtime::core::global_climate_system global_motion matches ..29 run scoreboard players set ::mineweather::weather_runtime::core::global_climate_system global_motion 30
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system global_motion *= ::mineweather::weather_runtime::const FPX_MAG
scoreboard players operation ::mineweather::weather_runtime::core::global_climate_system fxp_wind_x_speed += ::mineweather::weather_runtime::core::global_climate_system global_motion
