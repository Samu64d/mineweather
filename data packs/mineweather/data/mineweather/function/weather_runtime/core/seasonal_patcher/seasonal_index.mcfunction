#
# mineweather:weather_runtime/core/time/seasonal_index
#

scoreboard objectives add seasonal_index dummy
scoreboard objectives add HALF_YEAR_SIZE dummy

scoreboard players set ::global HALF_YEAR_SIZE 744000

scoreboard players operation ::engine seasonal_index = ::time tick
scoreboard players operation ::engine seasonal_index -= ::global HALF_YEAR_SIZE
execute if score ::engine seasonal_index matches ..-1 run scoreboard players operation ::engine seasonal_index *= ::const NEGONE
scoreboard players operation ::engine seasonal_index %= ::const YEAR_SIZE
scoreboard players operation ::engine seasonal_index *= ::int 200
scoreboard players operation ::engine seasonal_index /= ::const YEAR_SIZE
scoreboard players operation ::engine seasonal_index -= ::int 100
execute if score ::engine seasonal_index matches ..-1 run scoreboard players operation ::engine seasonal_index *= ::const NEGONE
