#
# mineweather:events/subscribers/on_chunk_ticked
#

data modify storage io: name set value "world_handler:on_chunk_ticked"
data modify storage io: callback set value "mineweather:world_manager/chunk/tick"
function event_system:api/subscribe
