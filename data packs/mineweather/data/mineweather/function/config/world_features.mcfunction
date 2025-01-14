#
# mineweather:config/world_features
#

scoreboard objectives add ALLOW_PUDDLES_FORMATION dummy

scoreboard objectives add ALLOW_FROST_FORMATION dummy

scoreboard objectives add ALLOW_SNOW_FORMATION dummy

scoreboard objectives add MAX_SNOW_DEPTH dummy

scoreboard objectives add PERMANENT_SNOW_LINE_HEIGHT dummy

scoreboard objectives add CUSTOM_LIGHTNING_BOLT dummy

scoreboard objectives add SKY_CONDITION_BEHAVIOUR dummy

# Enable or disable the formation of puddles during rainfalls. TICKED_SUFACES_PER_CHUNK need to be positive
#  Disable it to avoid intense lag and delay during rainfalls
#  (boolean)
#  FALSE          Disable puddles formation
#  TRUE           Enable puddles formation
scoreboard players operation ::mineweather::const ALLOW_PUDDLES_FORMATION = ::const FALSE

# Enable or disable the formation of frost and ice during cold. TICKED_SUFACES_PER_CHUNK need to be positive
#  Disable it to avoid intense lag and delay during cold
#  (boolean)
#  FALSE          Disable frost formation
#  TRUE           Enable frost formation
scoreboard players operation ::mineweather::const ALLOW_FROST_FORMATION = ::const TRUE

# Enable or disable the formation of snow layers during snowfall. TICKED_SUFACES_PER_CHUNK need to be positive
#  Disable it to avoid intense lag and delay during snowfalls
#  (boolean)
#  FALSE          Disable snow layers formation
#  TRUE           Enable snow layers formation
scoreboard players operation ::mineweather::const ALLOW_SNOW_FORMATION = ::const TRUE

# Specify the maximum snow accumulation height expressed in 1/16th of block. ALLOW_SNOW_FORMATION takes
#  precedence on this and if disabled will disable the snow accumulation process completely
#  (number)
#  -1             Disable snow depth limit
#  [0, 160]       Maximum allowed snow depth
scoreboard players set ::mineweather::const MAX_SNOW_DEPTH 32

# Set a permanent snow line level. Specifies a minimum world height level at which the snow cover is
#  permanent throughout the year. The snow will not melt even if the temperature is above zero.
#  (number)
#  -2033          Disable permanent snow line
#  [-2032, 2032]  World height of the snow line
scoreboard players set ::mineweather::const PERMANENT_SNOW_LINE_HEIGHT -2033

# Enable custom lightning bolts. May cause severe lag and delay
#  (boolean)
#  FALSE          Disable custom lightning bolt
#  TRUE           Enable custom lightning bolt
scoreboard players operation ::mineweather::const CUSTOM_LIGHTNING_BOLT = ::const TRUE

# Set the behaviour of the Minecraft sky condition
#  One of the limitations of Minecraft is that weather changes are apply globally an even the sky condition texture.
#  In multiplayer worlds this will bring out problems cause players might be found in differents world
#  zones with different local weather conditions. If for example a player stay in an area that enable the raining sky
#  condition and another player stay in an area that enable the clear sky condition, it will be possible only to apply one
#  of the two state. This setting controls the sky condition behaviour in multiplayer worlds.
#  Note that Minecraft weather influence some in game behaviours regarding entity AI, lights and blocks
#  (number)
#  0       Disable sky layout changes and set it to clear all times
#  1       The sky layout will changes to rainy or thunder if almost one player is in a cloudy/raining/storming zone
#  2       The sky layout will changes to rainy or thunder when all players are in a cloudy/raining/storming zone
scoreboard players set ::mineweather::const SKY_CONDITION_BEHAVIOUR 1
