#
# mineweather:weather_runtime/core/engine/init
#
# Initialize an engine
#> Storage
#  @engine_ref (in): the engine reference
#> Return void

# Initialize time
function mineweather:weather_runtime/core/engine/init/init_time with storage io:

# Initiliaze the global climate system
function mineweather:weather_runtime/core/engine/common/get_global_climate_system_reference with storage io:
function mineweather:weather_runtime/core/global_climate_system/init
