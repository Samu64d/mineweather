#
# mineweather:objs/obj.lightning_bolt_path/node/generate
#

# Get object dimension
function obj:objs/obj.obj/get_dimension

# Get object pointer
function obj:objs/obj.obj/get_pointer

# Create block position
scoreboard players operation ::in x = ::in fxp_x
scoreboard players operation ::in y = ::in fxp_y
scoreboard players operation ::in z = ::in fxp_z
function nmath:vector3d/new_from_fixed_point_values
function minecraft_world_api:block_pos/new_from_vector3d

# Check if the position is loaded
execute unless function minecraft_world_api:loading/is_loaded run function mineweather:objs/obj.lightning_bolt_path/gen/stop
execute if score @s mineweather_objs_obj.lightning_bolt_path_stop_generation = ::const TRUE run return 0

# Create position
scoreboard players operation ::in x = ::in fxp_x
scoreboard players operation ::in y = ::in fxp_y
scoreboard players operation ::in z = ::in fxp_z
function nmath:vector3d/new_from_fixed_point_values

# Create entity
data modify storage io: type set value "minecraft:item_display"
data modify storage io: callback set value "mineweather:objs/obj.lightning_bolt_path/node/generate/set_data"
data modify storage io: position set from storage io: vector
function minecraft_entity_api:entity/new
