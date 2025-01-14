#
# mineweather:objs/obj.lightning_bolt_path/start_generation
#
# Start the generation of a lightning bolt path
#> Context
#  @executor (in): the lightning bolt path
#> Return void

# Set decay time
execute store result score @s mineweather_objs_obj.lightning_bolt_path_decay_time run function time:mc_time/get_game_time
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_decay_time += @s mineweather_objs_obj.lightning_bolt_path_duration

# Get object position
data modify storage io: method set value "get_position"
function obj:invoke

# Set first node position
data modify storage io: vector set from storage io: position
function nmath:vector3f/to_fixed_point_values
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_x = ::out x
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_y = ::out y
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_z = ::out z

# Calculate the max node count
function mineweather:objs/obj.lightning_bolt_path/calc_max_node_count

# Start generation
function mineweather:objs/obj.lightning_bolt_path/gen/next
