#
# mineweather:client/visual_handler/on_check_success
#

# Update block position
scoreboard players operation ::in y = ::mineweather::client temp1
scoreboard players operation ::in y += ::mineweather::client precipitations_loop_y_incr
function minecraft_world_api:block_pos/set_y

# Show particles
execute store result storage io: x int 1.0 run data get storage io: block_pos.x 1.0
execute store result storage io: y int 1.0 run data get storage io: block_pos.y 1.0
execute store result storage io: z int 1.0 run data get storage io: block_pos.z 1.0
function mineweather:client/visual_handler/show_particles with storage io:
