#
# mineweather:server/obj/obj/lightning_subnode/lightning_subnode
#

# Owner instance id
scoreboard players operation @s owner_uuid = ?uuid foo

# Length
scoreboard players operation @s length = ?subnode_length foo

# Size
scoreboard players operation @s size = ?subnode_size foo

# Duration
scoreboard players operation @s duration = ?duration foo

# Trigger time
scoreboard players operation @s trigger_time = ::time tick

# Set arm rotation
scoreboard players operation ::temp foo = ?r_x foo
scoreboard players add ::temp foo 180
scoreboard players operation ::temp foo %= ::int 360
execute store result entity @s Pose.RightArm[0] float 1 run scoreboard players get ::temp foo

# Set body rotation
scoreboard players operation ::temp foo = ?r_z foo
scoreboard players add ::temp foo 270
scoreboard players operation ::temp foo %= ::int 360
execute store result entity @s Rotation[0] float 1 run scoreboard players get ::temp foo

# Detect impact
execute if score ?pos_y foo matches 0..25500 run function mineweather:server/obj/obj/lightning_subnode/detect_impact
