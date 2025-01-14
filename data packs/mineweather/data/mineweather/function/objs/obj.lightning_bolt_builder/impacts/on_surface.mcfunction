#
# mineweather:server/obj/obj/lightning_bolt/impacts/on_surface
#

# Summon a real lightning
summon minecraft:lightning_bolt ~ 255 ~

# Sounds
playsound mineweather:weather.lightning_bolt.thunder weather @a ~ ~ ~ 70 1.1 0
playsound mineweather:weather.lightning_bolt.impact weather @a ~ ~ ~ 10 1 0

# Particles
particle minecraft:campfire_signal_smoke ~ ~ ~ 1 5 1.3 2 15 force @a[distance=..100]
particle minecraft:explosion ~ ~ ~ 1 1 1 0.1 1 force @a[distance=..100]

# Damage effects on entities
effect give @e[distance=..1] minecraft:instant_damage 1 100 true
effect give @e[distance=2..5] minecraft:instant_damage 1 50 true
effect give @e[distance=6..10] minecraft:instant_damage 1 10 true
effect give @e[distance=11..15] minecraft:instant_damage 1 1 true

effect give @e[distance=..35] minecraft:night_vision 1 10 true

# Ignite terrain
execute if block ~ ~ ~ #mineweather:predicates/is_air unless block ~ ~-1 ~ #mineweather:predicates/is_air unless block ~ ~-1 ~ minecraft:water run setblock ~ ~ ~ minecraft:fire
