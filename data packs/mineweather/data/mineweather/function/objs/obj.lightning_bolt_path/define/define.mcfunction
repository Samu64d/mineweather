#
# mineweather:objs/obj.lightning_bolt_path/define/define
#

# Declare module
#define score_holder ::mineweather::objs::obj.lightning_bolt_path
#define score_holder ::mineweather::objs::obj.lightning_bolt_path::const

# Define constants
scoreboard objectives add MAX_PATH_NODE_COUNT dummy
scoreboard objectives add MAX_PATH_FORK_COUNT dummy
scoreboard objectives add MAX_PATH_DEPTH dummy

# Max path length
scoreboard players set ::mineweather::objs::obj.lightning_bolt_path::const MAX_PATH_NODE_COUNT 1024

# Max path forks
scoreboard players set ::mineweather::objs::obj.lightning_bolt_path::const MAX_PATH_FORK_COUNT 256

# Max path depth
scoreboard players set ::mineweather::objs::obj.lightning_bolt_path::const MAX_PATH_DEPTH 8

# Define attributes
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_size dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_intensity dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_depth dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_duration dummy
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_node_length_min dummy
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_node_length_max dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_fork_index dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_jagged_index dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_is_beaded dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_direction dummy
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_min dummy
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_max dummy
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_node_r_z_min dummy
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_node_r_z_max dummy
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_node_r_x_i dummy
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_node_r_z_i dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_node_count dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_fork_count dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_stop_generation dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_impact dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_decay_time dummy
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_x dummy
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_y dummy
scoreboard objectives add fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_z dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_path_max_node_count dummy

# Define variables
scoreboard objectives add fxp_size dummy
scoreboard objectives add intensity dummy
scoreboard objectives add depth dummy
scoreboard objectives add duration dummy
scoreboard objectives add fxp_node_length_min dummy
scoreboard objectives add fxp_node_length_max dummy
scoreboard objectives add fork_index dummy
scoreboard objectives add jagged_index dummy
scoreboard objectives add is_beaded dummy
scoreboard objectives add direction dummy
scoreboard objectives add node_r_x_min dummy
scoreboard objectives add node_r_x_max dummy
scoreboard objectives add node_r_z_min dummy
scoreboard objectives add node_r_z_max dummy
scoreboard objectives add node_r_x_i_min dummy
scoreboard objectives add node_r_x_i_max dummy
scoreboard objectives add node_r_z_i_min dummy
scoreboard objectives add node_r_z_i_max dummy
scoreboard objectives add direction1 dummy
scoreboard objectives add direction2 dummy
scoreboard objectives add direction3 dummy
scoreboard objectives add fxp_length dummy
scoreboard objectives add fxp_r_x dummy
scoreboard objectives add fxp_r_z dummy
scoreboard objectives add fxp_x dummy
scoreboard objectives add fxp_y dummy
scoreboard objectives add fxp_z dummy

# Enumeration
function mineweather:objs/obj.lightning_bolt_path/define/enum_directions
