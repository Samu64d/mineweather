#
# mineweather:weather_runtime/collections/referenced_grid/new/new
#

# Create object
$data modify $(grid_ref) set value {width: 0, height: 0, data: []}

# Set width
$execute store result $(grid_ref).width int 1.0 run scoreboard players get ::in width

# Set height
$execute store result $(grid_ref).height int 1.0 run scoreboard players get ::in height
