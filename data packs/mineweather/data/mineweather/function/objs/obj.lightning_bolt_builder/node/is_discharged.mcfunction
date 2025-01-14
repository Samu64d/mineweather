#
# mineweather:server/obj/obj/lightning_subnode/is_discharged
#

scoreboard players operation ::temp foo = @s trigger_time
scoreboard players operation ::temp foo += @s duration

# Time expired
execute store result score ?is_discharged foo if score ::temp foo <= ::time tick

# Wrong trigger time value
execute if score @s trigger_time > ::time tick run scoreboard players set ?is_discharged foo 1
