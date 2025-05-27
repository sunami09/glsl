// { "smartFilterBlockType": "50GradientPixelateMask", "namespace": "Custom.Masks" }
/// Applies a gradient pixelate effect from left to right.
/// Smoothly transitions from pixelated to normal.
uniform sampler2D input; // main
/// The input texture to be masked and pixelated.
// { "default": 0.05, "name": "Block Size", "min": 0.001, "max": 0.2 }
uniform float blockSize;
/// Size of the pixelation blocks.


vec4 gradientPixelateMask(vec2 vUV) { // main
    // Gradient from left (full effect) to right (no effect)
    if(vUV.x < 0.5){
        vec2 gridUV = floor(vUV / blockSize) * blockSize + blockSize * 0.5;
        vec4 pixelated = texture2D(input, gridUV);
        vec4 original = texture2D(input, vUV);
        
        // Blend between original and pixelated
        return mix(pixelated, original, vUV.x * 2.0);
    }
    
    return texture(input, vUV);
}
