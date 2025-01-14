// 
// MainRenderer.ts
//

import Engine, { IWeatherParamData } from "./engine/Engine";
import CanvasManager from "./CanvasManager";
import { irradianceSchematic, temperatureSchematic, pressureSchematic, windSpeedSchematic, windDirectionSchematic, moistureSchematic, geopotentialSchematic, precipitationsSchematic } from "./GridDrawerSchematics";
import GridDrawer, { IGridDrawerSchematic } from "./GridDrawer";
import { weatherParam } from "./engine/common/Interfaces";

const WeatherParamToSchematic: Record<weatherParam, IGridDrawerSchematic> = {
	"irradiance": irradianceSchematic,
	"temperature": temperatureSchematic,
	"pressure": pressureSchematic,
	"windSpeed": windSpeedSchematic,
	"windDirection": windDirectionSchematic,
	"moisture": moistureSchematic,
	"geopotential": geopotentialSchematic,
	"precipitations": precipitationsSchematic
}

class MainRenderer {

	// Canvas
	private static readonly CANVAS_WIDTH: number = 256;
	private static readonly CANVAS_HEIGHT: number = 256;
	private readonly canvas: CanvasManager;

	// Grid drawer
	private readonly gridDrawer: GridDrawer;

	// Engine
	private readonly engine: Engine;

	// Selected weather parameter
	private selectedWeatherParam: weatherParam = "temperature";

	// Loop values
	private engineIsPlaying: boolean = false;
	private lastUpdateTime: number = 0;

	// Retrived weather parameter data
	private weatherData: IWeatherParamData;

	constructor() {
		let canvasContainer: HTMLElement = <HTMLCanvasElement>document.getElementById("canvasContainer");
		this.canvas = new CanvasManager(canvasContainer, MainRenderer.CANVAS_WIDTH, MainRenderer.CANVAS_HEIGHT);
		this.gridDrawer = new GridDrawer(this.canvas);
		this.engine = new Engine();
	}

	public playEngine(): void {
		this.engineIsPlaying = true;
	}

	public pauseEngine(): void {
		this.engineIsPlaying = false;
	}

	public init(): void {

		// HTML Element handlers
		this.registyEventHandlers();

		// Init engine
		this.engine.init();

		// Retrive weather data
		this.weatherData = this.engine.getWeatherParamData(this.selectedWeatherParam);

		// Draw weather data
		this.drawCanvas();

		// Start update loop
		this.lastUpdateTime = Date.now();
		window.requestAnimationFrame(this.update.bind(this));
	}

	public update(): void {

		// Timing
		window.requestAnimationFrame(this.update.bind(this));
		let now: number = Date.now();
		let elapsed: number = now - this.lastUpdateTime;

		// Mouse pos
		this.updateMouseTitle();

		// Update engine
		if (elapsed > 100) {
			this.lastUpdateTime = now - (elapsed % 100);

			// Update engine state
			if (this.engineIsPlaying) {
				this.updateDraw();
			}

		}
	}

	public setSelectedWeatherParam(weatherParam: weatherParam): void {
		this.selectedWeatherParam = weatherParam;
		this.weatherData = this.engine.getWeatherParamData(this.selectedWeatherParam);
		this.drawCanvas();
	}

	private registyEventHandlers(): void {

		// Next button
		(<HTMLElement>document.getElementById("nextButton")).addEventListener("click", (e) => {
			this.updateDraw();
		});

		// Play button
		(<HTMLElement>document.getElementById("playButton")).addEventListener("click", (e) => {
			this.playEngine();
		});

		// Pause button
		(<HTMLElement>document.getElementById("pauseButton")).addEventListener("click", (e) => {
			this.pauseEngine();
		});

		// Irradiance button
		(<HTMLElement>document.getElementById("irradianceButton")).addEventListener("click", (e) => {
			this.setSelectedWeatherParam("irradiance");
		});

		// Moisture button
		(<HTMLElement>document.getElementById("moistureButton")).addEventListener("click", (e) => {
			this.setSelectedWeatherParam("moisture");
		});

		// Temperature button
		(<HTMLElement>document.getElementById("temperatureButton")).addEventListener("click", (e) => {
			this.setSelectedWeatherParam("temperature");
		});

		// Pressure button
		(<HTMLElement>document.getElementById("pressureButton")).addEventListener("click", (e) => {
			this.setSelectedWeatherParam("pressure");
		});

		// Wind speed button
		(<HTMLElement>document.getElementById("windSpeedButton")).addEventListener("click", (e) => {
			this.setSelectedWeatherParam("windSpeed");
		});

		// Wind direction button
		(<HTMLElement>document.getElementById("windDirectionButton")).addEventListener("click", (e) => {
			this.setSelectedWeatherParam("windDirection");
		});

		// Geopotential button
		(<HTMLElement>document.getElementById("geopotentialButton")).addEventListener("click", (e) => {
			this.setSelectedWeatherParam("geopotential");
		});

		// Precipitations button
		(<HTMLElement>document.getElementById("precipitationsButton")).addEventListener("click", (e) => {
			this.setSelectedWeatherParam("precipitations");
		});

		// Irradiance range
		(<HTMLElement>document.getElementById("irradianceRange")).addEventListener("input", (e) => {
			let value: string = (<HTMLInputElement>e.target).value;
			this.engine.setBaseIrradiance(parseFloat(value));
			(<HTMLInputElement>e.target).title = value;
			(<HTMLDivElement>document.getElementById("irradianceRangeValue")).innerText = value;
		});

		// Cyclone irradiance range
		(<HTMLElement>document.getElementById("cycloneStrengthRange")).addEventListener("input", (e) => {
			let value: string = (<HTMLInputElement>e.target).value;
			this.engine.setCyclonesStrength(parseFloat(value));
			(<HTMLInputElement>e.target).title = value;
			(<HTMLDivElement>document.getElementById("cycloneStrengthRangeValue")).innerText = value;
		});

		// Anticyclone irradiance range
		(<HTMLElement>document.getElementById("anticycloneStrengthRange")).addEventListener("input", (e) => {
			let value: string = (<HTMLInputElement>e.target).value;
			this.engine.setAnticyclonesStrength(parseFloat(value));
			(<HTMLInputElement>e.target).title = value;
			(<HTMLDivElement>document.getElementById("anticycloneStrengthRangeValue")).innerText = value;
		});
	}

	private updateDraw(): void {

		// Update engine
		this.engine.nextTick();

		// Retrive weather data
		this.weatherData = this.engine.getWeatherParamData(this.selectedWeatherParam);

		// Draw weather data
		this.drawCanvas();

		// Update time count
		(<HTMLCanvasElement>document.getElementById("timeTitle")).innerText = "Time: " + this.engine.getTime();
	}

	private drawCanvas(): void {
		let schematic: IGridDrawerSchematic = WeatherParamToSchematic[this.selectedWeatherParam];
		this.gridDrawer.draw(this.weatherData.data, schematic);
	}

	private updateMouseTitle(): void {
		if (this.weatherData) {
			let x: number = Math.floor(this.canvas.getMousePosition().x);
			let y: number = Math.floor(this.canvas.getMousePosition().y);
			let dataX: number = Math.floor(x * (this.weatherData.data.getWidth() / this.canvas.getWidth()));
			let dataY: number = Math.floor(y * (this.weatherData.data.getHeight() / this.canvas.getHeight()));
			let value: string = this.weatherData.data.getIndexAt(dataX, dataY).toFixed(2);
			(<HTMLDivElement>document.getElementById("canvasPositionCoord")).innerHTML = "x: " + dataX + " y: " + dataY;
			(<HTMLDivElement>document.getElementById("canvasPositionValue")).innerHTML = "value: <b>" + value + "</b>";
		}
	}

}

window.onload = () => {
	renderer = new MainRenderer();
	renderer.init();
}

export let renderer: MainRenderer;
