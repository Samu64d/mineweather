#
# mineweather:server/obj/obj/lightning_subnode/update
#

# Set model
function mineweather:server/obj/obj/lightning_subnode/is_striked
execute if score ?is_striked foo matches 1 run function mineweather:server/obj/obj/lightning_subnode/set_model

# Update rendering
execute if score ::config SHADERS_ENABLED matches 0 run function mineweather:server/obj/obj/lightning_subnode/rendering/apply_light
execute if score ::config SHADERS_ENABLED matches 1 run function mineweather:server/obj/obj/lightning_subnode/rendering/apply_shaders

# Delete after a certain amount of time
function mineweather:server/obj/obj/lightning_subnode/is_discharged
execute if score ?is_discharged foo matches 1 run function mineweather:server/obj/obj/__classes__/obj.lightning_subnode/delete
