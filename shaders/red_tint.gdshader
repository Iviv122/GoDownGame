shader_type canvas_item;

uniform vec3 TintColor = vec3(1,0,0);
uniform float Alpha = 1;

void vertex() {

}

void fragment() {
	COLOR = vec4(TintColor,COLOR.a*Alpha);
}
