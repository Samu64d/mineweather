#
# mineweather:client/boot/bootmgr
#

# Get player block position
function minecraft_entity_api:entity/get_block_pos

# Set player last block position
execute store result score @s mineweather_client_last_block_pos_x run function minecraft_world_api:block_pos/get_x
execute store result score @s mineweather_client_last_block_pos_y run function minecraft_world_api:block_pos/get_y
execute store result score @s mineweather_client_last_block_pos_z run function minecraft_world_api:block_pos/get_z
