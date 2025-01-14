#
# mineweather:main/trigger
#

scoreboard players set ::in min 10
scoreboard players set ::in max 170
execute store result score ::in fxp_size run function random:rand

scoreboard players set ::in intensity 100
scoreboard players set ::in depth 0
scoreboard players set ::in duration 15

scoreboard players set ::in min 10
scoreboard players set ::in max 20
execute store result score ::in fxp_node_length_min run function random:rand
execute store result score ::in fxp_node_length_max run function random:rand
scoreboard players operation ::in fxp_node_length_min *= ::int 10
scoreboard players operation ::in fxp_node_length_max *= ::int 20

scoreboard players set ::in min 3
scoreboard players set ::in max 15
execute store result score ::in fork_index run function random:rand

scoreboard players set ::in min 10
scoreboard players set ::in max 80
execute store result score ::in jagged_index run function random:rand

scoreboard players operation ::in is_beaded = ::const FALSE

scoreboard players set ::in min 0
scoreboard players set ::in max 15
execute store result score ::test temp0 run function random:rand
execute if score ::test temp0 matches 5.. run scoreboard players operation ::in direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions DOWNWARD
execute if score ::test temp0 matches 0..4 run scoreboard players operation ::in direction = ::mineweather::objs::obj.lightning_bolt_path::enum_directions HORIZONTAL

data modify storage io: dimension set value "minecraft:overworld"
data modify storage io: position set value [0d, 240.0d, 0d]
scoreboard players set ::in min 30
scoreboard players set ::in max 60
execute store result storage io: position[0] double 1.0 run function random:rand
scoreboard players set ::in min -150
scoreboard players set ::in max 150
execute store result storage io: position[2] double 1.0 run function random:rand

data modify storage io: class_name set value "mineweather:lightning_bolt_path"
function obj:new
data modify storage io: pointer_test set from storage io: pointer

data modify storage io: pointer set from storage io: pointer_test
data modify storage io: method set value "start_generation"
function obj:bind
