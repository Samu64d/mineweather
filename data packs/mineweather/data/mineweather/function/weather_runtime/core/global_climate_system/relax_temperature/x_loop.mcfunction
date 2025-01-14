#
# mineweather:weather_runtime/core/global_climate_system/relax_temperature/x_loop
#

scoreboard players set ::mineweather::weather_runtime::core::global_climate_system y 0
function mineweather:weather_runtime/core/global_climate_system/relax_temperature/y_loop

scoreboard players add ::mineweather::weather_runtime::core::global_climate_system x 1

execute if score ::mineweather::weather_runtime::core::global_climate_system x < ::mineweather::weather_runtime::core::global_climate_system width run function mineweather:weather_runtime/core/global_climate_system/relax_temperature/x_loop

# Loop
