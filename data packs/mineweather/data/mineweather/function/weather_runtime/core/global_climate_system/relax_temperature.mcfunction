#
# mineweather:weather_runtime/core/global_climate_system/relax_temperature
#
# Relax the temperature of a global climate system
#> Storage
#  @global_climate_system_ref (in): the global climate system reference
#> Return void

# Copy temperature grid
data modify storage io: param_name set value "temperature"
function mineweather:weather_runtime/core/global_climate_system/common/copy_grid with storage io:

# Get size
execute store result score ::mineweather::weather_runtime::core::global_climate_system width run function mineweather:weather_runtime/core/global_climate_system/get_x_size
execute store result score ::mineweather::weather_runtime::core::global_climate_system height run function mineweather:weather_runtime/core/global_climate_system/get_y_size

# Start loop
scoreboard players set ::mineweather::weather_runtime::core::global_climate_system x 0
function mineweather:weather_runtime/core/global_climate_system/relax_temperature/x_loop
