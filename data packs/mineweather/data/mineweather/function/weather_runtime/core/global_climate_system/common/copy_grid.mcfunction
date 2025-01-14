#
# mineweather:weather_runtime/core/global_climate_system/advect_moisture_temperature_pressure/copy_grid
#

$data modify storage mineweather:volatile weather_runtime.core.global_climate_system.old_$(param_name)_grid set from $(global_climate_system_ref).$(param_name)_grid
