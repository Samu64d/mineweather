#
# mineweather:weather_runtime/core/global_climate_system/update_wind_speed
#
# Update the wind speed of a global climate system
#> Storage
#  @global_climate_system_ref (in): the global climate system reference
#> Return void

# Get size
execute store result score ::mineweather::weather_runtime::core::global_climate_system width run function mineweather:weather_runtime/core/global_climate_system/get_x_size
execute store result score ::mineweather::weather_runtime::core::global_climate_system height run function mineweather:weather_runtime/core/global_climate_system/get_y_size

# Start loop
scoreboard players set ::mineweather::weather_runtime::core::global_climate_system x 0
function mineweather:weather_runtime/core/global_climate_system/update_wind_speed/x_loop
