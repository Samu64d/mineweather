#
# mineweather:objs/obj.lightning_bolt_path/calc_max_count_count
#

# Base node count
scoreboard players set ::in min 128
scoreboard players set ::in max 512
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 = @s mineweather_objs_obj.lightning_bolt_path_jagged_index
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 /= ::int 5
execute if score ::mineweather::objs::obj.lightning_bolt_path temp0 matches 1.. run scoreboard players operation ::in max *= ::mineweather::objs::obj.lightning_bolt_path temp0
execute store result score @s mineweather_objs_obj.lightning_bolt_path_max_node_count run function random:rand

# Check for depth
execute if score @s mineweather_objs_obj.lightning_bolt_path_depth matches 1.. run function mineweather:objs/obj.lightning_bolt_path/calc_max_node_count/check_for_depth

# Limit results
execute if score @s mineweather_objs_obj.lightning_bolt_path_max_node_count > ::mineweather::objs::obj.lightning_bolt_path::const MAX_PATH_NODE_COUNT run scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_max_node_count = ::mineweather::objs::obj.lightning_bolt_path::const MAX_PATH_NODE_COUNT
