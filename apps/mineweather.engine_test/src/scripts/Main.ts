//
// Main.ts
//

import * as path from "path";
import { app, App } from "electron";

import { Window, WindowConfig } from "./platform/Window";

export default class Main {

	// Window default configuration
	private static readonly mainWindowConfig: WindowConfig = {
		pagePath: "../resources/html/MainWindow.html",
		width: 1000,
		height: 800,
		minWidth: 1200,
		minHeight: 800,
		fullscreenable: true,
		show: false,
		frame: true,
		icon: "../resources/icons/app_128x128.ico"
	};

	// Electron app instance
	public electronApp: App;

	// User window
	private mainWindow: Window;

	private userDataPath: string;

	constructor(app: App) {
		this.electronApp = app;
		this.setSwitches();
		this.setUserDataPath(this.electronApp.getPath("appData") + "\\Mineweather\\Engine");
		this.setWebCacheDataPath(this.electronApp.getPath("appData") + "\\Mineweather\\Engine\\webcache");
		this.registyEventHandlers();
		this.checkForMultipleInstances();
	}

	public createMainWindow(): void {
		let mainWindow: Window = new Window(Main.mainWindowConfig);
		mainWindow.loadWebContents();
		this.mainWindow = mainWindow;
		this.mainWindow.registryEvent("close", this.onWindowsAllClosed.bind(this));
	}

	public getMainWindow(): Window {
		return this.mainWindow;
	}

	private checkForMultipleInstances(): void {
		let isMainInstance: boolean = this.electronApp.requestSingleInstanceLock();
		if (!isMainInstance) {
			this.exit();
		}
	}

	private setSwitches(): void {
		this.setSwitch("disable-application-cache");
		this.setSwitch("disable-local-storage");
		this.setSwitch("force-color-profile", "srgb");
	}

	public getUserDataPath(): string {
		return this.userDataPath;
	}

	public setUserDataPath(pathName: string): void {
		this.userDataPath = pathName;
	}

	public getWebCacheDataPath(): string {
		return this.electronApp.getPath("userData");
	}

	public setWebCacheDataPath(pathName: string): void {
		this.electronApp.setPath("userData", path.resolve(pathName));
	}

	public exit(): void {
		this.electronApp.quit();
	}

	private setSwitch(name: string, value?: any): void {
		this.electronApp.commandLine.appendSwitch(name, value);
	}

	private registyEventHandlers(): void {
		this.electronApp.on("ready", this.onReady.bind(this));
		this.electronApp.on("window-all-closed", this.onWindowsAllClosed.bind(this));
		this.electronApp.on("activate", this.onActivate.bind(this));
		this.electronApp.on("second-instance", () => {
			let mainWindow: Window = this.getMainWindow();
			if (mainWindow) {
				mainWindow.makeVisible();
			}
		});
	}

	private onReady(): void {
		this.createMainWindow();
	}

	private onWindowsAllClosed(): void {
		if (process.platform !== "darwin") {
			this.exit();
		}
	}

	private onActivate(): void {
		if (this.getMainWindow() === null) {
			this.createMainWindow();
		}
	}

}

export const main: Main = new Main(app);

process.env["ELECTRON_DISABLE_SECURITY_WARNINGS"] = "true";
