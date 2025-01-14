#
# mineweather:weather_runtime/define/fxp_config
#

# Number of digits reserved for fractional part
scoreboard objectives add FPX_PRECISION dummy

# Fractional part number magnitude
scoreboard objectives add FPX_MAG dummy

scoreboard players set ::mineweather::weather_runtime::const FPX_PRECISION 3

# [Constexpr] Do not edit this
scoreboard players operation ::in pow = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FPX_MAG run function math:utils/get_power_of_ten
