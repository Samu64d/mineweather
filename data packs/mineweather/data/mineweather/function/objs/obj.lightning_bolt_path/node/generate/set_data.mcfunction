#
# mineweather:objs/obj.lightning_bolt_path/node/generate/set_data
#

# Item id
data modify storage io: item_id set value "minecraft:coal"
function minecraft_entity_api:item_display_entity/set_item_id

# Item components
data modify storage io: item_components set value {}
data modify storage io: item_components."minecraft:item_model" set from storage mineweather:static objlightning_bolt_path.NODE_MODEL
function minecraft_entity_api:item_display_entity/set_item_components

# Rotation
scoreboard players operation ::in x = ::in fxp_r_x
scoreboard players operation ::in y = ::in fxp_r_z
function nmath:vector2f/new_from_fixed_point_values
data modify storage io: rotation set from storage io: vector
function minecraft_entity_api:entity/set_rotation

# Scale
scoreboard players operation ::in x = ::in fxp_size
scoreboard players operation ::in y = ::in fxp_length
scoreboard players operation ::in z = ::in fxp_size
function nmath:vector3f/new_from_fixed_point_values
data modify storage io: scale set from storage io: vector
function minecraft_entity_api:display_entity/set_scale

# View distance
data modify storage io: view_range set value 100.0
function minecraft_entity_api:display_entity/set_view_range

# Add tag
function mineweather:objs/obj.lightning_bolt_path/common/generate_node_tag with storage io:
function minecraft_entity_api:tag/add_tag
