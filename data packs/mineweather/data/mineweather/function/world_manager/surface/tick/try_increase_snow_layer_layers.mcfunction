#
# mineweather:world_manager/surface/tick/try_increase_snow_layer_layers
#

# Randomize result
scoreboard players set ::in min 0
scoreboard players set ::in max 400
execute store result score ::mineweather::world_manager temp0 run function random:rand

# Get snow layer layers
data modify storage io: property set value "layers"
execute store result score ::in property_value run function minecraft_world_api:block/blockstates/get_blockstate_property_at_pos_as_integer

# Increase layers
execute unless score ::in property_value matches 8.. run scoreboard players add ::in property_value 1

# Set snow layer layers
function minecraft_world_api:block/blockstates/set_blockstate_property_at_pos_as_integer
