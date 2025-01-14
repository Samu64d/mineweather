#
# mineweather:objs/obj.lightning_bolt_path/on_impact
#

# Impact flag
scoreboard players operation @s mineweather_objs_obj.lightning_bolt_path_impact = ::const TRUE

# Get object dimension
function obj:objs/obj.obj/get_dimension

# Get impact position
function minecraft_world_api:block_pos/to_vector3d

# Save data
data modify storage mineweather:volatile objlightning_bolt_path.impact_dimension set from storage io: dimension
data modify storage mineweather:volatile objlightning_bolt_path.impact_position set from storage io: vector

# Sound effects

# Create thunder sound
data modify storage io: class_name set value "soundsystem:3dsound"
data modify storage io: dimension set from storage mineweather:volatile objlightning_bolt_path.impact_dimension
data modify storage io: position set from storage mineweather:volatile objlightning_bolt_path.impact_position
data modify storage io: sound_id set value "mineweather:weather.lightning_bolt.thunder"
data modify storage io: base_volume set value 1.0d
data modify storage io: volume_attenuation set value 512.0d
data modify storage io: speed set value 64.0d
data modify storage io: auto_deletable set value true
function obj:new

# Reproduce thunder sound
data modify storage io: method set value "reproduce"
function obj:bind

# Create impact sound
data modify storage io: class_name set value "soundsystem:3dsound"
data modify storage io: dimension set from storage mineweather:volatile objlightning_bolt_path.impact_dimension
data modify storage io: position set from storage mineweather:volatile objlightning_bolt_path.impact_position
data modify storage io: sound_id set value "mineweather:weather.lightning_bolt.impact"
data modify storage io: base_volume set value 1.0d
data modify storage io: volume_attenuation set value 128.0d
data modify storage io: speed set value 0.0d
data modify storage io: auto_deletable set value true
function obj:new

# Reproduce impact sound
data modify storage io: method set value "reproduce"
function obj:bind

# Sky effects

# Create a real lighting bolt
data modify storage io: dimension set from storage mineweather:volatile objlightning_bolt_path.impact_dimension
data modify storage io: vector set from storage mineweather:volatile objlightning_bolt_path.impact_position
data modify storage io: y set value 19999999d
function nmath:vector3d/set_y
data modify storage io: position set from storage io: vector
data modify storage io: type set value "minecraft:lightning_bolt"
data modify storage io: callback set value "null:null"
function mineweather:objs/obj.lightning_bolt_path/on_impact/generate_real_lightning_bolt with storage io:

# Player effects

# Handle players
data modify storage io: dimension set from storage mineweather:volatile objlightning_bolt_path.impact_dimension
data modify storage io: position set from storage mineweather:volatile objlightning_bolt_path.impact_position
data modify storage io: x set value 5d
data modify storage io: y set value 5d
data modify storage io: z set value 5d
function nmath:vector3d/new_from_values
data modify storage io: box set from storage io: vector
data modify storage io: callback set value "mineweather:objs/obj.lightning_bolt_path/on_impact/handle_entity"
function server:selector_entity_list/select_in_area
