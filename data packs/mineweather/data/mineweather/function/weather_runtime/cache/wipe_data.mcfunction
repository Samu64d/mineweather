#
# mineweather:weather_runtime/cache/wipe_data
#

# Clear data
data remove storage mineweather:data weather_runtime
data modify storage mineweather:data weather_runtime set value {}
