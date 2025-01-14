#
# mineweather:world_manager/chunk/tick
#

# Get chunk descriptor
data modify storage io: chunk_descriptor set from storage io: data.chunk

# Tick random surface

# Get chunk dimension
function world_handler:chunk_descriptor/get_dimension

# Get chunk pos
function world_handler:chunk_descriptor/get_chunk_pos

# Get chunk center block position
function minecraft_world_api:chunk/pos/get_center_block_pos_from_chunk_pos

# Save chunk center block position
data modify storage mineweather:volatile world_manager.chunk_center_block_pos set from storage io: block_pos

# Start random surfaces search
scoreboard players set ::mineweather::world_manager ticked_surface_count 0
execute if score ::mineweather::const TICKED_SUFACES_PER_CHUNK matches 1.. run function mineweather:world_manager/chunk/tick/tick_surface_loop
