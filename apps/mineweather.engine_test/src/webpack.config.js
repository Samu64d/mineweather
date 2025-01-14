//
// webpack.config.js
//

const path = require("path");

/** @type {import("webpack").Configuration} */
module.exports = [{
		mode: "development",
		target: "electron-main",
		entry: "./scripts/Main.ts",
		module: {
			rules: [{
				test: /\.ts$/,
				use: "ts-loader",
				exclude: /node_modules/
			}, ],
		},
		resolve: {
			extensions: [".ts"]
		},
		output: {
			filename: "Main.js",
			path: path.resolve(__dirname, "../dist/lib"),
			clean: false
		}
	},
	{
		mode: "development",
		target: "electron-renderer",
		entry: "./scripts/MainRenderer.ts",
		module: {
			rules: [{
				test: /\.ts$/,
				use: "ts-loader",
				exclude: /node_modules/
			}, ],
		},
		resolve: {
			extensions: [".ts"]
		},
		output: {
			filename: "Renderer.js",
			path: path.resolve(__dirname, "../dist/lib"),
			library: "renderer",
			clean: false
		}
	}
];
