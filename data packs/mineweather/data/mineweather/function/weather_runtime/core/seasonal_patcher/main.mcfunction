#
# mineweather:weather_runtime/core/time/main
#

scoreboard objectives add sys_time dummy
scoreboard objectives add engine_time dummy
scoreboard objectives add engine_time_init dummy

# Calculate system time
scoreboard players add ::engine sys_time 1

# Calculate engine time
scoreboard players operation ::engine engine_time = ::time tick
scoreboard players operation ::engine engine_time -= ::time engine_time_init
execute if score ::engine engine_time matches ..-1 run function mineweather:weather_runtime/panic/time_err

# Calculate seasonal index
function mineweather:weather_runtime/core/time/seasonal_index
