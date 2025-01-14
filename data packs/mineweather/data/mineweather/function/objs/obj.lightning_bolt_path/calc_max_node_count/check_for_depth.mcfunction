#
# mineweather:objs/obj.lightning_bolt_path/calc_max_node_count/check_for_depth
#

scoreboard players set ::in min 1
scoreboard players operation ::in min *= @s mineweather_objs_obj.lightning_bolt_path_depth
scoreboard players set ::in max 256
scoreboard players operation ::in max *= @s mineweather_objs_obj.lightning_bolt_path_depth
execute store result score ::mineweather::objs::obj.lightning_bolt_path temp0 run function random:rand
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_max_node_count -= ::mineweather::objs::obj.lightning_bolt_path temp0
execute if score @s mineweather_objs_obj.lightning_bolt_path_max_node_count matches ..0 run scoreboard players set @s mineweather_objs_obj.lightning_bolt_path_max_node_count 1
