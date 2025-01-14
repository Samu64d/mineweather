#
# mineweather:objs/obj.lightning_bolt/update
#
# Update a lightning bolt
#> Context
#  @executor (in): the lightning bolt
#> Return void

# Impact effects
function mineweather:server/obj/obj/lightning_bolt/is_striked
execute if score ?is_striked foo matches 1 run function mineweather:server/obj/obj/lightning_bolt/on_impact

# Delete after a certain amount of time
function mineweather:server/obj/obj/lightning_bolt/is_discharged
execute if score ?is_discharged foo matches 1 run function mineweather:server/obj/obj/__classes__/obj.lightning_bolt/delete
