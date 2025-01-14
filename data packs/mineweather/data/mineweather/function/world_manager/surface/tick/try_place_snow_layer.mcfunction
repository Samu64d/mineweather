#
# mineweather:world_manager/surface/tick/try_place_snow_layer
#

# Get surface emissivity index of the surface block
#function minecraft_world_api:block/api/get_emissivity
#execute store result score ::mineweather::world_manager emissivity_index run data get storage io: emissivity

# Check for weather conditions
#function mineweather:weather_api/surface/calc_snow_accumulation_index

# Randomize result
scoreboard players set ::in min 0
scoreboard players set ::in max 400
execute store result score ::mineweather::world_manager temp0 run function random:rand

# Apply snow layer
data modify storage io: name set value "minecraft:snow"
function minecraft_world_api:block/api/set_block_at_pos
