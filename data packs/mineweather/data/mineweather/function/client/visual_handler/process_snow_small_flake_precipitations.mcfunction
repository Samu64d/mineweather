#
# mineweather:client/visual_handler/process_snow_small_precipitations
#

scoreboard players operation ::mineweather::client precipitations_loop_count /= ::int 10
execute if score ::mineweather::client precipitations_loop_count matches 0 if function random:randbool run scoreboard players set ::mineweather::client precipitations_loop_count 1
execute if score ::mineweather::client precipitations_loop_count matches 64.. run scoreboard players set ::mineweather::client precipitations_loop_count 64

# Calculate particle count
execute if score ::mineweather::const REDUCE_PARTICLES = ::const FALSE run execute store result storage io: count int 1.0 run data get storage io: point_weather_data_descriptor.precipitations_snow 1.0
execute if score ::mineweather::const REDUCE_PARTICLES = ::const TRUE run execute store result storage io: count int 1.0 run data get storage io: point_weather_data_descriptor.precipitations_snow 0.5

# Run loop
scoreboard players set ::mineweather::client precipitations_count 0
scoreboard players set ::mineweather::client precipitations_loop_y_incr 1
data modify storage io: particle set value "minecraft:falling_dust{block_state:'minecraft:snow'}"
data modify storage io: particle_area_height set value 0.64f
execute if score ::mineweather::client precipitations_loop_count matches 1.. run function mineweather:client/visual_handler/precipitations_loop

# Save count
scoreboard players operation ::mineweather::client snow_count = ::mineweather::client precipitations_count
