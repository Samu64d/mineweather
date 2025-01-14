#
# mineweather:objs/obj.lightning_bolt_path/detect_impact
#

# Get object dimension
function obj:objs/obj.obj/get_dimension

# Create block position
scoreboard players operation ::in x = ::in fxp_x
scoreboard players operation ::in y = ::in fxp_y
scoreboard players operation ::in z = ::in fxp_z
function nmath:vector3d/new_from_fixed_point_values
function minecraft_world_api:block_pos/new_from_vector3d

# Check for non air block
execute unless function minecraft_world_api:block/api/is_air_at_pos if function minecraft_world_api:layout/api/can_build run function mineweather:objs/obj.lightning_bolt_path/on_impact
