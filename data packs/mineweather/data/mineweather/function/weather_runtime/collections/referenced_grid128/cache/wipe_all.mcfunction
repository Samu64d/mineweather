#
# mineweather:weather_runtime/collections/referenced_grid128/cache/wipe_all
#

# Clear static data
data remove storage mineweather:static weather_runtime.collections.referenced_grid128
data modify storage mineweather:static weather_runtime.collections.referenced_grid128 set value {}

# Clear volatile data
data remove storage mineweather:volatile weather_runtime.collections.referenced_grid128
data modify storage mineweather:volatile weather_runtime.collections.referenced_grid128 set value {}
