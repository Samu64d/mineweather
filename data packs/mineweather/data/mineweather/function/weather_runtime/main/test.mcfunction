#
# mineweather:weather_runtime/main/test
#

scoreboard players set ::in simulation_x_resolution 128
scoreboard players set ::in simulation_y_resolution 128
data modify storage io: engine_ref set value "storage io: engine"
function mineweather:weather_runtime/core/engine/new

function mineweather:weather_runtime/core/engine/init
