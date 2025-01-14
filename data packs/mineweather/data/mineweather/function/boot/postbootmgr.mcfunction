#
# mineweather:boot/postbootmgr
#

# Subscribe to events
function mineweather:events/subscribers/on_chunk_ticked

# Registry classes
data modify storage io: class_path set value "mineweather:objs/obj.lightning_bolt_path"
function obj:registry
