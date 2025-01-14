// 
// ColorsUtils.ts
//

import { Color } from "../common/Interfaces";
import Utils from "./Utils";

export default class ColorsUtils {

	public static toString(color: Color): string {
		return "rgb(" + color[0] + "," + color[1] + "," + color[2] + ")";
	}

	public static lerp(color1: Color, color2: Color, t: number): Color {
		let color: Color = [0, 0, 0];
		color[0] = Utils.lerp(color1[0], color2[0], t);
		color[1] = Utils.lerp(color1[1], color2[1], t);
		color[2] = Utils.lerp(color1[2], color2[2], t);
		return color;
	}

}
