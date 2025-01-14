// 
// Interfaces.ts
//

export type Range = [number, number];

export interface IPos {
    x: number;
    y: number;
}

export interface ISize {
    x: number;
    y: number;
}

export type weatherParam = "irradiance" | "moisture" | "temperature" | "pressure" | "windSpeed" | "windDirection" | "geopotential" | "precipitations";

export interface IPointWeatherData extends Record<weatherParam, number> {
	irradiance: number;
	moisture: number;
	temperature: number;
	pressure: number;
	windSpeed: number;
	windDirection: number;
	geopotential: number;
    precipitations: number;
}
