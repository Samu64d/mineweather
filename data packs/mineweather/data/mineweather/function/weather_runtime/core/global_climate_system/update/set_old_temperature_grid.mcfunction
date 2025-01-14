#
# mineweather:weather_runtime/core/global_climate_system/update/set_old_temperature_grid
#

$data modify $(global_climate_system_ref).old_temperature_grid set from $(global_climate_system_ref).temperature_grid
