shader_type canvas_item;

uniform sampler2D noise_texture;
uniform float speed = 0.5;
uniform float strength = 0.01;

void fragment() {
    vec2 uv = UV;
    float time = TIME * speed;

    vec2 offset = vec2(time * 0.5, -time * 0.3);
    vec2 noise_uv = fract(uv * 2.5 + offset);

    vec2 noise = texture(noise_texture, noise_uv).rg;

    uv += (noise - 0.5) * strength;

    COLOR = texture(TEXTURE, uv);
}