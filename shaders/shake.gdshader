shader_type canvas_item;

uniform float speed =1;
uniform float strength =1;

void vertex() {
  // Animate Sprite2D moving in big circle around its location
  VERTEX += vec2(cos(TIME*speed)*strength, sin(TIME*speed)*sin(TIME*speed)*strength);
}

void fragment() {
	// Called for every pixel the material is visible on.
}
