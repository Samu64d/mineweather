#
# mineweather:objs/obj.lightning_bolt_builder/define/define
#

# Declare module
#define score_holder ::mineweather::objs::obj.lightning_bolt_builder
#define score_holder ::mineweather::objs::obj.lightning_bolt_builder::const

# Define constants
scoreboard objectives add STRIKE_DELAY dummy

scoreboard players set ::mineweather::objs::obj.lightning_bolt_builder::const STRIKE_DELAY 20

# Define attributes
scoreboard objectives add mineweather_objs_obj.lightning_bolt_type dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_deep dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_direction dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_size dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_duration dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_fork_index dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_jagged_index dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_bead_index dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_node_length_min dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_node_length_max dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_node_r_x_min dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_node_r_x_max dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_node_r_z_min dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_node_r_z_max dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_node_r_x_i dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_node_r_z_i dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_fork_count dummy
scoreboard objectives add mineweather_objs_obj.lightning_bolt_impact dummy

# Define variables
scoreboard objectives add type dummy
scoreboard objectives add deep dummy
scoreboard objectives add direction dummy
scoreboard objectives add size dummy
scoreboard objectives add duration dummy
scoreboard objectives add fork_index dummy
scoreboard objectives add jagged_index dummy
scoreboard objectives add bead_index dummy
scoreboard objectives add node_length_min dummy
scoreboard objectives add node_length_max dummy
scoreboard objectives add node_r_x_min dummy
scoreboard objectives add node_r_x_max dummy
scoreboard objectives add node_r_z_min dummy
scoreboard objectives add node_r_z_max dummy
scoreboard objectives add node_r_x_i dummy
scoreboard objectives add node_r_z_i dummy
scoreboard objectives add trigger_time dummy
scoreboard objectives add fork_count dummy
scoreboard objectives add impact dummy
