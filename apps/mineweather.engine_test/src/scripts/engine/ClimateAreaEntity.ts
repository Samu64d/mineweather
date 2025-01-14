// 
// ClimateAreaEntity.ts
//

import { IPos, ISize } from "./common/Interfaces";

export interface IClimateAreaEntityConfig {
    spawnPos: IPos;
    size: ISize;
	strength: number;
}

export default abstract class ClimateAreaEntity {

    protected position: IPos;
    protected readonly size: ISize;
	protected strength: number;

    constructor(config: IClimateAreaEntityConfig) {
        this.position = config.spawnPos;
		this.size = config.size;
		this.strength = config.strength;
    }

	public getPosition(): IPos {
        return this.position;
    }

	public setPosition(position: IPos): void {
		this.position = position;
	}

    public getSize(): ISize {
        return this.size;
    }

	public getStrength(): number {
		return this.strength;
	}

	public setStrength(strength: number): void {
		this.strength = strength;
	}

    public abstract init(): void;

    public abstract update(time: number): void;

	public abstract getIrradianceContributeAt(position: IPos): number;

	public abstract getMoistureContributeAt(position: IPos): number;

}
