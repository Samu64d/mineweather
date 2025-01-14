// 
// Engine.ts
//

import Utils from "../utils/Utils";
import Grid from "../common/Grid";
import { weatherParam, IPointWeatherData } from "./common/Interfaces";
import GlobalClimateSystem from "./GlobalClimateSystem";

export interface IWeatherParamData {
	paramName: weatherParam;
	time: number;
	data: Grid;
}

export default class Engine {

	// Grid size
	public static readonly GRID_SIZE_X: number = 128;
	public static readonly GRID_SIZE_Y: number = 128;

	// Global climare system
	private globalClimate: GlobalClimateSystem;

	// Time counter
	private time: number = -1;

	constructor() {
		this.globalClimate = new GlobalClimateSystem({size: { x: Engine.GRID_SIZE_X, y: Engine.GRID_SIZE_Y }});
	}

	public init(): void {
		this.time = 0;
		this.globalClimate.init();
	}

	public nextTick(): void {
		if (this.time == -1) return;
		this.time++;
		this.globalClimate.update(this.time);
	}

	public getTime(): number {
		return this.time;
	}

	public setBaseIrradiance(irradiance: number): void {
		this.globalClimate.setBaseIrradiance(irradiance);
	}

	public setCyclonesStrength(strength: number): void {
		this.globalClimate.setCyclonesStrength(strength);
	}

	public setAnticyclonesStrength(strength: number): void {
		this.globalClimate.setAnticyclonesStrength(strength);
	}

	public getWeatherParamData(paramName: weatherParam): IWeatherParamData {

		let grid: Grid = new Grid(this.globalClimate.getSize().x, this.globalClimate.getSize().y, 0);

		for (let x = 0; x < Engine.GRID_SIZE_X; x++) {
			for (let y = 0; y < Engine.GRID_SIZE_Y; y++) {
				let data: IPointWeatherData = this.globalClimate.getPointWeatherDataAt(x, y);
				let value: number = data[paramName];
				grid.setIndexAt(x, y, value);
			}
		}

		return {
			paramName: paramName,
			time: this.time,
			data: grid
		}
	}

}
