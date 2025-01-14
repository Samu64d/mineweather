/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./scripts/Main.ts":
/*!*************************!*\
  !*** ./scripts/Main.ts ***!
  \*************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (/* binding */ Main),\n/* harmony export */   main: () => (/* binding */ main)\n/* harmony export */ });\n/* harmony import */ var path__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! path */ \"path\");\n/* harmony import */ var path__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(path__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var electron__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! electron */ \"electron\");\n/* harmony import */ var electron__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(electron__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _platform_Window__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./platform/Window */ \"./scripts/platform/Window.ts\");\n//\n// Main.ts\n//\n\n\n\nclass Main {\n    // Window default configuration\n    static mainWindowConfig = {\n        pagePath: \"../resources/html/MainWindow.html\",\n        width: 1000,\n        height: 800,\n        minWidth: 1200,\n        minHeight: 800,\n        fullscreenable: true,\n        show: false,\n        frame: true,\n        icon: \"../resources/icons/app_128x128.ico\"\n    };\n    // Electron app instance\n    electronApp;\n    // User window\n    mainWindow;\n    userDataPath;\n    constructor(app) {\n        this.electronApp = app;\n        this.setSwitches();\n        this.setUserDataPath(this.electronApp.getPath(\"appData\") + \"\\\\Mineweather\\\\Engine\");\n        this.setWebCacheDataPath(this.electronApp.getPath(\"appData\") + \"\\\\Mineweather\\\\Engine\\\\webcache\");\n        this.registyEventHandlers();\n        this.checkForMultipleInstances();\n    }\n    createMainWindow() {\n        let mainWindow = new _platform_Window__WEBPACK_IMPORTED_MODULE_2__.Window(Main.mainWindowConfig);\n        mainWindow.loadWebContents();\n        this.mainWindow = mainWindow;\n        this.mainWindow.registryEvent(\"close\", this.onWindowsAllClosed.bind(this));\n    }\n    getMainWindow() {\n        return this.mainWindow;\n    }\n    checkForMultipleInstances() {\n        let isMainInstance = this.electronApp.requestSingleInstanceLock();\n        if (!isMainInstance) {\n            this.exit();\n        }\n    }\n    setSwitches() {\n        this.setSwitch(\"disable-application-cache\");\n        this.setSwitch(\"disable-local-storage\");\n        this.setSwitch(\"force-color-profile\", \"srgb\");\n    }\n    getUserDataPath() {\n        return this.userDataPath;\n    }\n    setUserDataPath(pathName) {\n        this.userDataPath = pathName;\n    }\n    getWebCacheDataPath() {\n        return this.electronApp.getPath(\"userData\");\n    }\n    setWebCacheDataPath(pathName) {\n        this.electronApp.setPath(\"userData\", path__WEBPACK_IMPORTED_MODULE_0__.resolve(pathName));\n    }\n    exit() {\n        this.electronApp.quit();\n    }\n    setSwitch(name, value) {\n        this.electronApp.commandLine.appendSwitch(name, value);\n    }\n    registyEventHandlers() {\n        this.electronApp.on(\"ready\", this.onReady.bind(this));\n        this.electronApp.on(\"window-all-closed\", this.onWindowsAllClosed.bind(this));\n        this.electronApp.on(\"activate\", this.onActivate.bind(this));\n        this.electronApp.on(\"second-instance\", () => {\n            let mainWindow = this.getMainWindow();\n            if (mainWindow) {\n                mainWindow.makeVisible();\n            }\n        });\n    }\n    onReady() {\n        this.createMainWindow();\n    }\n    onWindowsAllClosed() {\n        if (process.platform !== \"darwin\") {\n            this.exit();\n        }\n    }\n    onActivate() {\n        if (this.getMainWindow() === null) {\n            this.createMainWindow();\n        }\n    }\n}\nconst main = new Main(electron__WEBPACK_IMPORTED_MODULE_1__.app);\nprocess.env[\"ELECTRON_DISABLE_SECURITY_WARNINGS\"] = \"true\";\n\n\n//# sourceURL=webpack://mineweather.engine_test/./scripts/Main.ts?");

/***/ }),

/***/ "./scripts/platform/Window.ts":
/*!************************************!*\
  !*** ./scripts/platform/Window.ts ***!
  \************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   Window: () => (/* binding */ Window)\n/* harmony export */ });\n/* harmony import */ var path__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! path */ \"path\");\n/* harmony import */ var path__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(path__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var electron__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! electron */ \"electron\");\n/* harmony import */ var electron__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(electron__WEBPACK_IMPORTED_MODULE_1__);\n//\n// Window.ts\n//\n\n\nclass Window {\n    // The window instance\n    window;\n    // The navigate page path\n    navigatePath;\n    constructor(config) {\n        let electronWindowConfig = { ...config };\n        electronWindowConfig.webPreferences = {\n            devTools: true,\n            experimentalFeatures: true,\n        };\n        this.navigatePath = config.pagePath;\n        this.window = new electron__WEBPACK_IMPORTED_MODULE_1__.BrowserWindow(electronWindowConfig);\n        this.window.center();\n        this.registyEventHandlers();\n    }\n    getTitle() {\n        return this.window.getTitle();\n    }\n    setTitle(title) {\n        this.window.setTitle(title);\n    }\n    getWidth() {\n        return this.window.getSize()[0];\n    }\n    setWidth(width) {\n        this.window.setSize(width, this.getHeight());\n    }\n    getHeight() {\n        return this.window.getSize()[1];\n    }\n    setHeight(height) {\n        this.window.setSize(this.getWidth(), height);\n    }\n    getMinWidth() {\n        return this.window.getMinimumSize()[0];\n    }\n    setMinWidth(width) {\n        this.window.setMinimumSize(width, this.getMinHeight());\n    }\n    getMinHeight() {\n        return this.window.getMinimumSize()[1];\n    }\n    setMinHeight(height) {\n        this.window.setMinimumSize(this.getMinWidth(), height);\n    }\n    getXPos() {\n        return this.window.getPosition()[0];\n    }\n    setXPos(x) {\n        this.window.setPosition(x, this.getYPos());\n    }\n    getYPos() {\n        return this.window.getPosition()[0];\n    }\n    setYPos(y) {\n        this.window.setPosition(this.getXPos(), y);\n    }\n    getOpacity() {\n        return this.window.getOpacity();\n    }\n    setOpacity(opacity) {\n        this.window.setOpacity(opacity);\n    }\n    isFullScrenable() {\n        return this.window.isFullScreenable();\n    }\n    setFullScrenable(fullScreenable) {\n        this.window.setFullScreenable(fullScreenable);\n    }\n    isMinimizable() {\n        return this.window.isMinimizable();\n    }\n    setMinimizable(minimizable) {\n        this.window.setMinimizable(minimizable);\n    }\n    isMaximizable() {\n        return this.window.isMaximizable();\n    }\n    setMaximizable(maximizable) {\n        this.window.setMaximizable(maximizable);\n    }\n    minimize() {\n        this.window.minimize();\n    }\n    maximize() {\n        this.window.maximize();\n    }\n    restore() {\n        this.window.restore();\n    }\n    minimizeOrRestore() {\n        if (!this.window.isMinimized()) {\n            this.minimize();\n            return true;\n        }\n        else {\n            this.restore();\n            return false;\n        }\n    }\n    maximizeOrRestore() {\n        if (!this.window.isMaximized()) {\n            this.maximize();\n            return true;\n        }\n        else {\n            this.restore();\n            return false;\n        }\n    }\n    close() {\n        this.window.close();\n    }\n    makeVisible() {\n        this.window.unmaximize();\n        this.window.show();\n        this.window.focus();\n    }\n    loadWebContents() {\n        this.window.loadFile(path__WEBPACK_IMPORTED_MODULE_0__.join(__dirname, this.navigatePath));\n    }\n    registryEvent(event, callback) {\n        this.window.on(event, callback);\n    }\n    registyEventHandlers() {\n        this.window.webContents.on(\"did-finish-load\", () => {\n            this.window.setMenu(null);\n            this.window.show();\n            this.window.webContents.openDevTools();\n        });\n    }\n}\n\n\n//# sourceURL=webpack://mineweather.engine_test/./scripts/platform/Window.ts?");

/***/ }),

/***/ "electron":
/*!***************************!*\
  !*** external "electron" ***!
  \***************************/
/***/ ((module) => {

module.exports = require("electron");

/***/ }),

/***/ "path":
/*!***********************!*\
  !*** external "path" ***!
  \***********************/
/***/ ((module) => {

module.exports = require("path");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/compat get default export */
/******/ 	(() => {
/******/ 		// getDefaultExport function for compatibility with non-harmony modules
/******/ 		__webpack_require__.n = (module) => {
/******/ 			var getter = module && module.__esModule ?
/******/ 				() => (module['default']) :
/******/ 				() => (module);
/******/ 			__webpack_require__.d(getter, { a: getter });
/******/ 			return getter;
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./scripts/Main.ts");
/******/ 	
/******/ })()
;