// 
// PerlinNoise.ts
//

const DEF_CUBE_SZ: number = 128;

// Hash lookup table as defined by Ken Perlin.  This is a randomly
// arranged array of all numbers from 0-255 inclusive.
const DEF_PERM: number[] = [151, 160, 137, 91, 90, 15,
    131, 13, 201, 95, 96, 53, 194, 233, 7, 225, 140, 36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23,
    190, 6, 148, 247, 120, 234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32, 57, 177, 33,
    88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68, 175, 74, 165, 71, 134, 139, 48, 27, 166,
    77, 146, 158, 231, 83, 111, 229, 122, 60, 211, 133, 230, 220, 105, 92, 41, 55, 46, 245, 40, 244,
    102, 143, 54, 65, 25, 63, 161, 1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169, 200, 196,
    135, 130, 116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64, 52, 217, 226, 250, 124, 123,
    5, 202, 38, 147, 118, 126, 255, 82, 85, 212, 207, 206, 59, 227, 47, 16, 58, 17, 182, 189, 28, 42,
    223, 183, 170, 213, 119, 248, 152, 2, 44, 154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9,
    129, 22, 39, 253, 19, 98, 108, 110, 79, 113, 224, 232, 178, 185, 112, 104, 218, 246, 97, 228,
    251, 34, 242, 193, 238, 210, 144, 12, 191, 179, 162, 241, 81, 51, 145, 235, 249, 14, 239, 107,
    49, 192, 214, 31, 181, 199, 106, 157, 184, 84, 204, 176, 115, 121, 50, 45, 127, 4, 150, 254,
    138, 236, 205, 93, 222, 114, 67, 29, 24, 72, 243, 141, 128, 195, 78, 66, 215, 61, 156, 180
];

// Gradient vectors
const DEF_GRAD3LIST: [number, number, number][] = [
    [1, 1, 0], [-1, 1, 0], [1, -1, 0], [-1, -1, 0],
    [1, 0, 1], [-1, 0, 1], [1, 0, -1], [-1, 0, -1],
    [0, 1, 1], [0, -1, 1], [0, 1, -1], [0, -1, -1]
];

export default class PerlinNoise {

    private seed: number;
    private perm: number[]

    constructor(seed: number) {
        this.seed = seed;
        this.perm = [];
        for (let i = 0; i < 512; i++) {
            this.perm[i] = (DEF_PERM[i % 256] * this.seed) % 255;
        }
    }

    public getSeed(): number {
        return this.seed;
    }

    public getNoiseValueAt(x: number, y: number, z: number, zoom: number): number {

        // Zooming
        x = x * zoom;
        y = y * zoom;
        z = z * zoom;

        // Find unit grid cell containing point 
        let X: number = Math.floor(x / DEF_CUBE_SZ);
        let Y: number = Math.floor(y / DEF_CUBE_SZ);
        let Z: number = Math.floor(z / DEF_CUBE_SZ);

        // Get relative xyz coordinates of point within that cell 
        x = (x % DEF_CUBE_SZ) * 100 / DEF_CUBE_SZ;
        y = (y % DEF_CUBE_SZ) * 100 / DEF_CUBE_SZ;
        z = (z % DEF_CUBE_SZ) * 100 / DEF_CUBE_SZ;

        // Wrap the integer cells at 255 (smaller integer period can be introduced here) 
        X = X % 255;
        Y = Y % 255;
        Z = Z % 255;

        // Calculate a set of eight hashed gradient indices 
        let gi000: number = this.perm[X + this.perm[Y + this.perm[Z]]] % 12;
        let gi001: number = this.perm[X + this.perm[Y + this.perm[Z + 1]]] % 12;
        let gi010: number = this.perm[X + this.perm[Y + 1 + this.perm[Z]]] % 12;
        let gi011: number = this.perm[X + this.perm[Y + 1 + this.perm[Z + 1]]] % 12;
        let gi100: number = this.perm[X + 1 + this.perm[Y + this.perm[Z]]] % 12;
        let gi101: number = this.perm[X + 1 + this.perm[Y + this.perm[Z + 1]]] % 12;
        let gi110: number = this.perm[X + 1 + this.perm[Y + 1 + this.perm[Z]]] % 12;
        let gi111: number = this.perm[X + 1 + this.perm[Y + 1 + this.perm[Z + 1]]] % 12;

        // Calculate noise contributions from each of the eight corners
        let n000: number = this.dot(DEF_GRAD3LIST[gi000], x, y, z);
        let n100: number = this.dot(DEF_GRAD3LIST[gi100], x - 100, y, z);
        let n010: number = this.dot(DEF_GRAD3LIST[gi010], x, y - 100, z);
        let n110: number = this.dot(DEF_GRAD3LIST[gi110], x - 100, y - 100, z);
        let n001: number = this.dot(DEF_GRAD3LIST[gi001], x, y, z - 100);
        let n101: number = this.dot(DEF_GRAD3LIST[gi101], x - 100, y, z - 100);
        let n011: number = this.dot(DEF_GRAD3LIST[gi011], x, y - 100, z - 100);
        let n111: number = this.dot(DEF_GRAD3LIST[gi111], x - 100, y - 100, z - 100);

        // Compute the fade curve value for each of x, y, z
        let u: number = this.fade(x);
        let v: number = this.fade(y);
        let w: number = this.fade(z);

        // Interpolate along x the contributions from each of the corners
        let nx00: number = this.mix(n000, n100, u);
        let nx01: number = this.mix(n001, n101, u);
        let nx10: number = this.mix(n010, n110, u);
        let nx11: number = this.mix(n011, n111, u);

        // Interpolate the four results along y
        let nxy0: number = this.mix(nx00, nx10, v);
        let nxy1: number = this.mix(nx01, nx11, v);

        // Interpolate the two last results along z
        let noise: number = (((this.mix(nxy0, nxy1, w) / 2) + 50) / 100);
        return noise;
    }

    private fade(t: number): number {
        t = t * 10;
        return ((t * t * 3) / 10000 - ((t * t * t) / 5000000));
    }

    private dot(g: [number, number, number], x: number, y: number, z: number): number {
        return g[0] * x + g[1] * y + g[2] * z;
    }

    private mix(a: number, b: number, t: number): number {
        return ((100 - t) * a + t * b) / 100;
    }

}
