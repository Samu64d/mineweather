#
# mineweather:world_manager/surface/can_apply_snow_layer_at_block_pos/check_snow_depth
#

execute store result score ::mineweather::world_manager temp0 run function minecraft_world_api:layout/api/calc_snow_depth
return run execute if score ::mineweather::world_manager temp0 < ::mineweather::const MAX_SNOW_DEPTH
