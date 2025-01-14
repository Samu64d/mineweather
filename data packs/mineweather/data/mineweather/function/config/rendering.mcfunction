#
# mineweather:config/rendering
#

scoreboard objectives add REDUCE_PARTICLES dummy

# Reduce the count of weather related particles
#  (boolean)
#  FALSE          Disable reduce particle count
#  TRUE           Enable reduce particle count
scoreboard players operation ::mineweather::const REDUCE_PARTICLES = ::const FALSE
