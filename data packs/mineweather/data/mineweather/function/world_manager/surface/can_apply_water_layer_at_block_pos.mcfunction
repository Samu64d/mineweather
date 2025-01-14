#
# mineweather:world_manager/surface/can_apply_water_layer_at_block_pos
#
# Check if it's possible to apply a water layer on a block position
#> Storage
#  @dimension (in): the dimension
#  @block_pos (in): the block position
#> Return void

# Get surface block position
function minecraft_world_api:block_pos/down

# Get block name
function minecraft_world_api:block/api/get_block_name_at_pos

# Return data
return run function minecraft_world_api:block/api/is_solid
