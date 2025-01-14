#
# mineweather:objs/obj.lightning_bolt_path/gen/next/adjust_angle
#

# X
scoreboard players operation ::in fxp_r_x -= ::math::const FXP_PI_DEG

# Z
scoreboard players operation ::in fxp_r_z *= ::const NEGONE
scoreboard players operation ::in fxp_r_z %= ::math::const FXP_PI_DEG
