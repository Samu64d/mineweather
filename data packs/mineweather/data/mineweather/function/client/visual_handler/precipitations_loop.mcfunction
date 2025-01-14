#
# mineweather:client/visual_handler/precipitations_loop
#

data modify storage io: block_pos set from storage mineweather:volatile client.particle_area_block_pos

# Select a random position around player

# X
scoreboard players set ::in min -10
scoreboard players set ::in max 10
execute store result score ::in x run function random:rand
function minecraft_world_api:block_pos/add_x

# Z
scoreboard players set ::in min -10
scoreboard players set ::in max 10
execute store result score ::in z run function random:rand
function minecraft_world_api:block_pos/add_z

# Calculate elevation

# Get player y position
execute store result score ::mineweather::client temp0 run function minecraft_world_api:block_pos/get_y
scoreboard players add ::mineweather::client temp0 3

# Get world surface level
execute store result score ::mineweather::client temp1 run function minecraft_world_api:layout/heightmap/get_world_surface_level
scoreboard players add ::mineweather::client temp1 3

# Calculate difference
scoreboard players operation ::mineweather::client temp2 = ::mineweather::client temp1
scoreboard players operation ::mineweather::client temp2 -= ::mineweather::client temp0

# Check for player abow ground
execute if score ::mineweather::client temp0 > ::mineweather::client temp1 run scoreboard players operation ::mineweather::client temp1 = ::mineweather::client temp0

# Check success
execute if score ::mineweather::client temp2 matches ..5 run function mineweather:client/visual_handler/on_check_success

# Update precipitation count
execute if score ::mineweather::client temp2 matches 1.. run scoreboard players operation ::mineweather::client temp2 *= ::const NEGONE
execute if score ::mineweather::client temp2 matches ..-11 run scoreboard players set ::mineweather::client temp2 -10
scoreboard players add ::mineweather::client temp2 10
scoreboard players operation ::mineweather::client precipitations_count += ::mineweather::client temp2


scoreboard players remove ::mineweather::client precipitations_loop_count 1
execute if score ::mineweather::client precipitations_loop_count matches 1.. run function mineweather:client/visual_handler/precipitations_loop

# Loop
