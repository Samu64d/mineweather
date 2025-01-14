#
# mineweather:objs/obj.lightning_bolt_path/gen_direction_config
#

# Retrive direction related angle values
execute if score @s mineweather_objs_obj.lightning_bolt_path_direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions DOWNWARD run function mineweather:objs/obj.lightning_bolt_path/directions/downward
execute if score @s mineweather_objs_obj.lightning_bolt_path_direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions OBLIQUE_DOWN run function mineweather:objs/obj.lightning_bolt_path/directions/oblique_down
execute if score @s mineweather_objs_obj.lightning_bolt_path_direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions HORIZONTAL run function mineweather:objs/obj.lightning_bolt_path/directions/horizontal
execute if score @s mineweather_objs_obj.lightning_bolt_path_direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions OBLIQUE_UP run function mineweather:objs/obj.lightning_bolt_path/directions/oblique_up
execute if score @s mineweather_objs_obj.lightning_bolt_path_direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions UPWARD run function mineweather:objs/obj.lightning_bolt_path/directions/upward

# Rotation angles

# X
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 = @s mineweather_objs_obj.lightning_bolt_path_jagged_index
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 *= ::int 50
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_min = ::out node_r_x_min
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_min += ::mineweather::objs::obj.lightning_bolt_path temp0
execute if score @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_min >= ::math::const FXP_1_PI_2_DEG run scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_min = ::math::const FXP_1_PI_2_DEG
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_max = ::out node_r_x_max
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_max += ::mineweather::objs::obj.lightning_bolt_path temp0
execute if score @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_max >= ::math::const FXP_1_PI_2_DEG run scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_max = ::math::const FXP_1_PI_2_DEG

# Z
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_z_min = ::out node_r_z_min
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_z_max = ::out node_r_z_max

# Directional angles

# X
scoreboard players operation ::in min = ::out node_r_x_i_min
scoreboard players operation ::in max = ::out node_r_x_i_max
execute store result score @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_i run function random:rand

# Z
scoreboard players operation ::in min = ::out node_r_z_i_min
scoreboard players operation ::in max = ::out node_r_z_i_max
execute store result score @s fxp_mineweather_objs_obj.lightning_bolt_path_node_r_z_i run function random:rand
