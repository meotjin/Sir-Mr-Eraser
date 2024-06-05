shader_type canvas_item;

void fragment() {
    vec4 tex_color = texture(TEXTURE, FRAGCOORD.xy / TEXTURE_PIXEL_SIZE);
    COLOR = tex_color * vec4(1.0, 0.5, 0.5, tex_color.a); // Tint the tile with a red color, preserve alpha
}
