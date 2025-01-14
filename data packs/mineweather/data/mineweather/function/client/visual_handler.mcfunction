#
# mineweather:client/visual_handler
#

# Check for first tick
execute if function stdmodulesystem:api/is_first_tick run function mineweather:client/visual_handler/reset_player_attributes

# Get player block position
function minecraft_entity_api:entity/get_block_pos

# Retrive weather data at block position
function mineweather:weather_api/model/get_weather_data_at_pos

# Show precipitation particles

# Get player dimension
function minecraft_entity_api:entity/get_dimension

# Get player position
function minecraft_entity_api:entity/get_position

# Calculate player motion contribution

# Conver to fixed point values
data modify storage io: vector set from storage io: position
function nmath:vector3d/to_fixed_point_values

# X
scoreboard players operation @s fxp_mineweather_client_prev_velocity_x = ::out x
scoreboard players operation @s fxp_mineweather_client_prev_velocity_x -= @s fxp_mineweather_client_prev_pos_x
scoreboard players operation ::in value0 = @s fxp_mineweather_client_prev_velocity_x
scoreboard players set ::in value1 10
scoreboard players operation ::in value1 *= ::math::const FXP_DEF_MAG
execute store result score ::mineweather::client fxp_motion_contrib_x run function math:mul

# Y
scoreboard players operation @s fxp_mineweather_client_prev_velocity_y = ::out y
scoreboard players operation @s fxp_mineweather_client_prev_velocity_y -= @s fxp_mineweather_client_prev_pos_y
scoreboard players operation ::in value0 = @s fxp_mineweather_client_prev_velocity_y
scoreboard players set ::in value1 10
scoreboard players operation ::in value1 *= ::math::const FXP_DEF_MAG
execute store result score ::mineweather::client fxp_motion_contrib_y run function math:mul

# Z
scoreboard players operation @s fxp_mineweather_client_prev_velocity_z = ::out z
scoreboard players operation @s fxp_mineweather_client_prev_velocity_z -= @s fxp_mineweather_client_prev_pos_z
scoreboard players operation ::in value0 = @s fxp_mineweather_client_prev_velocity_z
scoreboard players set ::in value1 10
scoreboard players operation ::in value1 *= ::math::const FXP_DEF_MAG
execute store result score ::mineweather::client fxp_motion_contrib_z run function math:mul

# Add residual contribute to y
scoreboard players operation ::mineweather::client temp0 = ::mineweather::client fxp_motion_contrib_x
execute if score ::mineweather::client temp0 matches 1.. run scoreboard players operation ::mineweather::client temp0 *= ::const NEGONE
scoreboard players operation ::mineweather::client temp1 = ::mineweather::client fxp_motion_contrib_z
execute if score ::mineweather::client temp1 matches 1.. run scoreboard players operation ::mineweather::client temp1 *= ::const NEGONE
scoreboard players operation ::mineweather::client temp0 += ::mineweather::client temp1
scoreboard players set ::mineweather::client temp1 -1
scoreboard players operation ::mineweather::client temp1 *= ::math::const FXP_DEF_MAG
execute if score ::mineweather::client temp0 < ::mineweather::client temp1 run scoreboard players operation ::mineweather::client temp0 = ::mineweather::client temp1
scoreboard players operation ::mineweather::client fxp_motion_contrib_y += ::mineweather::client temp0

# Update player previous position values
scoreboard players operation @s fxp_mineweather_client_prev_pos_x = ::out x
scoreboard players operation @s fxp_mineweather_client_prev_pos_y = ::out y
scoreboard players operation @s fxp_mineweather_client_prev_pos_z = ::out z

# Add player motion contribution

# X
scoreboard players operation ::in value = ::mineweather::client fxp_motion_contrib_x
execute store result score ::in x run function math:ceil
scoreboard players operation ::in x /= ::math::const FXP_DEF_MAG
function minecraft_world_api:block_pos/add_x

# Y
scoreboard players operation ::in value = ::mineweather::client fxp_motion_contrib_y
execute store result score ::in y run function math:ceil
scoreboard players operation ::in y /= ::math::const FXP_DEF_MAG
function minecraft_world_api:block_pos/add_y

# Z
scoreboard players operation ::in value = ::mineweather::client fxp_motion_contrib_z
execute store result score ::in z run function math:ceil
scoreboard players operation ::in z /= ::math::const FXP_DEF_MAG
function minecraft_world_api:block_pos/add_z

# Save block pos
data modify storage mineweather:volatile client.particle_area_block_pos set from storage io: block_pos

# Show particles

# Reset counters
scoreboard players set ::mineweather::client rain_count 0
scoreboard players set ::mineweather::client snow_count 0
scoreboard players set ::mineweather::client hail_count 0
scoreboard players set ::mineweather::client wind_count 0

# Rain
execute store result score ::mineweather::client precipitations_loop_count run data get storage io: point_weather_data_descriptor.precipitations_rain 160.0
execute if score ::mineweather::client precipitations_loop_count matches 1.. run function mineweather:client/visual_handler/process_rain_precipitations

# Snow
execute store result score ::mineweather::client precipitations_loop_count run data get storage io: point_weather_data_descriptor.precipitations_snow 160.0
execute store result score ::mineweather::client snow_type_index run data get storage io: point_weather_data_descriptor.snow_type_index 1.0
execute if score ::mineweather::client snow_type_index matches ..100 if score ::mineweather::client precipitations_loop_count matches 1.. run function mineweather:client/visual_handler/process_snow_small_flake_precipitations
execute if score ::mineweather::client snow_type_index matches 101..200 if score ::mineweather::client precipitations_loop_count matches 1.. run function mineweather:client/visual_handler/process_snow_precipitations
execute if score ::mineweather::client snow_type_index matches 201.. if score ::mineweather::client precipitations_loop_count matches 1.. run function mineweather:client/visual_handler/process_snow_big_flake_precipitations

# Hail
execute store result score ::mineweather::client precipitations_loop_count run data get storage io: point_weather_data_descriptor.precipitations_hail 160.0
execute if score ::mineweather::client precipitations_loop_count matches 1.. run function mineweather:client/visual_handler/process_hail_precipitations

# Check for wind speed
execute store result score ::mineweather::client wind_count run data get storage io: point_weather_data_descriptor.wind_speed 1.0

# Handle sounds

# Check for session time
execute store result score ::mineweather::client temp0 run function server:api/get_session_time
scoreboard players operation ::mineweather::client temp0 %= ::int 5
execute if score ::mineweather::client temp0 matches 0 run function mineweather:client/visual_handler/reproduce_sounds
