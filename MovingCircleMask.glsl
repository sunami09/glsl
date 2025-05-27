// { "smartFilterBlockType": "MovingCircleMask", "namespace": "Custom.Masks" }
/// Applies a pixelate effect inside a moving circular area.
/// The circle moves in a circular pattern over time.
uniform sampler2D input; // main
/// The input texture to be masked and pixelated.
// { "default": 0.05, "name": "Block Size", "min": 0.001, "max": 0.2 }
uniform float blockSize;
/// Size of the pixelation blocks.
uniform float time;
/// Time value for animation.

vec4 movingCircleMask(vec2 vUV) { // main
    // Circle moves in a circular pattern
    float moveX = 0.5 + sin(time) * 0.3;
    float moveY = 0.5 + cos(time) * 0.3;
    vec2 center = vec2(moveX, moveY);
    
    float dist = distance(vUV, center);
    
    if (dist < 0.2) {
        vec2 gridUV = floor(vUV / blockSize) * blockSize + blockSize * 0.5;
        return texture2D(input, gridUV);
    } else {
        return texture2D(input, vUV);
    }
}