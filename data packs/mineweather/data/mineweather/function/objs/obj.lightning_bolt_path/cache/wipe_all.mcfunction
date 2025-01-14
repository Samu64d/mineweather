#
# mineweather:objs/obj.lightning_bolt_path/cache/wipe_all
#

# Clear static data
data remove storage mineweather:static objlightning_bolt_path
data modify storage mineweather:static objlightning_bolt_path set value {}

# Clear volatile data
data remove storage mineweather:volatile objlightning_bolt_path
data modify storage mineweather:volatile objlightning_bolt_path set value {}
