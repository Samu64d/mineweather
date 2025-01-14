#
# mineweather:weather_runtime/define/numbers
#

scoreboard objectives add FXP_-32 dummy
scoreboard objectives add FXP_-5 dummy
scoreboard objectives add FXP_0.001 dummy
scoreboard objectives add FXP_0.009 dummy
scoreboard objectives add FXP_0.01 dummy
scoreboard objectives add FXP_0.05 dummy
scoreboard objectives add FXP_0.031 dummy
scoreboard objectives add FXP_0.1 dummy
scoreboard objectives add FXP_0.5 dummy
scoreboard objectives add FXP_0.8 dummy
scoreboard objectives add FXP_1 dummy
scoreboard objectives add FXP_1.3 dummy
scoreboard objectives add FXP_1.5 dummy
scoreboard objectives add FXP_2 dummy
scoreboard objectives add FXP_3 dummy
scoreboard objectives add FXP_5 dummy
scoreboard objectives add FXP_10 dummy
scoreboard objectives add FXP_15 dummy
scoreboard objectives add FXP_32 dummy
scoreboard objectives add FXP_100 dummy
scoreboard objectives add FXP_880 dummy
scoreboard objectives add FXP_1025 dummy
scoreboard objectives add FXP_1070 dummy

# [Constexpr] Do not edit this
scoreboard players set ::in value -32
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_-32 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value -5
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_-5 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 1
scoreboard players set ::in size 3
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_0.001 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 9
scoreboard players set ::in size 3
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_0.009 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 1
scoreboard players set ::in size 2
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_0.01 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 5
scoreboard players set ::in size 2
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_0.05 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 31
scoreboard players set ::in size 3
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_0.031 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 1
scoreboard players set ::in size 1
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_0.1 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 5
scoreboard players set ::in size 1
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_0.5 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 8
scoreboard players set ::in size 1
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_0.8 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 1
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_1 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 13
scoreboard players set ::in size 1
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_1.3 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 15
scoreboard players set ::in size 1
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_1.5 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 2
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_2 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 3
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_3 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 5
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_5 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 10
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_10 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 15
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_15 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 32
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_32 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 100
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_100 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 880
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_880 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 1025
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_1025 run function math:fixed_point/calc_const_value

# [Constexpr] Do not edit this
scoreboard players set ::in value 1070
scoreboard players set ::in size 0
scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION
execute store result score ::mineweather::weather_runtime::const FXP_1070 run function math:fixed_point/calc_const_value
