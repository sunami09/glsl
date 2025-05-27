// { "smartFilterBlockType": "CircleMask", "namespace": "Custom.Masks" }
/// Applies a pixelate effect inside a circular area.
/// The circle is centered on the screen.
uniform sampler2D input; // main
/// The input texture to be masked and pixelated.
// { "default": 0.05, "name": "Block Size", "min": 0.001, "max": 0.2 }
uniform float blockSize;
/// Size of the pixelation blocks.

vec4 circleMask(vec2 vUV) { // main
    vec2 center = vec2(0.5, 0.5);
    float dist = distance(vUV, center);
    
    if (dist < 0.3) {
        // Inside circle - pixelate
        vec2 gridUV = floor(vUV / blockSize) * blockSize + blockSize * 0.5;
        return texture2D(input, gridUV);
    } else {
        // Outside circle - normal
        return texture2D(input, vUV);
    }
}
