shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec3 color = texture(TEXTURE, UV).rgb;
	float alpha = texture(TEXTURE,UV).a;
	
	float blue_threshold = 0.6;
    float non_blue_threshold = 0.5;
	
	// Check if the color is predominantly blue
    if (color.b > blue_threshold && color.r < non_blue_threshold && color.g < non_blue_threshold) {
        alpha = 0.0; // Make it fully transparent
    }
	
	COLOR = vec4(color,alpha);
	
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
