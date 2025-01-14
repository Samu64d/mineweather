#version 150

#moj_import <light.glsl>
#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in vec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler0;
uniform sampler2D Sampler2;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform int FogShape;
uniform vec3 Light0_Direction;
uniform vec3 Light1_Direction;
uniform float GameTime;

out float vertexDistance;
out float vertexHorizontalDistance;
out vec4 vertexColor;
out vec4 vertexColor2;
out vec2 texCoord0;
out vec2 texCoord1;
out vec2 texCoord2;

vec4 minecraft_mix_light2(vec3 lightDir0, vec3 lightDir1, vec3 normal, vec4 color) {
    float light0 = max(0.0, dot(vec3(0.0, 0.0, 0.0), normal));
    float lightAccum = min(1.0, (light0) * MINECRAFT_LIGHT_POWER + MINECRAFT_AMBIENT_LIGHT);
    return vec4(color.rgb * lightAccum, color.a);
}

void main() {
	gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    vertexDistance = fog_distance(gl_Position.xyz, FogShape);
	vertexHorizontalDistance = length(Position.xz);
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color) * texelFetch(Sampler2, UV2 / 16, 0);
	vertexColor2 = minecraft_mix_light2(Light0_Direction, Light1_Direction, Normal, vec4(1.0, 1.0, 1.0, 1.0)) * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    texCoord1 = UV1;
    texCoord2 = UV2;
}
