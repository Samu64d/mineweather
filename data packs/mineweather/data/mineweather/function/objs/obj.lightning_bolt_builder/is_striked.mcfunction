#
# mineweather:server/obj/obj/lightning_bolt/is_striked
#

scoreboard players operation ::temp foo = ::time tick
scoreboard players operation ::temp foo -= @s trigger_time
execute store result score ?is_striked foo if score ::temp foo = ::global STRIKE_DELAY
