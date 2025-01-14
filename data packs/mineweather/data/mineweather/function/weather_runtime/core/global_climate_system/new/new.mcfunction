#
# mineweather:weather_runtime/core/global_climate_system/new/new
#

# Create object
$data modify $(global_climate_system_ref) set value {\
	base_irradiance: 100,\
	x_size: 0,\
	y_size: 0,\
	climate_area_entity_manager: {},\
	irradiance_grid: {},\
	moisture_grid: {},\
	old_temperature_grid: {},\
	temperature_grid: {},\
	pressure_grid: {},\
	wind_speed_grid: {},\
	wind_x_speed_grid: {},\
	wind_y_speed_grid: {},\
	geopotential_grid: {},\
	precipitations_grid: {}\
}

# Set x size
$execute store result $(global_climate_system_ref).x_size int 1.0 run scoreboard players get ::in x_size

# Set y size
$execute store result $(global_climate_system_ref).y_size int 1.0 run scoreboard players get ::in y_size
