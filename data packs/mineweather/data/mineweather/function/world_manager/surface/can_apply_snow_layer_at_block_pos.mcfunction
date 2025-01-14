#
# mineweather:world_manager/surface/can_apply_snow_layer_at_block_pos
#
# Check if it's possible to apply a snow layer on a block position
#> Storage
#  @dimension (in): the dimension
#  @block_pos (in): the block position
#> Return void

# Get surface block position
function minecraft_world_api:block_pos/down

# Get block name
function minecraft_world_api:block/api/get_block_name_at_pos

# Check if block is solid
execute store result score ::mineweather::world_manager is_solid run function minecraft_world_api:block/api/is_solid

# Check if block is snow layer
data modify storage io: name set value "minecraft:snow"
execute store result score ::mineweather::world_manager is_snow_layer run function minecraft_world_api:block/api/is_at_pos

# Check conditions
execute unless score ::mineweather::world_manager is_solid = ::const TRUE unless score ::mineweather::world_manager is_snow_layer = ::const TRUE run return run scoreboard players get ::const FALSE

# Check if the maximum snow depth was reached
execute if score ::mineweather::const MAX_SNOW_DEPTH matches 0.. run return run function mineweather:world_manager/surface/can_apply_snow_layer_at_block_pos/check_snow_depth

# Return data
return run scoreboard players get ::const TRUE
