#
# mineweather:config/ticking
#

scoreboard objectives add TICKED_SUFACES_PER_CHUNK dummy

# Number of surfaces ticked per chunk tick
#  (number)
#  0              Disable chunk surface ticking
#  [1, 4]         Number of surfaces ticked per chunk tick
scoreboard players set ::mineweather::const TICKED_SUFACES_PER_CHUNK 2
