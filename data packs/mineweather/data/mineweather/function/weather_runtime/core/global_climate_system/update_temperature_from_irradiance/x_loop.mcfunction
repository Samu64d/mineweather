#
# mineweather:weather_runtime/core/global_climate_system/update_temperature_from_irradiance/x_loop
#

scoreboard players set ::mineweather::weather_runtime::core::global_climate_system y 0
function mineweather:weather_runtime/core/global_climate_system/update_temperature_from_irradiance/y_loop

scoreboard players add ::mineweather::weather_runtime::core::global_climate_system x 1

execute if score ::mineweather::weather_runtime::core::global_climate_system x < ::mineweather::weather_runtime::core::global_climate_system width run function mineweather:weather_runtime/core/global_climate_system/update_temperature_from_irradiance/x_loop

# Loop
