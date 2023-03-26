shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;
uniform sampler2D NOISE_TEXTURE;
uniform float opacity = 1.0;

void fragment() {
	float color = texture(NOISE_TEXTURE, UV).x;
	COLOR = vec4(color, color, color, opacity);
}
