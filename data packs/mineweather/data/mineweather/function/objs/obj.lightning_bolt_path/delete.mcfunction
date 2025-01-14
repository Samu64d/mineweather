#
# mineweather:objs/obj.lightning_bolt_path/delete
#
# Delete a lightning bolt path
#> Context
#  @executor (in): the lightning bolt path
#> Return void

# Super
function obj:objs/obj.obj/delete

# Get object pointer
function obj:objs/obj.obj/get_pointer

# Remove all own nodes
function mineweather:objs/obj.lightning_bolt_path/common/generate_node_tag with storage io:
data modify storage io: callback set value "minecraft_entity_api:entity/delete"
function server:selector_entity_list/select_by_tag
