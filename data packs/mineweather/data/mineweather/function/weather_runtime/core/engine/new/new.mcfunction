#
# mineweather:weather_runtime/core/engine/new/new
#

# Create object
$data modify $(engine_ref) set value {simulation_x_resolution: 0, simulation_y_resolution: 0, time: -1, global_climate_system: {}}

# Set simulation x resolution
$execute store result $(engine_ref).simulation_x_resolution int 1.0 run scoreboard players get ::in simulation_x_resolution

# Set simulation y resolution
$execute store result $(engine_ref).simulation_y_resolution int 1.0 run scoreboard players get ::in simulation_y_resolution
