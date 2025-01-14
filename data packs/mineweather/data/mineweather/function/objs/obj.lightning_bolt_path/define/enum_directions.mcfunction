#
# mineweather:objs/obj.lightning_bolt_path/define/enum_directions
#

#define score_holder ::mineweather::objs::obj.lightning_bolt_path::enum_directions

scoreboard objectives add DOWNWARD dummy
scoreboard objectives add OBLIQUE_DOWN dummy
scoreboard objectives add HORIZONTAL dummy
scoreboard objectives add OBLIQUE_UP dummy
scoreboard objectives add UPWARD dummy

scoreboard players set ::mineweather::objs::obj.lightning_bolt_path::enum_directions DOWNWARD 0
scoreboard players set ::mineweather::objs::obj.lightning_bolt_path::enum_directions OBLIQUE_DOWN 1
scoreboard players set ::mineweather::objs::obj.lightning_bolt_path::enum_directions HORIZONTAL 2
scoreboard players set ::mineweather::objs::obj.lightning_bolt_path::enum_directions OBLIQUE_UP 3
scoreboard players set ::mineweather::objs::obj.lightning_bolt_path::enum_directions UPWARD 4
