#
# mineweather:objs/obj.lightning_bolt_path/gen/next
#

# Update node count
scoreboard players add @s mineweather_objs_obj.lightning_bolt_path_node_count 1

# Change direction
scoreboard players set ::in min 0
scoreboard players set ::in max 16000
scoreboard players operation ::in max /= @s mineweather_objs_obj.lightning_bolt_path_node_count
scoreboard players operation ::in max += @s mineweather_objs_obj.lightning_bolt_path_max_node_count
execute if score @s mineweather_objs_obj.lightning_bolt_path_depth matches 1.. run scoreboard players operation ::in max /= ::int 10
execute if score @s mineweather_objs_obj.lightning_bolt_path_direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions HORIZONTAL run scoreboard players operation ::in max /= ::int 5
execute unless function random:rand run function mineweather:objs/obj.lightning_bolt_path/change_direction

# Calculate node length
scoreboard players operation ::in min = @s fxp_mineweather_objs_obj.lightning_bolt_path_node_length_min
scoreboard players operation ::in max = @s fxp_mineweather_objs_obj.lightning_bolt_path_node_length_max
execute store result score ::in fxp_length run function random:rand

# Calculate node rotation

# X
scoreboard players operation ::in min = @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_min
scoreboard players operation ::in max = @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_max
execute store result score ::in r_x run function random:rand
scoreboard players operation ::in r_x += @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_i
scoreboard players operation ::in r_x %= ::math::const FXP_PI_DEG

# Z
scoreboard players operation ::in min = @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_z_min
scoreboard players operation ::in max = @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_z_max
execute store result score ::in r_z run function random:rand
scoreboard players operation ::in r_z += @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_z_i
scoreboard players operation ::in r_z %= ::math::const FXP_2_PI_DEG

# Calculate node vector contribution
scoreboard players operation ::in r = ::in fxp_length
function nmath:sph2cart

# Update the path vector

# X
scoreboard players operation ::in fxp_x = @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_x
scoreboard players operation ::in value0 = ::out x
scoreboard players operation ::in value1 = ::math::const FXP_DEF_MAG
scoreboard players operation ::in value1 /= ::int 2
execute store result score ::mineweather::objs::obj.lightning_bolt_path temp0 run function math:mul
scoreboard players operation ::in fxp_x -= ::mineweather::objs::obj.lightning_bolt_path temp0
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_x -= ::out x

# Y
scoreboard players operation ::in fxp_y = @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_y
scoreboard players operation ::in value0 = ::out z
scoreboard players operation ::in value1 = ::math::const FXP_DEF_MAG
scoreboard players operation ::in value1 /= ::int 2
execute store result score ::mineweather::objs::obj.lightning_bolt_path temp0 run function math:mul
scoreboard players operation ::in fxp_y -= ::mineweather::objs::obj.lightning_bolt_path temp0
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_y -= ::out z

# Z
scoreboard players operation ::in fxp_z = @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_z
scoreboard players operation ::in value0 = ::out y
scoreboard players operation ::in value1 = ::math::const FXP_DEF_MAG
scoreboard players operation ::in value1 /= ::int 2
execute store result score ::mineweather::objs::obj.lightning_bolt_path temp0 run function math:mul
scoreboard players operation ::in fxp_z -= ::mineweather::objs::obj.lightning_bolt_path temp0
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_z -= ::out y

# Generate the node

# For the bead effect
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 = ::const TRUE
scoreboard players operation ::in value = @s mineweather_objs_obj.lightning_bolt_path_node_count
execute if score @s mineweather_objs_obj.lightning_bolt_path_is_beaded = ::const TRUE unless function math:is_eveni run scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 = ::const FALSE

# Generate the node model
scoreboard players operation ::in fxp_r_x = ::in r_z
scoreboard players operation ::in fxp_r_x -= ::math::const FXP_1_PI_2_DEG
scoreboard players operation ::in fxp_r_z = ::in r_x
execute if score ::in fxp_r_z > ::math::const FXP_1_PI_2_DEG run function mineweather:objs/obj.lightning_bolt_path/gen/next/adjust_angle
scoreboard players operation ::in fxp_size = @s fxp_mineweather_objs_obj.lightning_bolt_path_size
execute if score ::mineweather::objs::obj.lightning_bolt_path temp0 = ::const TRUE run function mineweather:objs/obj.lightning_bolt_path/node/generate

# Detect impact
function mineweather:objs/obj.lightning_bolt_path/detect_impact

# Update the channel size
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 = @s mineweather_objs_obj.lightning_bolt_path_depth
scoreboard players add ::mineweather::objs::obj.lightning_bolt_path temp0 1
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 *= @s mineweather_objs_obj.lightning_bolt_path_node_count
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 /= @s mineweather_objs_obj.lightning_bolt_path_intensity
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_size -= ::mineweather::objs::obj.lightning_bolt_path temp0
execute if score @s fxp_mineweather_objs_obj.lightning_bolt_path_size matches ..0 run function mineweather:objs/obj.lightning_bolt_path/gen/stop

# Check for generate a fork
scoreboard players set ::in min 0
scoreboard players set ::in max 256
execute store result score ::mineweather::objs::obj.lightning_bolt_path temp0 run function random:rand
execute if score @s mineweather_objs_obj.lightning_bolt_path_depth matches 1.. run scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 *= @s mineweather_objs_obj.lightning_bolt_path_depth
execute if score @s mineweather_objs_obj.lightning_bolt_path_depth <= ::mineweather::objs::obj.lightning_bolt_path::const MAX_PATH_DEPTH if score @s mineweather_objs_obj.lightning_bolt_path_fork_count <= ::mineweather::objs::obj.lightning_bolt_path::const MAX_PATH_FORK_COUNT if score @s mineweather_objs_obj.lightning_bolt_path_fork_index > ::mineweather::objs::obj.lightning_bolt_path temp0 run function mineweather:objs/obj.lightning_bolt_path/gen/fork

# Check for stop generation for this tick
scoreboard players set ::in min 0
scoreboard players set ::in max 6400
scoreboard players operation ::in max /= @s fxp_mineweather_objs_obj.lightning_bolt_path_node_length_min
execute if score ::in max matches 0 run scoreboard players set ::in max 1
execute store result score ::mineweather::objs::obj.lightning_bolt_path temp0 run function random:rand

# Next node
execute unless score ::mineweather::objs::obj.lightning_bolt_path temp0 matches 0 if score @s mineweather_objs_obj.lightning_bolt_path_node_count < @s mineweather_objs_obj.lightning_bolt_path_max_node_count if score @s mineweather_objs_obj.lightning_bolt_path_stop_generation = ::const FALSE if score @s mineweather_objs_obj.lightning_bolt_path_impact = ::const FALSE run function mineweather:objs/obj.lightning_bolt_path/gen/next

# Loop
