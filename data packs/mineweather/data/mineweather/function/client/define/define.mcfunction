#
# mineweather:client/define/define
#

# Declare module
#define score_holder ::mineweather::client
#define score_holder ::mineweather::client::const

# Define variables
scoreboard objectives add fxp_motion_contrib_x dummy
scoreboard objectives add fxp_motion_contrib_y dummy
scoreboard objectives add fxp_motion_contrib_z dummy
scoreboard objectives add precipitations_loop_y_incr dummy
scoreboard objectives add precipitations_loop_count dummy
scoreboard objectives add precipitations_count dummy
scoreboard objectives add rain_count dummy
scoreboard objectives add snow_count dummy
scoreboard objectives add hail_count dummy
scoreboard objectives add wind_count dummy
scoreboard objectives add snow_type_index dummy

# Define player attributes
scoreboard objectives add fxp_mineweather_client_prev_pos_x dummy
scoreboard objectives add fxp_mineweather_client_prev_pos_y dummy
scoreboard objectives add fxp_mineweather_client_prev_pos_z dummy
scoreboard objectives add fxp_mineweather_client_prev_velocity_x dummy
scoreboard objectives add fxp_mineweather_client_prev_velocity_y dummy
scoreboard objectives add fxp_mineweather_client_prev_velocity_z dummy
