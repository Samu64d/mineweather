#
# mineweather:objs/obj.lightning_bolt/new
#
# Create a new lightning bolt
#> Scores
#  @type (in): the type
#  @deep (in): the deep
#  @direction (in): the type
#  @size (in): the type
#  @duration (in): the type
#  @fork_index (in): the type
#  @jagged_index (in): the type
#  @bead_index (in): the type
#  @node_length_min (in): the type
#  @node_length_max (in): the type
#  @node_r_x_min (in): the type
#  @node_r_x_max (in): the type
#  @node_r_z_min (in): the type
#  @node_r_z_max (in): the type
#> Storage
#  @executor (in): the lightning bolt
#> Return void

# Type
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_type = ::in type

# Path deep
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_deep = ::in deep

# Generate the start path configuration
execute if score ::in deep matches 0 run function mineweather:objs/obj.lightning_bolt/gen_init_config

# Direction
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_direction = ::in direction

# Main channel size
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_size = ::in size

# Duration
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_duration = ::in duration

# Fork index
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_fork_index = ::in fork_index

# Jagged index
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_jagged_index = ::in jagged_index

# Bead index
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_bead_index = ::in bead_index

# Node length range
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_node_length_min = ::in node_length_min
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_node_length_max = ::in node_length_max

# Node rotation angles

# X
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_node_r_x_min = ::in node_r_x_min
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_node_r_x_max = ::in node_r_x_max

# Z
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_node_r_z_min = ::in node_r_z_min
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_node_r_z_max = ::in node_r_z_max

# Node directional angles
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_node_r_x_i = ::in node_r_x_i
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_node_r_z_i = ::in node_r_z_i

# Number of path forks
scoreboard players set @s mineweather_objs_obj.lightning_bolt_fork_count 0

# Impact detection flag
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_impact = ::const FALSE

# Start lightning path generation
function mineweather:server/obj/obj/lightning_bolt/trigger
