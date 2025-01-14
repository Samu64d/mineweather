#
# mineweather:server/obj/obj/lightning_bolt/on_impact
#

# Air
execute if score @s impact matches 1 run function mineweather:server/obj/obj/lightning_bolt/impacts/on_air

# Surface
execute if score @s impact matches 1 run function mineweather:server/obj/obj/lightning_bolt/impacts/on_surface
