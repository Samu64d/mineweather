// 
// ClimateAreaEntityManager.ts
//

import Utils from "../utils/Utils";
import { IPos } from "./common/Interfaces";
import ClimateAreaEntity from "./ClimateAreaEntity";
import PermanentClimateAreaEntity, { IPermanentClimateAreaEntityConfig } from "./PermanentClimateAreaEntity";

export default class ClimateAreaEntityManager {

	// Climate area entity list
	private climateAreaEntityList: ClimateAreaEntity[];

	// Cyclone list
	private cycloneList: ClimateAreaEntity[];

	// Anticyclone list
	private anticycloneList: ClimateAreaEntity[];

	constructor() {
		this.climateAreaEntityList = new Array();
		this.cycloneList = new Array();
		this.anticycloneList = new Array();
	}

	public getClimateAreaEntityList(): ClimateAreaEntity[] {
		return this.climateAreaEntityList;
	}

	public getCycloneList(): ClimateAreaEntity[] {
		return this.cycloneList;
	}

	public getAnticycloneList(): ClimateAreaEntity[] {
		return this.anticycloneList;
	}

	public generateCyclone(): ClimateAreaEntity {
		let cyclone: ClimateAreaEntity = this.buildCyclone();
		cyclone.init();
		this.climateAreaEntityList.push(cyclone);
		this.cycloneList.push(cyclone);
		return cyclone;
	}

	public generateAnticyclone(): ClimateAreaEntity {
		let anticyclone: ClimateAreaEntity = this.buildAnticyclone();
		anticyclone.init();
		this.climateAreaEntityList.push(anticyclone);
		this.anticycloneList.push(anticyclone);
		return anticyclone;
	}

	public setCyclonesStrength(strength: number): void {
		let cycloneList: ClimateAreaEntity[] = this.getCycloneList();
		for (let cyclone of cycloneList) {
			cyclone.setStrength(strength);
		}
	}

	public setAnticyclonesStrength(strength: number): void {
		let anticycloneList: ClimateAreaEntity[] = this.getAnticycloneList();
		for (let anticyclone of anticycloneList) {
			anticyclone.setStrength(strength);
		}
	}

	public update(time: number): void {

		// Update the cyclonic and anticyclonic areas
		for (let climateAreaEntity of this.climateAreaEntityList) {
			climateAreaEntity.update(time);
		}
	}

	public getEntitiesIrradianceContributeAt(position: IPos): number {
		let irradianceContribute: number = 0;
		for (let climateAreaEntity of this.climateAreaEntityList) {
			let innerPosition: IPos = this.transformCoordToClimateAreaEntityCoord(climateAreaEntity, position);
			irradianceContribute += climateAreaEntity.getIrradianceContributeAt(innerPosition);
		}
		return irradianceContribute;
	}

	public getEntitiesMoistureContributeAt(position: IPos): number {
		let moistureContribute: number = 0;
		for (let climateAreaEntity of this.climateAreaEntityList) {
			let innerPosition: IPos = this.transformCoordToClimateAreaEntityCoord(climateAreaEntity, position);
			moistureContribute += climateAreaEntity.getMoistureContributeAt(innerPosition);
		}
		return moistureContribute;
	}

	private buildCyclone(): ClimateAreaEntity {

		const config: IPermanentClimateAreaEntityConfig = {
			spawnPos: {
				x: 64,
				y: 32,
			},
			size: {
				x: 128,
				y: 96,
			},
			strength: 1,
			irradianceConfig: {
				range: [0, -40],
				seed: Math.floor(Utils.random(0, 67677)),
				strength: 1,
				zoom: 8
			},
			moistureConfig: {
				range: [-1.0, 1.2],
				seed: Math.floor(Utils.random(0, 67677)),
				strength: 1,
				zoom: 8
			}
		}
		let cyclone: PermanentClimateAreaEntity = new PermanentClimateAreaEntity(config);
		return cyclone;
	}

	private buildAnticyclone(): ClimateAreaEntity {

		const config: IPermanentClimateAreaEntityConfig = {
			spawnPos: {
				x: 64,
				y: 96,
			},
			size: {
				x: 128,
				y: 128,
			},
			strength: 1,
			irradianceConfig: {
				range: [3, 30],
				seed: Math.floor(Utils.random(0, 67677)),
				strength: 1,
				zoom: 8
			},
			moistureConfig: {
				range: [-1.5, 2.0],
				seed: Math.floor(Utils.random(0, 67677)),
				strength: 1,
				zoom: 8
			}
		}
		let anticyclone: PermanentClimateAreaEntity = new PermanentClimateAreaEntity(config);
		return anticyclone;
	}

	private transformCoordToClimateAreaEntityCoord(climateAreaEntity: ClimateAreaEntity, position: IPos): IPos {

		// Coordinates relative to the area position
		let x0: number = position.x - climateAreaEntity.getPosition().x;
		let y0: number = position.y - climateAreaEntity.getPosition().y;

		// Area radius
		let rx: number = Math.floor(climateAreaEntity.getSize().x / 2);
		let ry: number = Math.floor(climateAreaEntity.getSize().y / 2);

		// Sum
		x0 += rx;
		y0 += ry;

		return {
			x: x0,
			y: y0
		}
	}

}
