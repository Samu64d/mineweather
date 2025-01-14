#
# mineweather:objs/obj.lightning_bolt_path/gen/fork
#

# Update fork count
scoreboard players add @s mineweather_objs_obj.lightning_bolt_path_fork_count 1

# Get object dimension
function obj:objs/obj.obj/get_dimension

# Create object position
scoreboard players operation ::in x = @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_x
scoreboard players operation ::in y = @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_y
scoreboard players operation ::in z = @s fxp_mineweather_objs_obj.lightning_bolt_path_prev_node_vect_z
function nmath:vector3d/new_from_fixed_point_values
data modify storage io: position set from storage io: vector

# Size
scoreboard players set ::in min -100
scoreboard players set ::in max 80
execute store result score ::in value0 run function random:rand
execute if score ::in value0 matches ..5 run scoreboard players set ::in value0 5
scoreboard players operation ::in value1 = @s fxp_mineweather_objs_obj.lightning_bolt_path_size
execute store result score ::in fxp_size run function math:mul

# Reduce size index
scoreboard players operation ::in value0 = ::in fxp_size
scoreboard players operation ::in value1 = ::int 5
execute store result score ::mineweather::objs::obj.lightning_bolt_path temp0 run function math:mul
scoreboard players operation @s fxp_mineweather_objs_obj.lightning_bolt_path_size -= ::mineweather::objs::obj.lightning_bolt_path temp0

# Intensity
scoreboard players operation ::in intensity = @s mineweather_objs_obj.lightning_bolt_path_intensity
scoreboard players operation ::in intensity *= ::int 60
scoreboard players operation ::in intensity /= ::int 100

# Depth
scoreboard players operation ::in depth = @s mineweather_objs_obj.lightning_bolt_path_depth
scoreboard players add ::in depth 1

# Duration
scoreboard players operation ::in duration = @s mineweather_objs_obj.lightning_bolt_path_duration
scoreboard players operation ::in duration *= ::int 50
scoreboard players operation ::in duration /= ::int 100

# Node length
scoreboard players operation ::in fxp_node_length_min = @s fxp_mineweather_objs_obj.lightning_bolt_path_node_length_min
scoreboard players operation ::in fxp_node_length_max = @s fxp_mineweather_objs_obj.lightning_bolt_path_node_length_max

# Fork index
scoreboard players set ::in min 25
scoreboard players set ::in max 50
execute store result score ::in value0 run function random:rand
scoreboard players operation ::in value1 = @s mineweather_objs_obj.lightning_bolt_path_fork_index
execute store result score ::in fork_index run function math:mul

# Jagged index
scoreboard players operation ::in jagged_index = @s mineweather_objs_obj.lightning_bolt_path_jagged_index

# Beaded flag
scoreboard players operation ::in is_beaded = @s mineweather_objs_obj.lightning_bolt_path_is_beaded

# Direction
scoreboard players operation ::in direction = @s mineweather_objs_obj.lightning_bolt_path_direction
scoreboard players set ::in min 0
scoreboard players set ::in max 5
execute store result score ::mineweather::objs::obj.lightning_bolt_path temp0 run function random:rand
execute if score ::mineweather::objs::obj.lightning_bolt_path temp0 matches 1.. if score ::in direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions DOWNWARD run scoreboard players operation ::in direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions OBLIQUE_DOWN
execute if score ::mineweather::objs::obj.lightning_bolt_path temp0 matches 1.. if score ::in direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions UPWARD run scoreboard players operation ::in direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions OBLIQUE_UP

# Create object
data modify storage io: class_name set value "mineweather:lightning_bolt_path"
function obj:new

# Start generation
data modify storage io: method set value "start_generation"
function obj:bind
