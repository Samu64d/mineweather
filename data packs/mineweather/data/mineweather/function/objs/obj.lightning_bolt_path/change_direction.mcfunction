#
# mineweather:objs/obj.lightning_bolt_path/change_direction
#

scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 = @s mineweather_objs_obj.lightning_bolt_path_direction

# Calculate possible directions
execute store success score ::mineweather::objs::obj.lightning_bolt_path temp1 if score ::mineweather::objs::obj.lightning_bolt_path temp0 matches 0..3
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path direction1 = ::mineweather::objs::obj.lightning_bolt_path temp0
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path direction2 = ::mineweather::objs::obj.lightning_bolt_path direction1
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path direction2 += ::mineweather::objs::obj.lightning_bolt_path temp1
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path direction3 = ::mineweather::objs::obj.lightning_bolt_path direction2
scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path direction3 += ::mineweather::objs::obj.lightning_bolt_path temp1

# Set a random direction
scoreboard players set ::in min 0
scoreboard players set ::in max 30
execute store result score ::mineweather::objs::obj.lightning_bolt_path temp1 run function random:rand
execute if score ::mineweather::objs::obj.lightning_bolt_path temp1 matches 0..1 run scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 = ::mineweather::objs::obj.lightning_bolt_path direction1
execute if score ::mineweather::objs::obj.lightning_bolt_path temp1 matches 2..28 run scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 = ::mineweather::objs::obj.lightning_bolt_path direction2
execute if score ::mineweather::objs::obj.lightning_bolt_path temp1 matches 29..30 run scoreboard players operation ::mineweather::objs::obj.lightning_bolt_path temp0 = ::mineweather::objs::obj.lightning_bolt_path direction3

# Set new direction
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_direction = ::mineweather::objs::obj.lightning_bolt_path temp0

# Reconfigure angles
function mineweather:objs/obj.lightning_bolt_path/gen_direction_config
