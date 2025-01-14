#
# mineweather:world_manager/surface/tick/try_place_water_layer
#

# Check for weather conditions
#function mineweather:weather_api/surface/calc_rain_accumulation_index

# Randomize result
scoreboard players set ::in min 0
scoreboard players set ::in max 400
execute store result score ::mineweather::world_manager temp0 run function random:rand

# Apply snow layer
data modify storage io: name set value "minecraft:water[level=7]"
function minecraft_world_api:block/api/set_block_at_pos
