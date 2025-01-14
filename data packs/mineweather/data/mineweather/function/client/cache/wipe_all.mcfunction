#
# mineweather:client/cache/wipe_all
#

# Clear static data
data remove storage mineweather:static client
data modify storage mineweather:static client set value {}

# Clear volatile data
data remove storage mineweather:volatile client
data modify storage mineweather:volatile client set value {}
