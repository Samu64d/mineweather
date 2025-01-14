#
# mineweather:client/visual_handler/reproduce_sounds
#

# Get player position
function minecraft_entity_api:entity/get_position

# Rain
data modify storage io: sound_id set value "mineweather:weather.precipitation.rain"
data modify storage io: channel set value "weather"
execute store result storage io: volume double 0.0016 run scoreboard players get ::mineweather::client rain_count
data modify storage io: pitch set value 1.0
data modify storage io: minimum_volume set value 0.0
function soundsystem:api/play

# Snow
data modify storage io: sound_id set value "mineweather:weather.precipitation.snow"
data modify storage io: channel set value "weather"
execute store result storage io: volume double 0.0016 run scoreboard players get ::mineweather::client snow_count
data modify storage io: pitch set value 1.0
data modify storage io: minimum_volume set value 0.0
function soundsystem:api/play

# Hail
data modify storage io: sound_id set value "mineweather:weather.precipitation.hail"
data modify storage io: channel set value "weather"
execute store result storage io: volume double 0.0016 run scoreboard players get ::mineweather::client hail_count
data modify storage io: pitch set value 1.0
data modify storage io: minimum_volume set value 0.0
function soundsystem:api/play

# Wind
data modify storage io: sound_id set value "mineweather:weather.wind"
data modify storage io: channel set value "weather"
execute store result storage io: volume double 0.01 run scoreboard players get ::mineweather::client wind_count
data modify storage io: pitch set value 1.0
data modify storage io: minimum_volume set value 0.0
function soundsystem:api/play
