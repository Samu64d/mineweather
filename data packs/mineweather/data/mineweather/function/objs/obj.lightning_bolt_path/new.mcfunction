#
# mineweather:objs/obj.lightning_bolt_path/new
#
# Create a new lightning bolt path from an object
#> Scores
#  @fxp_size (in): the size
#  @intensity (in): the intensity
#  @depth (in): the depth
#  @duration (in): the duration in ticks
#  @fxp_node_length_min (in): the minimum node length
#  @fxp_node_length_max (in): the maximum node length
#  @fork_index (in): the fork index
#  @jagged_index (in): the jagged index
#  @is_beaded (in): the beaded flag
#  @direction (in): the direction
#> Context
#  @executor (in): the base object
#> Return void

# Super
function obj:objs/obj.obj/new

# Size
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_size = ::in fxp_size

# Intensity
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_intensity = ::in intensity

# Depth
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_depth = ::in depth

# Duration
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_duration = ::in duration

# Node length
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_node_length_min = ::in fxp_node_length_min
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_node_length_max = ::in fxp_node_length_max

# Fork index
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_fork_index = ::in fork_index

# Jagged index
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_jagged_index = ::in jagged_index

# Beaded flag
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_is_beaded = ::in is_beaded

# Direction
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_direction = ::in direction

# Generate direction angles and angle increments
function mineweather:objs/obj.lightning_bolt_path/gen_direction_config

# Node count
scoreboard players set @s mineweather_objs_obj.lightning_bolt_path_node_count 0

# Fork count
scoreboard players set @s mineweather_objs_obj.lightning_bolt_path_fork_count 0

# Stop generation flag
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_stop_generation = ::const FALSE

# Impact flag
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_impact = ::const FALSE
