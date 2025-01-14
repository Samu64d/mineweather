// 
// GridDrawer.ts
//

import Utils from "./utils/Utils";
import { ValueRange, Color } from "./common/Interfaces";
import Grid from "./common/Grid";
import CanvasManager from "./CanvasManager";
import ColorsUtils from "./utils/ColorsUtils";

export interface IPaletteConfig {
	colorPalette: Color[];
	valueRange: ValueRange;
	interpolate: boolean;
	discretize?: number;
}

export interface IContourLineConfig {
	interval: number;
	increment: number;
	size: number;
	color: Color;
}

export interface IGridDrawerSchematic {
	palette?: IPaletteConfig;
	contourLines?: IContourLineConfig[];
}

export default class GridDrawer {

	// Canvas
	private canvas: CanvasManager;

	constructor(canvas: CanvasManager) {
		this.canvas = canvas;
	}

	public draw(data: Grid, schematic: IGridDrawerSchematic): void {

		// Clear canvas
		this.canvas.clear();

		// Draw palette map
		if (schematic.palette != undefined) {
			for (let x = 0; x < this.canvas.getWidth(); x++) {
				for (let y = 0; y < this.canvas.getHeight(); y++) {
					let value: number = this.getDataForPoint(data, x, y);
					let color: Color = this.getColorFromValue(value, schematic);
					this.canvas.drawPoint(x, y, color);
				}
			}
		}

		// Draw contour line maps
		if (schematic.contourLines != undefined) {
			for (let contourLineConfig of schematic.contourLines) {
				for (let x = 0; x < this.canvas.getWidth(); x++) {
					for (let y = 0; y < this.canvas.getHeight(); y++) {
						let l: IContourLineConfig = contourLineConfig;
						let c: number = Math.trunc(this.getDataForPoint(data, x, y) * 10) / 10;
						let c0: number = this.mod(c, l);
						let c1: number = Math.trunc(this.getDataForPoint(data, x - 1, y) * 10) / 10;
						let c2: number = Math.trunc(this.getDataForPoint(data, x + 1, y) * 10) / 10;
						let c3: number = Math.trunc(this.getDataForPoint(data, x, y - 1) * 10) / 10;
						let c4: number = Math.trunc(this.getDataForPoint(data, x, y + 1) * 10) / 10;
						let c5: number = Math.trunc(this.getDataForPoint(data, x - 1, y - 1) * 10) / 10;
						let c6: number = Math.trunc(this.getDataForPoint(data, x - 1, y + 1) * 10) / 10;
						let c7: number = Math.trunc(this.getDataForPoint(data, x + 1, y - 1) * 10) / 10;
						let c8: number = Math.trunc(this.getDataForPoint(data, x + 1, y + 1) * 10) / 10;
						if ((c > c1 && c0 < this.mod(c1, l)) || (c > c2 && c0 < this.mod(c2, l)) ||
							(c > c3 && c0 < this.mod(c3, l)) || (c > c4 && c0 < this.mod(c4, l)) ||
							(c > c5 && c0 < this.mod(c5, l)) || (c > c6 && c0 < this.mod(c6, l)) ||
							(c > c7 && c0 < this.mod(c7, l)) || (c > c8 && c0 < this.mod(c8, l))) {
							this.canvas.drawCircle(x, y, contourLineConfig.color, contourLineConfig.size);
						}
					}
				}
			}
		}
	}

	private getDataForPoint(data: Grid, x: number, y: number): number {
		let dataX: number = Math.floor(x * (data.getWidth() / this.canvas.getWidth()));
		let dataY: number = Math.floor(y * (data.getHeight() / this.canvas.getHeight()));
		return data.getIndexAt(dataX, dataY);
	}

	private getColorFromValue(value: number, schematic: IGridDrawerSchematic): Color {
		let color: Color = [0, 0, 0];
		let paletteConfig: IPaletteConfig = <IPaletteConfig>schematic.palette;
		if (value != undefined && !isNaN(value)) {
			if (paletteConfig.discretize) {
				value = Utils.discretize(value, paletteConfig.discretize);
			}
			let r0: number = paletteConfig.valueRange[0];
			let r1: number = paletteConfig.valueRange[1];
			let index: number = Math.min(Math.max(Utils.inverseLerp(r0, r1, value), 0), 1);
			index *= paletteConfig.colorPalette.length - 1;
			if (paletteConfig.interpolate == true && index + 1 < paletteConfig.colorPalette.length) {
				let v0: number = Math.floor(index);
				let v1: number = Math.floor(index) + 1;
				let color1: Color = paletteConfig.colorPalette[Math.floor(index)];
				let color2: Color = paletteConfig.colorPalette[Math.floor(index + 1)];
				let t: number = Utils.lerp(v0, v1, index);
				color = ColorsUtils.lerp(color1, color2, t);
			} else {
				color = paletteConfig.colorPalette[Math.trunc(index)];
			}
		}
		return color;
	}

	private mod(c: number, l: IContourLineConfig): number {
		return (((c + l.increment) % l.interval) + l.interval) % l.interval;
	}

}
