#version 150

#moj_import <fog.glsl>

in float vertexDistance;
in float vertexHorizontalDistance;
in vec4 vertexColor;
in vec4 vertexColor2;
in vec2 texCoord0;
in vec2 texCoord1;

uniform sampler2D Sampler0;
uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform float GameTime;

out vec4 fragColor;

vec4 calcColorForSkyBox(vec4 color) {
	color = color * vertexColor2 * ColorModulator;
	return color;
}

vec4 calcColorForCloud(vec4 color) {
	color = color * vertexColor * ColorModulator;
	if (color.a < 0.1) {
        discard;
    }
	return linear_fog(color, vertexHorizontalDistance, FogStart * 3.0, FogEnd * 3.0, FogColor);
}

vec4 calcColorForLightningBolt(vec4 color) {
	color = vec4(0.99, 0.99, 1.0, mix(0.1, 0.99, (float(round(cos(GameTime * 64000))))));
	return linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}

vec4 calcColorDefault(vec4 color) {
	color = color * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
    return linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}

void main() {

	vec4 resultColor;
	vec4 color = texture(Sampler0, texCoord0);

	if (color * 255 == vec4(218, 218, 218, 8)) {
		resultColor = calcColorForSkyBox(color);
	} else if (color * 255 == vec4(164, 164, 164, 220)) {
		resultColor = calcColorForCloud(color);
	} else if (color * 255 == vec4(251, 251, 251, 82)) {
		resultColor = calcColorForLightningBolt(color);
	} else {
		resultColor = calcColorDefault(color);
	}

	fragColor = resultColor;
}
