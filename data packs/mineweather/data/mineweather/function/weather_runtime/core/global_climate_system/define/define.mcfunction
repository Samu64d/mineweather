#
# mineweather:weather_runtime/core/global_climate_system/define/define
#

# Declare module
#define score_holder ::mineweather::weather_runtime::core::global_climate_system
#define score_holder ::mineweather::weather_runtime::core::global_climate_system::const

# Define variables
scoreboard objectives add x dummy
scoreboard objectives add y dummy

scoreboard objectives add x_size dummy
scoreboard objectives add y_size dummy

scoreboard objectives add half_height dummy
scoreboard objectives add global_motion dummy
scoreboard objectives add advect dummy
scoreboard objectives add fxp_i dummy
scoreboard objectives add fxp_x dummy
scoreboard objectives add fxp_i0 dummy
scoreboard objectives add fxp_i1 dummy
scoreboard objectives add fxp_j dummy
scoreboard objectives add fxp_y dummy
scoreboard objectives add fxp_j0 dummy
scoreboard objectives add fxp_j1 dummy
scoreboard objectives add fxp_s1 dummy
scoreboard objectives add fxp_s0 dummy
scoreboard objectives add fxp_s1 dummy
scoreboard objectives add fxp_t0 dummy
scoreboard objectives add fxp_t1 dummy
scoreboard objectives add fxp_param1 dummy
scoreboard objectives add fxp_param2 dummy
scoreboard objectives add fxp_param3 dummy
scoreboard objectives add fxp_param4 dummy
scoreboard objectives add fxp_param1_contribute dummy
scoreboard objectives add fxp_advected_param dummy
scoreboard objectives add fxp_param3_contribute dummy

scoreboard objectives add fxp_irradiance dummy
scoreboard objectives add fxp_temperature dummy
scoreboard objectives add fxp_old_temperature dummy
scoreboard objectives add fxp_pressure dummy
scoreboard objectives add fxp_moisture dummy
scoreboard objectives add fxp_irradiance_contribute dummy
scoreboard objectives add fxp_factor dummy
scoreboard objectives add fxp_pressure_factor dummy

scoreboard objectives add time dummy
scoreboard objectives add fxp_irradiance_temperature dummy
scoreboard objectives add fxp_temperature_difference dummy

scoreboard objectives add fxp_wind_x_speed dummy
scoreboard objectives add fxp_wind_y_speed dummy
scoreboard objectives add fxp_y_gradient_contribute dummy
scoreboard objectives add fxp_x_gradient_contribute dummy
scoreboard objectives add fxp_wind_x_speed_friction dummy
scoreboard objectives add fxp_wind_y_speed_friction dummy
