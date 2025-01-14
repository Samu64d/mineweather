// 
// Utils.ts
//

export default class Utils {

	public static random(min: number, max: number): number {
		return Math.random() * (max - min) + min;
	}

	public static mod(n: number, m: number): number {
		return ((n % m) + m) % m;
	}

	public static isInRagne(value: number, min: number, max: number): boolean {
		return value >= min && value <= max;
	}

	public static clamp(value: number, min: number, max: number): number {
		if (value < min) return min;
		if (value > max) return max;
		return value;
	}

	public static lerp(v0: number, v1: number, t: number): number {
		return (v1 - v0) * t + v0;
	}

	public static inverseLerp(v0: number, v1: number, t: number): number {
		return (t - v0) / (v1 - v0);
	}

	public static discretize(n: number, d: number): number {
		return d * Math.ceil(n / d);
	}

	public static norm(x0: number, y0: number): number {
		return Math.sqrt(x0 * x0 + y0 * y0);
	}

	public static pointDistance(x0: number, y0: number, x1: number, y1: number): number {
		return Math.sqrt((x1 - x0) * (x1 - x0) + (y1 - y0) * (y1 - y0));
	}

	public static pointGradientCenterLerp(x: number, y: number, rx: number, ry: number): number {
		let dx: number = 1 - Math.abs(x * 2 - rx) / rx;
		let dy: number = 1 - Math.abs(y * 2 - ry) / ry;
		return Math.min(dx, dy);
	}

}
