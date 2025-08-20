shader_type canvas_item;

uniform float scroll_speed : hint_range(0, 2) = 0.08;

void vertex() {

}

void fragment() {
	vec2 nUV = UV;
	nUV.y += TIME*scroll_speed;

	COLOR = texture(TEXTURE, nUV);
}
