#
# mineweather:weather_runtime/cache/wipe_all
#

# Clear static data
data remove storage mineweather:static weather_runtime
data modify storage mineweather:static weather_runtime set value {}

# Clear volatile data
data remove storage mineweather:volatile weather_runtime
data modify storage mineweather:volatile weather_runtime set value {}

function mineweather:weather_runtime/collections/cache/wipe_all
