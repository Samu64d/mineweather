#
# mineweather:objs/obj.lightning_bolt/gen_init_config
#

# Get type specific configuration
scoreboard players operation ::in type = @s mineweather_objs_obj.lightning_bolt_type
function mineweather:objs/obj.lightning_bolt/get_type_config

# Generate direction configuration
function mineweather:objs/obj.lightning_bolt/gen_direction_config

# Main channel size
scoreboard players operation ::in min = ::out size_min
scoreboard players operation ::in max = ::out size_max
execute store result score ::out size run function random:rand_binomial

# Tick duration
scoreboard players operation ::in min = ::out duration_min
scoreboard players operation ::in max = ::out duration_max
execute store result score ::out duration run function random:rand
scoreboard players operation ::out duration += ::mineweather::objs::obj.lightning_bolt::const STRIKE_DELAY

# Fork index
scoreboard players operation ::in min = ::out fork_index_min
scoreboard players operation ::in max = ::out fork_index_max
execute store result score ::out fork_index run function random:rand

# Jagged index
scoreboard players operation ::in min = ::out jagged_index_min
scoreboard players operation ::in max = ::out jagged_index_max
execute store result score ::out jagged_index run function random:rand

# Bead index
scoreboard players operation ::in min = ::out bead_index_min
scoreboard players operation ::in max = ::out bead_index_max
execute store result score ::out bead_index run function random:rand

# Directional angle increments
function mineweather:objs/obj.lightning_bolt/gen_angle_increments
