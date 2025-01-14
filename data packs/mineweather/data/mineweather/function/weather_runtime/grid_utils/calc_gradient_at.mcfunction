#
# mineweather:weather_runtime/grid_utils/calc_gradient_at
#
# Calculate the gradient value of a grid at a position
#> Scores
#  @x (in): the x position
#  @y (in): the y position
#  @fxp_x_gradient (out): the x gradient
#  @fxp_y_gradient (out): the y gradient
#> Storage
#  @grid_ref (in): the grid reference
#> Return void

scoreboard players operation ::in p = ::mineweather::weather_runtime::const FPX_PRECISION

# Save position
scoreboard players operation ::mineweather::weather_runtime::grid_utils x = ::in x
scoreboard players operation ::mineweather::weather_runtime::grid_utils y = ::in y

# Calculate x gradient

# Get x - 1
scoreboard players operation ::in x = ::mineweather::weather_runtime::grid_utils x
scoreboard players remove ::in x 1
scoreboard players operation ::in y = ::mineweather::weather_runtime::grid_utils y
execute store result score ::mineweather::weather_runtime::grid_utils temp0 run function mineweather:weather_runtime/collections/referenced_grid/get_index_at

# Get x + 1
scoreboard players operation ::in x = ::mineweather::weather_runtime::grid_utils x
scoreboard players add ::in x 1
scoreboard players operation ::in y = ::mineweather::weather_runtime::grid_utils y
execute store result score ::in value0 run function mineweather:weather_runtime/collections/referenced_grid/get_index_at

# Calculate
scoreboard players operation ::in value0 -= ::mineweather::weather_runtime::grid_utils temp0
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_0.5
execute store result score ::out fxp_x_gradient run function math:mulf

# Calculate y gradient

# Get y - 1
scoreboard players operation ::in x = ::mineweather::weather_runtime::grid_utils x
scoreboard players operation ::in y = ::mineweather::weather_runtime::grid_utils y
scoreboard players remove ::in y 1
execute store result score ::mineweather::weather_runtime::grid_utils temp0 run function mineweather:weather_runtime/collections/referenced_grid/get_index_at

# Get y + 1
scoreboard players operation ::in x = ::mineweather::weather_runtime::grid_utils x
scoreboard players operation ::in y = ::mineweather::weather_runtime::grid_utils y
scoreboard players add ::in y 1
execute store result score ::in value0 run function mineweather:weather_runtime/collections/referenced_grid/get_index_at

# Calculate
scoreboard players operation ::in value0 -= ::mineweather::weather_runtime::grid_utils temp0
scoreboard players operation ::in value1 = ::mineweather::weather_runtime::const FXP_0.5
execute store result score ::out fxp_y_gradient run function math:mulf
