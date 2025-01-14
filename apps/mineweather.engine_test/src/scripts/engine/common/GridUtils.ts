//
// GridUtils.ts
//

import Grid from "../../common/Grid";

export default class GridUtils {

	public static calcGradientAt(grid: Grid, x: number, y: number): [number, number] {

		// Get values at adjacent grid cells
		let value1: number = grid.getIndexAt(x, y + 1);
		let value2: number = grid.getIndexAt(x - 1, y);
		let value3: number = grid.getIndexAt(x, y - 1);
		let value4: number = grid.getIndexAt(x + 1, y);

		// Calculate horizontal gradient
		let gradientX: number = (value4 - value2) / 2;

	    // Calculate vertical gradient
		let gradientY: number = (value1 - value3) / 2;

		return [gradientX, gradientY];
	}

	public static calcBlurAt(grid: Grid, x: number, y: number): number {

		// Get value at grid cell
		let value: number = grid.getIndexAt(x, y);

		// Get values at adjacent grid cells
		let value1: number = grid.getIndexAt(x, y + 1);
		let value2: number = grid.getIndexAt(x - 1, y + 1);
		let value3: number = grid.getIndexAt(x - 1, y);
		let value4: number = grid.getIndexAt(x - 1, y - 1);
		let value5: number = grid.getIndexAt(x, y - 1);
		let value6: number = grid.getIndexAt(x + 1, y - 1);
		let value7: number = grid.getIndexAt(x + 1, y);
		let value8: number = grid.getIndexAt(x + 1, y + 1);

		value = (
			value * 1 / 4
			+ value1 * 1 / 16
			+ value2 * 1 / 8
			+ value3 * 1 / 8
			+ value4 * 1 / 16
			+ value5 * 1 / 8
			+ value6 * 1 / 16
			+ value7 * 1 / 8
			+ value8 * 1 / 16
		);

		return value;
	}

}
