#
# mineweather:weather_runtime/core/engine/next_tick
#
# Tick an engine
#> Storage
#  @engine_ref (in): the engine reference
#> Return void

# Update time
function mineweather:weather_runtime/core/engine/next_tick/update_time with storage io:

# Get time
execute store result score ::in time run function mineweather:weather_runtime/core/engine/get_time

# Update the global climate system
function mineweather:weather_runtime/core/engine/common/get_global_climate_system_reference with storage io:
function mineweather:weather_runtime/core/global_climate_system/update
