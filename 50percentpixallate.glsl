// { "smartFilterBlockType": "50percentCustomPixelateBlock" }

uniform sampler2D input; // main
// { "default": 0.05, "name": "Block Size", "min": 0.001, "max": 0.2 }
uniform float blockSize;

vec4 mainImage(vec2 vUV) { // main
    // Group UVs into a grid of size blockSize×blockSize,
    // then offset by half a block so we sample the block's center:
    if(vUV.x > 0.5){
        vec2 gridUV = floor(vUV / blockSize) * blockSize + blockSize * 0.5;
        // Sample the upstream texture at that “snapped” UV:
        return texture(input, gridUV);
    }
    return texture(input, vUV);
    
}
