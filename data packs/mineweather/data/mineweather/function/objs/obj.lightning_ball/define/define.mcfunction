#
# mineweather:server/obj/obj/lightning_ball/const
#

# Declare module
#define score_holder ::mineweather::objs::obj.lightning_ball
#define score_holder ::mineweather::objs::obj.lightning_ball::const

# Define constants
scoreboard objectives add MAX_SIZE dummy
scoreboard objectives add FXP_MAX_SPEED dummy

scoreboard players set ::mineweather::objs::obj.lightning_ball::const MAX_SIZE 20

scoreboard players set ::mineweather::objs::obj.lightning_ball::const FXP_MAX_SPEED 2000

# Define attributes
scoreboard objectives add mineweather_objs_obj.lightning_ball_size dummy

# Define variables
