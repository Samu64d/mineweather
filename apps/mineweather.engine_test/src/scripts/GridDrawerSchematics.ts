// 
// GridDrawerSchematics.ts
//

import { Color } from "./common/Interfaces";
import { IGridDrawerSchematic } from "./GridDrawer";

const rainbowPalette: Color[] = [[221, 221, 221], [176, 176, 176], [137, 98, 141], [91, 65, 94], [58, 6, 62],
[87, 13, 93], [156, 30, 164], [117, 29, 124], [87, 13, 62], [49, 51, 99], [18, 50, 147], [0, 0, 196], [0, 0, 245],
[34, 84, 245], [67, 151, 247], [103, 201, 250], [146, 252, 253], [146, 252, 163], [146, 252, 122], [102, 255, 0],
[191, 250, 14], [255, 255, 9], [255, 255, 134], [253, 232, 81], [255, 204, 0], [255, 153, 0], [255, 102, 0],
[255, 51, 51], [255, 51, 0], [255, 0, 0], [204, 0, 0], [153, 0, 0], [108, 0, 0], [79, 0, 0], [0, 0, 0]];

const whiteBlueGreenRedPalette: Color[] = [[255, 255, 255], [151, 230, 255], [51, 204, 255], [0, 153, 255], [0, 255, 153],
[51, 204, 102], [102, 204, 51], [102, 255, 0], [164, 242, 47], [183, 207, 14], [214, 240, 23], [204, 153, 0],
[255, 53, 0], [255, 53, 102], [204, 153, 153], [204, 102, 51], [204, 51, 51], [255, 13, 13], [198, 0, 0], [128, 0, 0],
[96, 0, 0], [64, 0, 0], [64, 0, 64]];

export const irradianceSchematic: IGridDrawerSchematic = {
	palette: {
		colorPalette: [[255, 255, 255], [255, 216, 0]],
		valueRange: [80, 120],
		interpolate: true,
		discretize: 1
	}
};

export const moistureSchematic: IGridDrawerSchematic = {
	palette: {
		colorPalette: [[255, 255, 255], [0, 21, 255]],
		valueRange: [0, 5],
		interpolate: true
	}
};

export const temperatureSchematic: IGridDrawerSchematic = {
	palette: {
		colorPalette: rainbowPalette,
		valueRange: [-34, 36],
		interpolate: false,
		discretize: 2
	},
	contourLines: [{
		interval: 20,
		increment: 0,
		color: [0, 0, 0],
		size: 1
	}]
};

export const pressureSchematic: IGridDrawerSchematic = {
	palette: {
		colorPalette: rainbowPalette,
		valueRange: [970, 1050],
		interpolate: false,
		discretize: 2
	},
	contourLines: [
		{
			interval: 5,
			increment: 0,
			color: [255, 255, 255],
			size: 0.5
		},
		{
			interval: 10,
			increment: 0,
			color: [255, 255, 255],
			size: 0.75
		}
	]
};

export const windSpeedSchematic: IGridDrawerSchematic = {
	palette: {
		colorPalette: whiteBlueGreenRedPalette,
		valueRange: [0, 130],
		interpolate: false,
		discretize: 2
	}
};

export const windDirectionSchematic: IGridDrawerSchematic = {
	palette: {
		colorPalette: [[0, 0, 0], [255, 255, 255]],
		valueRange: [0, 6.28],
		interpolate: true,
		discretize: 0.01
	}
};

export const geopotentialSchematic: IGridDrawerSchematic = {
	palette: {
		colorPalette: rainbowPalette,
		valueRange: [493, 600],
		interpolate: false,
		discretize: 1
	}
};

export const precipitationsSchematic: IGridDrawerSchematic = {
	palette: {
		colorPalette: whiteBlueGreenRedPalette,
		valueRange: [0, 30],
		interpolate: false,
		discretize: 1
	}
};
