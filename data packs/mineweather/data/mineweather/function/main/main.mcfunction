#
# mineweather:main/main
#

# Player manager
data modify storage io: callback set value "mineweather:client/player_manager"
function server:management/player_list/for_each_executor

# Weather runtime
function mineweather:weather_runtime/tick

# TEST

# Lightning bolt
scoreboard players set ::in min 0
scoreboard players set ::in max 70
execute unless function random:rand run function mineweather:main/trigger

# Sky box
scoreboard objectives add sky_box_intensity dummy
execute store result score ::mineweather sky_box_intensity run execute if entity @e[tag=k]
scoreboard players set ::in min 0
scoreboard players set ::in max 2
execute unless function random:rand run execute if score ::mineweather sky_box_intensity matches ..95 positioned 0 0 0 run summon minecraft:item_display ~ ~ ~ {Tags:["k"], item:{id:"minecraft:coal", components:{"minecraft:item_model":"mineweather:obj/sky_box/dark_box"}}}
execute as @e[tag=k] run data modify entity @s transformation.scale set value [700.0f, 700.0f, 700.0f]

# Cloud
scoreboard players set ::in x 0
scoreboard players set ::in y 200
scoreboard players set ::in z 0
function nmath:vector3d/new_from_scores
data modify storage io: position set from storage io: vector
data modify storage io: type set value "minecraft:item_display"
data modify storage io: callback set value "mineweather:main/test0"
execute store result score ::mineweather temp0 run execute if entity @e[tag=pupu]
execute if score ::mineweather temp0 matches ..100 run function minecraft_entity_api:entity/new
