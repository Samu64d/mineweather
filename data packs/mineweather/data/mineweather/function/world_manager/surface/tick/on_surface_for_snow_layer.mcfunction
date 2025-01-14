#
# mineweather:world_manager/surface/tick/on_surface_for_snow_layer
#

# Check for surface
data modify storage io: block_pos set from storage mineweather:volatile world_manager.surface_block_pos
execute store result score ::mineweather::world_manager temp0 run function mineweather:world_manager/surface/can_apply_snow_layer_at_block_pos

# Try to place
data modify storage io: block_pos set from storage mineweather:volatile world_manager.surface_block_pos
execute if score ::mineweather::world_manager temp0 = ::const TRUE run function mineweather:world_manager/surface/tick/try_place_snow_layer
