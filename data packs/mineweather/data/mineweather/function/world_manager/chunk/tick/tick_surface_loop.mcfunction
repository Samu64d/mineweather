#
# mineweather:world_manager/chunk/tick/tick_surface_loop
#

# Get chunk center block position
data modify storage io: block_pos set from storage mineweather:volatile world_manager.chunk_center_block_pos

# Generate random surface block position

# X
scoreboard players set ::in min -8
scoreboard players set ::in max 7
execute store result score ::in x run function random:rand
function minecraft_world_api:block_pos/add_x

# Z
scoreboard players set ::in min -8
scoreboard players set ::in max 7
execute store result score ::in z run function random:rand
function minecraft_world_api:block_pos/add_z

# Y
execute store result score ::in y run function minecraft_world_api:layout/heightmap/get_world_surface_level
function minecraft_world_api:block_pos/set_y
function minecraft_world_api:block_pos/up

# Tick surface
execute if function minecraft_world_api:block/api/is_air_at_pos run function mineweather:world_manager/surface/tick

scoreboard players add ::mineweather::world_manager ticked_surface_count 1
execute if score ::mineweather::world_manager ticked_surface_count < ::mineweather::const TICKED_SUFACES_PER_CHUNK run function mineweather:world_manager/chunk/tick/tick_surface_loop

# Loop
