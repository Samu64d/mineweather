#
# mineweather:weather_runtime/core/engine/new
#
# Create a new engine instance
#> Scores
#  @simulation_x_resolution (in): the width of cells to simulate
#  @simulation_y_resolution (in): the height of cells to simulate
#> Storage
#  @engine_ref (in): the engine reference
#> Return void

# Create the object
function mineweather:weather_runtime/core/engine/new/new with storage io:

# Create the global climate system
scoreboard players operation ::in x_size = ::in simulation_x_resolution
scoreboard players operation ::in y_size = ::in simulation_y_resolution
function mineweather:weather_runtime/core/engine/common/get_global_climate_system_reference with storage io:
function mineweather:weather_runtime/core/global_climate_system/new
