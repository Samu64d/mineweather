// 
// CanvasManager.ts
//

import { Color } from "./common/Interfaces";
import ColorsUtils from "./utils/ColorsUtils";

export interface ICanvasMousePos {
	x: number;
	y: number;
}

export default class CanvasManager {

	// Size
	private readonly width: number;
	private readonly height: number;

	// HTML element and context
	private readonly element: HTMLCanvasElement;
	private readonly context: CanvasRenderingContext2D;

	// Mouse position on screen
	private mousePosition: ICanvasMousePos;

	constructor(containerElement: HTMLElement, width: number, heigth: number) {
		this.width = width;
		this.height = heigth;
		this.element = document.createElement("canvas");
		this.element.width = width;
		this.element.height = heigth;
		this.element.className = "canvas";
		this.element.addEventListener("mousemove", (e) => {
			this.trackMousePosition(e);
		});
		containerElement.appendChild(this.element);
		this.context = <CanvasRenderingContext2D>this.element.getContext("2d");
		this.mousePosition = {
			x: 0,
			y: 0
		}
	}

	public getWidth(): number {
		return this.width;
	}

	public getHeight(): number {
		return this.height;
	}

	public getMousePosition(): ICanvasMousePos {
		return {
			x: this.mousePosition.x,
			y: this.mousePosition.y
		};
	}

	public setImageSmoothing(imageSmoothing: boolean): void {
		this.context.imageSmoothingEnabled = imageSmoothing;
	}

	public clear(): void {
		this.context.beginPath();
		this.context.clearRect(0, 0, this.element.width, this.element.height);
		this.context.closePath();
	}

	public clearColor(color: Color): void {
		this.context.beginPath();
		this.context.fillStyle = ColorsUtils.toString(color);
		this.context.fillRect(0, 0, this.element.width, this.element.height);
		this.context.closePath();
	}

	public drawPoint(x: number, y: number, color: Color): void {
		this.context.beginPath();
		this.context.fillStyle = ColorsUtils.toString(color);
		this.context.fillRect(x, y, 1, 1);
		this.context.closePath();
	}

	public drawCircle(x: number, y: number, color: Color, size = 1): void {
		this.context.beginPath();
		this.context.fillStyle = ColorsUtils.toString(color);
		this.context.arc(x, y, size, 0, 2 * Math.PI);
		this.context.fill();
		this.context.closePath();
	}

	private trackMousePosition(event: MouseEvent): void {
		let rect: DOMRect = this.element.getBoundingClientRect();
		this.mousePosition.x = (event.clientX - rect.left) * this.width / rect.width;
		this.mousePosition.y = (event.clientY - rect.top) * this.height / rect.height;
	}

}
