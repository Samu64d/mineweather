#
# mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure
#
# Advect moisture, temperature and pressure of a global climate system
#> Storage
#  @global_climate_system_ref (in): the global climate system reference
#> Return void

# Get size
execute store result score ::mineweather::weather_runtime::core::global_climate_system width run function mineweather:weather_runtime/core/global_climate_system/get_x_size
execute store result score ::mineweather::weather_runtime::core::global_climate_system height run function mineweather:weather_runtime/core/global_climate_system/get_y_size

# Copy parameters grids

# Moisture
data modify storage io: param_name set value "moisture"
function mineweather:weather_runtime/core/global_climate_system/common/copy_grid with storage io:

# Temperature
data modify storage io: param_name set value "temperature"
function mineweather:weather_runtime/core/global_climate_system/common/copy_grid with storage io:

# Pressure
data modify storage io: param_name set value "pressure"
function mineweather:weather_runtime/core/global_climate_system/common/copy_grid with storage io:

# Start loop
scoreboard players set ::mineweather::weather_runtime::core::global_climate_system x 0
function mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/x_loop
