//
// Window.ts
//

import * as path from "path";
import { BrowserWindow, BrowserWindowConstructorOptions } from "electron";

export interface WindowConfig {
	pagePath: string;
	width: number,
	height: number,
	minWidth: number,
	minHeight: number,
	fullscreenable: boolean,
	show: boolean,
	frame: boolean,
	icon: string,
}

export class Window {

	// The window instance
	protected readonly window: BrowserWindow;

	// The navigate page path
	protected readonly navigatePath: string;

	constructor(config: WindowConfig) {
		let electronWindowConfig: BrowserWindowConstructorOptions = { ...config };
		electronWindowConfig.webPreferences = {
			devTools: true,
			experimentalFeatures: true,
		};
		this.navigatePath = config.pagePath;
		this.window = new BrowserWindow(electronWindowConfig);
		this.window.center();
		this.registyEventHandlers();
	}

	public getTitle(): string {
		return this.window.getTitle();
	}

	public setTitle(title: string): void {
		this.window.setTitle(title);
	}

	public getWidth(): number {
		return this.window.getSize()[0];
	}

	public setWidth(width: number): void {
		this.window.setSize(width, this.getHeight());
	}

	public getHeight(): number {
		return this.window.getSize()[1];
	}

	public setHeight(height: number): void {
		this.window.setSize(this.getWidth(), height);
	}

	public getMinWidth(): number {
		return this.window.getMinimumSize()[0];
	}

	public setMinWidth(width: number): void {
		this.window.setMinimumSize(width, this.getMinHeight());
	}

	public getMinHeight(): number {
		return this.window.getMinimumSize()[1];
	}

	public setMinHeight(height: number): void {
		this.window.setMinimumSize(this.getMinWidth(), height);
	}

	public getXPos(): number {
		return this.window.getPosition()[0];
	}

	public setXPos(x: number): void {
		this.window.setPosition(x, this.getYPos());
	}

	public getYPos(): number {
		return this.window.getPosition()[0];
	}

	public setYPos(y: number): void {
		this.window.setPosition(this.getXPos(), y);
	}

	public getOpacity(): number {
		return this.window.getOpacity();
	}

	public setOpacity(opacity: number): void {
		this.window.setOpacity(opacity);
	}

	public isFullScrenable(): boolean {
		return this.window.isFullScreenable();
	}

	public setFullScrenable(fullScreenable: boolean): void {
		this.window.setFullScreenable(fullScreenable);
	}

	public isMinimizable(): boolean {
		return this.window.isMinimizable();
	}

	public setMinimizable(minimizable: boolean): void {
		this.window.setMinimizable(minimizable);
	}

	public isMaximizable(): boolean {
		return this.window.isMaximizable();
	}

	public setMaximizable(maximizable: boolean): void {
		this.window.setMaximizable(maximizable);
	}

	public minimize(): void {
		this.window.minimize();
	}

	public maximize(): void {
		this.window.maximize();
	}

	public restore(): void {
		this.window.restore();
	}

	public minimizeOrRestore(): boolean {
		if (!this.window.isMinimized()) {
			this.minimize();
			return true;
		} else {
			this.restore();
			return false;
		}
	}

	public maximizeOrRestore(): boolean {
		if (!this.window.isMaximized()) {
			this.maximize();
			return true;
		} else {
			this.restore();
			return false;
		}
	}

	public close(): void {
		this.window.close();
	}

	public makeVisible(): void {
		this.window.unmaximize();
		this.window.show();
		this.window.focus();
	}

	public loadWebContents(): void {
		this.window.loadFile(path.join(__dirname, this.navigatePath));
	}

	public registryEvent(event: string, callback: Function): void {
		this.window.on(<any>event, callback);
	}

	private registyEventHandlers(): void {
		this.window.webContents.on("did-finish-load", () => {
			this.window.setMenu(null);
			this.window.show();
			this.window.webContents.openDevTools();
		});
	}

}
