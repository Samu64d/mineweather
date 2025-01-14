#
# mineweather:main/test0
#

# Item id
data modify storage io: item_id set value "minecraft:coal"
function minecraft_entity_api:item_display_entity/set_item_id

# Item components
data modify storage io: item_components set value {"minecraft:item_model": "mineweather:obj/cloud/dark_box"}
function minecraft_entity_api:item_display_entity/set_item_components

# Translation

# X
scoreboard players set ::in min -900
scoreboard players set ::in max 900
execute store result score ::in x run function random:rand

# Y
scoreboard players set ::in min -50
scoreboard players set ::in max 50
execute store result score ::in y run function random:rand

# Z
scoreboard players set ::in min -900
scoreboard players set ::in max 900
execute store result score ::in z run function random:rand

function nmath:vector3d/new_from_scores
data modify storage io: translation set from storage io: vector
function minecraft_entity_api:display_entity/set_translation

# Scale
scoreboard players set ::in min 70
scoreboard players set ::in max 300
execute store result score ::mineweather temp0 run function random:rand
data modify storage io: scale set value [30.0f, 30.0f, 30.0f]
execute store result storage io: scale[0] float 1.0 run scoreboard players get ::mineweather temp0
execute store result storage io: scale[1] float 1.0 run scoreboard players get ::int 70
execute store result storage io: scale[2] float 1.0 run scoreboard players get ::mineweather temp0
function minecraft_entity_api:display_entity/set_scale

# View range
data modify storage io: view_range set value 10.0f
function minecraft_entity_api:display_entity/set_view_range

# Tag
data modify storage io: tag set value "pupu"
function minecraft_entity_api:tag/add_tag
