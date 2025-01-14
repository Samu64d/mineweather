#
# mineweather:cache/wipe_all
#

# Clear static data
data remove storage mineweather:static {}
data modify storage mineweather:static {} set value {}

# Clear volatile data
data remove storage mineweather:volatile {}
data modify storage mineweather:volatile {} set value {}

function mineweather:client/cache/wipe_all
function mineweather:objs/obj.lightning_bolt_path/cache/wipe_all
function mineweather:weather_runtime/cache/wipe_all
function mineweather:world_manager/cache/wipe_all
