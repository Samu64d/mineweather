#
# mineweather:server/obj/obj/lightning_bolt/impacts/on_air
#

# Summon a real lightning
summon minecraft:lightning_bolt ~ 255 ~

# Sounds
execute if score @s deep matches 0 run playsound mineweather:weather.lightning_bolt.distant_thunder weather @a ~ ~ ~ 70 1.1 0

# Damage effects on entities
effect give @e[distance=..1] minecraft:instant_damage 1 255 true
effect give @e[distance=2..5] minecraft:instant_damage 1 1 true
