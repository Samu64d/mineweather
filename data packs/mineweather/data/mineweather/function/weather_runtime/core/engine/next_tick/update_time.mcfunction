#
# mineweather:weather_runtime/core/engine/next_tick/update_time
#

# Get time
$execute store result score ::mineweather::weather_runtime::core::engine temp0 run data get $(engine_ref).time 1.0

# Increase counter
scoreboard players add ::mineweather::weather_runtime::core::engine temp0 1

# Set time
$execute store result $(engine_ref).time int 1.0 run scoreboard players get ::mineweather::weather_runtime::core::engine temp0
