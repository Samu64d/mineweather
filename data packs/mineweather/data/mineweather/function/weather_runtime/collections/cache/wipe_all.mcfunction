#
# mineweather:weather_runtime/collections/cache/wipe_all
#

# Clear static data
data remove storage mineweather:static weather_runtime.collections
data modify storage mineweather:static weather_runtime.collections set value {}

# Clear volatile data
data remove storage mineweather:volatile weather_runtime.collections
data modify storage mineweather:volatile weather_runtime.collections set value {}

function mineweather:weather_runtime/collections/referenced_grid/cache/wipe_all
function mineweather:weather_runtime/collections/referenced_grid128/cache/wipe_all
