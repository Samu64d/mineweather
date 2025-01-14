#
# mineweather:world_manager/surface/tick
#

# Save data
data modify storage mineweather:volatile world_manager.surface_block_pos set from storage io: block_pos

# Retrive weather data at block position
function mineweather:weather_api/model/get_weather_data_at_pos

# Check for below surface block

function minecraft_world_api:block_pos/down

# Check for snow layer
data modify storage io: name set value "minecraft:snow"
execute store result score ::mineweather::world_manager is_snow_layer_at_surface run function minecraft_world_api:block/api/is_at_pos

# Check for water layer
data modify storage io: name set value "minecraft:water[level=7]"
execute store result score ::mineweather::world_manager is_water_layer_at_surface run function minecraft_world_api:block/api/is_at_pos

# Place precipitaions layers

# Snow
execute if score ::mineweather::const ALLOW_SNOW_FORMATION = ::const TRUE unless score ::mineweather::world_manager is_snow_layer_at_surface = ::const TRUE run function mineweather:world_manager/surface/tick/on_surface_for_snow_layer

# Water (puddles)
execute if score ::mineweather::const ALLOW_PUDDLES_FORMATION = ::const TRUE unless score ::mineweather::world_manager is_water_layer_at_surface = ::const TRUE run function mineweather:world_manager/surface/tick/on_surface_for_water_layer

# Update precipitation layers

# Snow
execute if score ::mineweather::world_manager is_snow_layer_at_surface = ::const TRUE run function mineweather:world_manager/surface/tick/on_snow_layer_block
