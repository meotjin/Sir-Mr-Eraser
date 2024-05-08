shader_type canvas_item;

void fragment() {
    // Set the output color to red
    vec4 red = vec4(1, 0.2, 0.2, 1);
    COLOR = red * texture(TEXTURE, UV);
}
