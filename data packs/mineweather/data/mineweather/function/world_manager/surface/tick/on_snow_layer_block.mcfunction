#
# mineweather:world_manager/surface/tick/on_snow_layer_block
#

# Try to decrease
function mineweather:world_manager/surface/tick/try_decrease_snow_layer_layers

# Return if snow formation is disabled
execute if score ::mineweather::const ALLOW_SNOW_FORMATION = ::const FALSE run return 0

# Get snow layer layers
data modify storage io: property set value "layers"
execute store result score ::mineweather::world_manager layers run function minecraft_world_api:block/blockstates/get_blockstate_property_at_pos_as_integer

# Try place snow layer on upper surface
execute if score ::mineweather::world_manager layers matches 8 run function mineweather:world_manager/surface/tick/on_surface_for_snow_layer
execute if score ::mineweather::world_manager layers matches 8 run return 0

# Check for snow depth
execute if score ::mineweather::const MAX_SNOW_DEPTH matches 0.. store result score ::mineweather::world_manager temp0 run function minecraft_world_api:layout/api/calc_snow_depth
execute if score ::mineweather::const MAX_SNOW_DEPTH matches 0.. if score ::mineweather::world_manager temp0 >= ::mineweather::const MAX_SNOW_DEPTH run return 0

# Try to increase snow layer layers
data modify storage io: block_pos set from storage mineweather:volatile world_manager.surface_block_pos
function minecraft_world_api:block_pos/down
function mineweather:world_manager/surface/tick/try_increase_snow_layer_layers
