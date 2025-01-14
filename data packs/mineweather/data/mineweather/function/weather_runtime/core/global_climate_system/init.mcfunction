#
# mineweather:weather_runtime/core/global_climate_system/init
#
# Initialize a global climate system
#> Storage
#  @global_climate_system_ref (in): the global climate system reference
#> Return void

# Get size
execute store result score ::in width run function mineweather:weather_runtime/core/global_climate_system/get_x_size
execute store result score ::in height run function mineweather:weather_runtime/core/global_climate_system/get_y_size

# Initialize grids

# Irradiance
scoreboard players operation ::in base_value = ::mineweather::weather_runtime::const FXP_100
data modify storage io: param_name set value "irradiance"
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/collections/referenced_grid/new

# Moisture
scoreboard players operation ::in base_value = ::mineweather::weather_runtime::const FXP_1
data modify storage io: param_name set value "moisture"
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/collections/referenced_grid/new

# Old temperature
scoreboard players operation ::in base_value = ::mineweather::weather_runtime::const FXP_15
data modify storage io: param_name set value "old_temperature"
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/collections/referenced_grid/new

# Temperature
scoreboard players operation ::in base_value = ::mineweather::weather_runtime::const FXP_15
data modify storage io: param_name set value "temperature"
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/collections/referenced_grid/new

# Pressure
scoreboard players operation ::in base_value = ::mineweather::weather_runtime::const FXP_1025
data modify storage io: param_name set value "pressure"
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/collections/referenced_grid/new

# Wind speed
scoreboard players set ::in base_value 0
data modify storage io: param_name set value "wind_speed"
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/collections/referenced_grid/new

# Wind speed x
scoreboard players set ::in base_value 0
data modify storage io: param_name set value "wind_x_speed"
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/collections/referenced_grid/new

# Wind speed y
scoreboard players set ::in base_value 0
data modify storage io: param_name set value "wind_y_speed"
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/collections/referenced_grid/new

# Geopotential
scoreboard players set ::in base_value 565000
data modify storage io: param_name set value "geopotential"
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/collections/referenced_grid/new

# Precipitations
scoreboard players set ::in base_value 0
data modify storage io: param_name set value "precipitations"
function mineweather:weather_runtime/core/global_climate_system/common/get_grid_reference with storage io:
function mineweather:weather_runtime/collections/referenced_grid/new
