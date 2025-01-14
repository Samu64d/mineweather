#
# mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/get_old_grid_reference
#

$data modify storage io: grid_ref set value "storage mineweather:volatile weather_runtime.core.global_climate_system.old_$(param_name)_grid"
