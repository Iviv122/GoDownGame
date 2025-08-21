shader_type canvas_item;

#define PI 3.14159265359

uniform vec3 baseColor;
uniform vec3 linesColor;

uniform float linesSpeed;
uniform float freq;
uniform float angle;

void vertex() {
	VERTEX.x += cos(TIME)*1.;
}

void fragment() {

	float offset = TIME*linesSpeed;
	vec3 ncolor = baseColor;
	float stripes = mod(floor(freq * UV.y+offset),2.);

	ncolor -= stripes*linesColor;

	COLOR = vec4(ncolor,COLOR.a);
}