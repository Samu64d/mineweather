// 
// Grid.ts
//

import Utils from "../utils/Utils";

export default class Grid {

	// Grid size
	private readonly width: number;
	private readonly height: number;

	// Grid data
	public readonly data: number[];

	constructor(width: number, height: number, baseValue: number) {
		this.width = width;
		this.height = height;
		this.data = new Array(this.width * this.height);
		this.fill(baseValue);
	}

	public getWidth(): number {
		return this.width;
	}

	public getHeight(): number {
		return this.height;
	}

	public fill(value: number): void {
		this.data.fill(value);
	}

	public copyFrom(grid: Grid): void {
		for (let x = 0; x < this.width; x++) {
			for (let y = 0; y < this.height; y++) {
				this.setIndexAt(x, y, grid.getIndexAt(x, y));
			}
		}
	}

	public setIndexAt(x: number, y: number, value: number): void {
		let index: number = this.calculateIndex(x, y);
		this.data[index] = value;
	}

	public getIndexAt(x: number, y: number): number {
		let index: number = this.calculateIndex(x, y);
		return this.data[index];
	}

	private calculateIndex(x: number, y: number): number {
		if (x < 0 || x >= this.width) x = Utils.mod(x, this.width);
		if (y < 0 || y >= this.height) y = Utils.mod(y, this.height);
		return x * this.height + y;
	}

}
