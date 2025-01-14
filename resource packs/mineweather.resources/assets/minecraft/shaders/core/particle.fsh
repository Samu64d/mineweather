#version 150

#moj_import <minecraft:fog.glsl>

uniform sampler2D Sampler0;
uniform sampler2D Sampler2;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec2 texCoord0;
in vec4 vertexColor;
flat in ivec2 _UV2;

out vec4 fragColor;

vec4 calcColorForRain(vec4 color) {
	return color * vertexColor * vec4(0.15, 0.15, 0.15, 0.5);
}

vec4 calcColorForHail(vec4 color) {
	float gray = 0.299 * vertexColor.r + 0.587 * vertexColor.g + 0.114 * vertexColor.b + 0.1;
	return vec4(gray, gray, gray, color.a);
}

vec4 calcColorForOther(vec4 color) {
	return color * vertexColor * ColorModulator;
}

void main() {
	vec4 resultColor;
	vec4 color = texture(Sampler0, texCoord0);

	if (color * 255 == vec4(106, 129, 152, 110)) {
		resultColor = calcColorForRain(color);
	} else if (color * 255 == vec4(172, 172, 172, 255)) {
		resultColor = calcColorForHail(color);
	} else {
    	resultColor = calcColorForOther(color);
	}

	if (color.a < 0.1) {
		discard;
	}
    fragColor = linear_fog(resultColor, vertexDistance, FogStart, FogEnd, FogColor);
}
