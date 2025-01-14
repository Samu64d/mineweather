// 
// PermanentClimateAreaEntity.ts
//

import Utils from "../utils/Utils";
import PerlinNoise from "../utils/PerlinNoise";
import Grid from "../common/Grid";
import { IPos, Range } from "./common/Interfaces"
import ClimateAreaEntity, { IClimateAreaEntityConfig } from "./ClimateAreaEntity";

export interface IParamConfig {
	seed: number;
    range: Range;
	strength: number;
    zoom: number;
}

export interface IPermanentClimateAreaEntityConfig extends IClimateAreaEntityConfig {
    irradianceConfig: IParamConfig;
	moistureConfig: IParamConfig;
}

export default class PermanentClimateAreaEntity extends ClimateAreaEntity {

	// Irradiance configuration
    private readonly irradianceConfig: IParamConfig;
    private readonly irradianceGrid: Grid;
    private readonly irradianceMapNoises: PerlinNoise;

	// Moisture configuration
    private readonly moistureConfig: IParamConfig;
    private readonly moistureGrid: Grid;
    private readonly moistureMapNoises: PerlinNoise;

    constructor(config: IPermanentClimateAreaEntityConfig) {
        let { spawnPos, size, strength }: IClimateAreaEntityConfig = config;
        super({ spawnPos, size, strength });
        this.irradianceConfig = config.irradianceConfig;
        this.irradianceMapNoises = new PerlinNoise(config.irradianceConfig.seed);
		this.irradianceGrid = new Grid(this.size.x, this.size.y, 0);
		this.moistureConfig = config.moistureConfig;
        this.moistureMapNoises = new PerlinNoise(config.moistureConfig.seed);
		this.moistureGrid = new Grid(this.size.x, this.size.y, 0);
    }

    public init(): void {
		this.generateOrUpdateParamGrid(0, this.irradianceConfig, this.irradianceGrid, this.irradianceMapNoises);
		this.generateOrUpdateParamGrid(0, this.moistureConfig, this.moistureGrid, this.moistureMapNoises);
    }

    public update(time: number): void {
        this.generateOrUpdateParamGrid(time, this.irradianceConfig, this.irradianceGrid, this.irradianceMapNoises);
		this.generateOrUpdateParamGrid(time, this.moistureConfig, this.moistureGrid, this.moistureMapNoises);
    }

	public getIrradianceContributeAt(pos: IPos): number {
		if (pos.x < 0 || pos.x >= this.size.x || pos.y < 0 || pos.y >= this.size.y) return 0
		return this.irradianceGrid.getIndexAt(pos.x, pos.y);
	}

	public getMoistureContributeAt(pos: IPos): number {
		if (pos.x < 0 || pos.x >= this.size.x || pos.y < 0 || pos.y >= this.size.y) return 0
		return this.moistureGrid.getIndexAt(pos.x, pos.y);
	}

    private generateOrUpdateParamGrid(time: number, paramConfig: IParamConfig, grid: Grid, mapNoises: PerlinNoise): void {
        for (let x = 0; x < this.size.x; x++) {
            for (let y = 0; y < this.size.y; y++) {

                // Base noise value
                let noiseValue: number = mapNoises.getNoiseValueAt(x, y, time, paramConfig.zoom);

                // Get distance from center
                let d: number = Utils.pointGradientCenterLerp(x, y, this.size.x, this.size.y);

                // Apply gradient
				let lerpedNoiseValue: number = Utils.lerp(paramConfig.range[0], paramConfig.range[1], noiseValue);
			    let contribute: number = lerpedNoiseValue * d * paramConfig.strength * this.strength;

				// Set data
				grid.setIndexAt(x, y, contribute);
            }
        }
    }

}
