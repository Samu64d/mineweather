#
# mineweather:world_manager/define/define
#

# Declare module
#define score_holder ::mineweather::world_manager
#define score_holder ::mineweather::world_manager::const

# Define variables
scoreboard objectives add ticked_surface_count dummy

scoreboard objectives add is_solid dummy
scoreboard objectives add is_snow_layer dummy
scoreboard objectives add is_snow_layer_at_surface dummy
scoreboard objectives add is_water_layer_at_surface dummy
scoreboard objectives add layers dummy
