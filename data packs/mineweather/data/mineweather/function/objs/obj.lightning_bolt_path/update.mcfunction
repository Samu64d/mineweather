#
# mineweather:objs/obj.lightning_bolt_path/update
#
# Update the state of a lightning bolt path
#> Context
#  @executor (in): the lightning bolt path
#> Return void

# Super
function obj:objs/obj.obj/update

# Continue generate nodes
execute if score @s mineweather_objs_obj.lightning_bolt_path_node_count < @s mineweather_objs_obj.lightning_bolt_path_max_node_count if score @s mineweather_objs_obj.lightning_bolt_path_stop_generation = ::const FALSE if score @s mineweather_objs_obj.lightning_bolt_path_impact = ::const FALSE run function mineweather:objs/obj.lightning_bolt_path/gen/next

# Check if the lightning bolt duration is expired
execute store result score ::mineweather::objs::obj.lightning_bolt_path temp0 run function time:mc_time/get_game_time
execute if score @s mineweather_objs_obj.lightning_bolt_path_decay_time <= ::mineweather::objs::obj.lightning_bolt_path temp0 run function obj:delete
