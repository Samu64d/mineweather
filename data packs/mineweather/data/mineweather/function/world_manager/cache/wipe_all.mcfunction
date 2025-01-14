#
# mineweather:world_manager/cache/wipe_all
#

# Clear static data
data remove storage mineweather:static world_manager
data modify storage mineweather:static world_manager set value {}

# Clear volatile data
data remove storage mineweather:volatile world_manager
data modify storage mineweather:volatile world_manager set value {}
