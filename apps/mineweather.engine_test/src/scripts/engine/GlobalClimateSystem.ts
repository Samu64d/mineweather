//
// GlobalClimateSystem.ts
//

import Utils from "../utils/Utils";
import Grid from "../common/Grid";
import { ISize, IPointWeatherData } from "./common/Interfaces";
import GridUtils from "./common/GridUtils";
import ClimateAreaEntityManager from "./ClimateAreaEntityManager";

export interface IGlobalClimateSystemConfig {
	size: ISize;
}

export default class GlobalClimateSystem {

	// Constants
	private static readonly R_DRY_AIR: number = 287.05;
	private static readonly GRAVITY: number = 9.81;
	private static readonly BASE_PRESSURE: number = 1025;

	// Base irradiance
	private baseIrradiance: number = 100;

	// Simulation grid size
	private readonly size: ISize;

	// Climate area entity manager
	private readonly climateAreaEntityManager: ClimateAreaEntityManager;

	// Parameter grids
	private readonly irradianceGrid: Grid;
	private readonly moistureGrid: Grid;
	private readonly oldTemperatureGrid: Grid;
	private readonly temperatureGrid: Grid;
	private readonly pressureGrid: Grid;
	private readonly windSpeedXGrid: Grid;
	private readonly windSpeedYGrid: Grid;
	private readonly geopotentialGrid: Grid;
	private readonly precipitationsGrid: Grid;

	constructor(config: IGlobalClimateSystemConfig) {
		this.size = config.size;
		this.climateAreaEntityManager = new ClimateAreaEntityManager();
		this.irradianceGrid = new Grid(this.size.x, this.size.y, 100);
		this.moistureGrid = new Grid(this.size.x, this.size.y, 1.0);
		this.oldTemperatureGrid = new Grid(this.size.x, this.size.y, 15);
		this.temperatureGrid = new Grid(this.size.x, this.size.y, 15);
		this.pressureGrid = new Grid(this.size.x, this.size.y, GlobalClimateSystem.BASE_PRESSURE);
		this.windSpeedXGrid = new Grid(this.size.x, this.size.y, 0);
		this.windSpeedYGrid = new Grid(this.size.x, this.size.y, 0);
		this.geopotentialGrid = new Grid(this.size.x, this.size.y, 0);
		this.precipitationsGrid = new Grid(this.size.x, this.size.y, 0);
	}

	public getSize(): ISize {
		return this.size;
	}

	public getBaseIrradiance(): number {
		return this.baseIrradiance;
	}

	public setBaseIrradiance(irradiance: number): void {
		this.baseIrradiance = irradiance;
	}

	public setCyclonesStrength(strength: number): void {
		this.climateAreaEntityManager.setCyclonesStrength(strength);
	}

	public setAnticyclonesStrength(strength: number): void {
		this.climateAreaEntityManager.setAnticyclonesStrength(strength);
	}

	public init(): void {

		// Generate climate area entities
		this.climateAreaEntityManager.generateCyclone();
		this.climateAreaEntityManager.generateAnticyclone();
	}

	public update(time: number): void {

		// Set old temperature grid
		this.oldTemperatureGrid.copyFrom(this.temperatureGrid);

		// Update climate area entities
		this.climateAreaEntityManager.update(time);

		// Update irradiance and moisture grids
		this.generateOrUpdateIrradianceAndMoisture();

		// Relax temperature
		this.relaxTemperature();

		// Update temperature from irradiance
		this.updateTemperatureFromIrradiance(time);

		// Advect temperature, moisture and pressure based on wind
		this.advectMoistureTemperatureAndPressure();

		// Update pressure
		this.updatePressure();

		// Relax temperature
		this.relaxPressure();
		this.relaxPressure();
		this.relaxPressure();

		// Update wind speed
		this.updateWindSpeed();

		// Update geopotential
		this.updateGeopotential();

		// Update precipitations
		this.updatePrecipitations();
	}

	public getPointWeatherDataAt(x: number, y: number): IPointWeatherData {

		// Irradiance
		let irradiance: number = this.irradianceGrid.getIndexAt(x, y);

		// Moisture
		let moisture: number = this.moistureGrid.getIndexAt(x, y);

		// Temperature
		let temperature: number = this.temperatureGrid.getIndexAt(x, y);

		// Pressure
		let pressure: number = this.pressureGrid.getIndexAt(x, y);

		// Wind speed and direction
		let windSpeed: number = 0;
		let windDirection: number = 0;
		let windSpeedX: number = this.windSpeedXGrid.getIndexAt(x, y);
		let windSpeedY: number = this.windSpeedYGrid.getIndexAt(x, y);
		if (windSpeedX != 0 || windSpeedY != 0) {

			// Calculate wind speed
			windSpeed = Utils.norm(windSpeedX, windSpeedY);

			// Normalize components
			windSpeedX = -windSpeedX / windSpeed;
			windSpeedY = -windSpeedY / windSpeed;

			// Calculate angle
			windDirection = Math.atan2(windSpeedX, windSpeedY);
			windDirection = Utils.mod(windDirection, Math.PI * 2);
		}

		// Geopotential
		let geopotential: number = this.geopotentialGrid.getIndexAt(x, y);

		// Precipitations
		let precipitations: number = this.precipitationsGrid.getIndexAt(x, y);

		return {
			irradiance: irradiance,
			moisture: moisture,
			temperature: temperature,
			pressure: pressure,
			windDirection: windDirection,
			windSpeed: windSpeed,
			geopotential: geopotential,
			precipitations: precipitations,
		};
	}

	private generateOrUpdateIrradianceAndMoisture(): void {
		for (let x = 0; x < this.size.x; x++) {
			for (let y = 0; y < this.size.y; y++) {

				// Irradiance

				// Get data at grid cell
				let irradiance: number = this.irradianceGrid.getIndexAt(x, y);

				// Calculate new value
				let irradianceContribute: number = this.climateAreaEntityManager.getEntitiesIrradianceContributeAt({ x: x, y: y });
				irradiance = (irradiance + this.baseIrradiance + irradianceContribute) / 2;

				// Set data at grid cell
				this.irradianceGrid.setIndexAt(x, y, irradiance);

				// Moisture

				// Get data at grid cell
				let moisture: number = this.moistureGrid.getIndexAt(x, y);

				// Calculate new value
				let moistureContribute: number = this.climateAreaEntityManager.getEntitiesMoistureContributeAt({ x: x, y: y });
				moisture += moistureContribute * 0.3;
				moisture = Math.min(2.0, Math.max(0.01, moisture));

				// Set data at grid cell
				this.moistureGrid.setIndexAt(x, y, moisture);
			}
		}
	}

	private relaxTemperature(): void {

		// Copy temperature grid
		let oldTemperatureGrid: Grid = new Grid(this.size.x, this.size.y, 0);
		oldTemperatureGrid.copyFrom(this.temperatureGrid);

		for (let x = 0; x < this.size.x; x++) {
			for (let y = 0; y < this.size.y; y++) {

				// Get data at grid cells
				let temperature: number = oldTemperatureGrid.getIndexAt(x, y);
				let temperature1: number = oldTemperatureGrid.getIndexAt(x + 1, y);
				let temperature2: number = oldTemperatureGrid.getIndexAt(x - 1, y);
				let temperature3: number = oldTemperatureGrid.getIndexAt(x, y + 1);
				let temperature4: number = oldTemperatureGrid.getIndexAt(x, y - 1);

				// Set data at grid cell
				this.temperatureGrid.setIndexAt(x, y, temperature + 0.3 * (temperature1 + temperature2 + temperature3 + temperature4 - 4 * temperature));
			}
		}
	}

	private updateTemperatureFromIrradiance(time: number): void {

		for (let x = 0; x < this.size.x; x++) {
			for (let y = 0; y < this.size.y; y++) {

				// Get grid cell values
				let irradiance: number = this.irradianceGrid.getIndexAt(x, y);
				let temperature: number = this.temperatureGrid.getIndexAt(x, y);

				// Calculate irradiance temperature
				let irradianceTemperature: number = (irradiance - 100) * 1.3 + 5;
				let temperatureDifference: number = irradianceTemperature - temperature;

				if (time == 1) {
					temperature = irradianceTemperature;
				} else if (temperatureDifference > 1.0) {
					temperature += 1.0;
				} else if (temperatureDifference < -1.0) {
					temperature -= 1.0;
				}

				// Set the value at the grid cell
				this.temperatureGrid.setIndexAt(x, y, temperature);
			}
		}
	}

	private advectMoistureTemperatureAndPressure(): void {

		// Copy moisture grid
		let oldMoistureGrid: Grid = new Grid(this.size.x, this.size.y, 0);
		oldMoistureGrid.copyFrom(this.moistureGrid);

		// Copy temperature grid
		let oldTemperatureGrid: Grid = new Grid(this.size.x, this.size.y, 0);
		oldTemperatureGrid.copyFrom(this.temperatureGrid);

		// Copy pressure grid
		let oldPressureGrid: Grid = new Grid(this.size.x, this.size.y, 0);
		oldPressureGrid.copyFrom(this.pressureGrid);

		for (let x = 0; x < this.size.x; x++) {
			for (let y = 0; y < this.size.y; y++) {

				// Get wind components
				let windSpeedX: number = this.windSpeedXGrid.getIndexAt(x, y);
				let windSpeedY: number = this.windSpeedYGrid.getIndexAt(x, y);

				// Apply global motion
				windSpeedX += y < this.size.x / 2 ? Math.min(30, this.size.x / 2 - y) : -Math.min(30, y - this.size.x / 2);

				// Check for wind speed
				if (windSpeedX != 0 || windSpeedY != 0) {

					// Calculate factors

					// X
					let i: number = x - Utils.clamp(windSpeedX * 0.1, -32, 32);
					let i0: number = Math.floor(i);
					let i1: number = i0 + 1;

					// Y
					let j: number = y - Utils.clamp(windSpeedY * 0.1, -32, 32);
					let j0: number = Math.floor(j);
					let j1: number = j0 + 1;

					// Calculate interpolant factors

					// X
					let s1: number = i - i0;
					let s0: number = 1 - s1;

					// Y
					let t1: number = j - j0;
					let t0: number = 1 - t1;

					// Advect moisture

					// Get data at grid cells
					let moisture1: number = oldMoistureGrid.getIndexAt(i0, j0);
					let moisture2: number = oldMoistureGrid.getIndexAt(i0, j1);
					let moisture3: number = oldMoistureGrid.getIndexAt(i1, j0);
					let moisture4: number = oldMoistureGrid.getIndexAt(i1, j1);

					// Set data at grid cell
					this.moistureGrid.setIndexAt(x, y, s0 * (t0 * moisture1 + t1 * moisture2) +
						s1 * (t0 * moisture3 + t1 * moisture4));

					// Advect temperature

					// Get data at grid cells
					let temperature1: number = oldTemperatureGrid.getIndexAt(i0, j0);
					let temperature2: number = oldTemperatureGrid.getIndexAt(i0, j1);
					let temperature3: number = oldTemperatureGrid.getIndexAt(i1, j0);
					let temperature4: number = oldTemperatureGrid.getIndexAt(i1, j1);

					// Set data at grid cell
					this.temperatureGrid.setIndexAt(x, y, s0 * (t0 * temperature1 + t1 * temperature2) +
						s1 * (t0 * temperature3 + t1 * temperature4));

					// Advect pressure

					// Get data at grid cells
					let pressure1: number = oldPressureGrid.getIndexAt(i0, j0);
					let pressure2: number = oldPressureGrid.getIndexAt(i0, j1);
					let pressure3: number = oldPressureGrid.getIndexAt(i1, j0);
					let pressure4: number = oldPressureGrid.getIndexAt(i1, j1);

					// Set data at grid cell
					this.pressureGrid.setIndexAt(x, y, s0 * (t0 * pressure1 + t1 * pressure2) +
						s1 * (t0 * pressure3 + t1 * pressure4));
				}
			}
		}
	}

	private updatePressure(): void {
		for (let x = 0; x < this.size.x; x++) {
			for (let y = 0; y < this.size.y; y++) {

				// Get data at grid cell
				let irradiance: number = this.irradianceGrid.getIndexAt(x, y);
				let temperature: number = this.temperatureGrid.getIndexAt(x, y);
				let oldTemperatue: number = this.oldTemperatureGrid.getIndexAt(x, y);
				let pressure: number = this.pressureGrid.getIndexAt(x, y);
				let moisture: number = this.moistureGrid.getIndexAt(x, y);

				// Add irradiance contribue
				let irradiancePressure: number = GlobalClimateSystem.BASE_PRESSURE + irradiance / 32;
				let irradiancePressureDifference: number = irradiancePressure - pressure;
				pressure += irradiancePressureDifference * 0.01;

				// Calculate factor
				let temperatureDifference: number = Math.abs(temperature - oldTemperatue);
				if ((temperature < 0 && oldTemperatue > 0) || (temperature > 0 && oldTemperatue < 0)) temperatureDifference *= 2.0;
				let factor: number = temperatureDifference * moisture * 3.0;
				factor = Math.min(10, factor);

				// Check for factor and pressure
				if (factor > pressure * 0.001) {
					pressure -= factor;
				} else if (factor < pressure * 0.001) {
					pressure += factor;
				}

				// Clamp pressure
				pressure = Math.max(880, Math.min(1070, pressure));

				// Set data at grid cell
				this.pressureGrid.setIndexAt(x, y, pressure);
			}
		}
	}

	private relaxPressure(): void {

		// Copy pressure grid
		let oldPressureGrid: Grid = new Grid(this.size.x, this.size.y, 0);
		oldPressureGrid.copyFrom(this.pressureGrid);

		for (let x = 0; x < this.size.x; x++) {
			for (let y = 0; y < this.size.y; y++) {

				// Calculate blur at grid cell
				let pressure: number = GridUtils.calcBlurAt(oldPressureGrid, x, y);

				// Set data at grid cell
				this.pressureGrid.setIndexAt(x, y, pressure);
			}
		}
	}

	private updateWindSpeed(): void {

		for (let x = 0; x < this.size.x; x++) {
			for (let y = 0; y < this.size.y; y++) {

				// Calculate gradient at grid cell
				let [pressureGradientX, pressureGradientY] = GridUtils.calcGradientAt(this.pressureGrid, x, y);

				// Get data at grid cells
				let windSpeedX: number = this.windSpeedXGrid.getIndexAt(x, y);
				let windSpeedY: number = this.windSpeedYGrid.getIndexAt(x, y);

				// Apply pressure gradient
				windSpeedX -= pressureGradientY * 3;
				windSpeedY += pressureGradientX * 3;

				// Apply friction
				windSpeedX -= windSpeedX * 0.1;
				windSpeedY -= windSpeedY * 0.1;

				// Set values at the grid cells
				this.windSpeedXGrid.setIndexAt(x, y, windSpeedX);
				this.windSpeedYGrid.setIndexAt(x, y, windSpeedY);
			}
		}
	}

	private updateGeopotential(): void {
		const R = GlobalClimateSystem.R_DRY_AIR; // J/(kg·K)
		const g = GlobalClimateSystem.GRAVITY; // m/s²
		for (let x = 0; x < this.size.x; x++) {
			for (let y = 0; y < this.size.y; y++) {
				let temperatureC = this.temperatureGrid.getIndexAt(x, y); // °C
				let temperatureK = temperatureC + 273.15; // K
				let pressurePa = this.pressureGrid.getIndexAt(x, y); // Pa

				// Assuming a reference pressure level P0
				const P0 = GlobalClimateSystem.BASE_PRESSURE; // Pa
				let T_mean = temperatureK; // Use local temperature as mean

				// Use hypsometric equation to calculate geopotential height
				let deltaZ = (R * T_mean) / g * Math.log(P0 / pressurePa);

				// Update geopotential height
				this.geopotentialGrid.setIndexAt(x, y, deltaZ);
			}
		}
	}

	private updatePrecipitations(): void {

		for (let x = 0; x < this.size.x; x++) {
			for (let y = 0; y < this.size.y; y++) {

				// Get data at grid cell
				let temperature: number = this.temperatureGrid.getIndexAt(x, y);
				let pressure: number = this.pressureGrid.getIndexAt(x, y);
				let moisture: number = this.moistureGrid.getIndexAt(x, y);

				// Calculate saturation index
				let saturationMoisture: number = 0.18 * ((temperature + 257.3) / 200);

				// Calculate pressure factor
				let pressureFactor: number = 1 - Math.min(1.0, Math.max(0, pressure - 930) / 100);

				let excessMoisture: number = (moisture - saturationMoisture) * pressureFactor;
				let precipitations: number = 0;

				// Check for conditions
				if (excessMoisture > 0) {

					// Calculate precipitaions and moisture
					precipitations = excessMoisture * 128;
					precipitations = precipitations;
					moisture = moisture - excessMoisture;

					// Set data at grid cells
					this.moistureGrid.setIndexAt(x, y, moisture);
				}

				this.precipitationsGrid.setIndexAt(x, y, precipitations);

			}
		}
	}
}
