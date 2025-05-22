// { "smartFilterBlockType": "sin50percentCustomPixelateBlock" }

uniform sampler2D input; // main
// { "default": 0.05, "name": "Block Size", "min": 0.001, "max": 0.2 }
uniform float blockSize;
uniform float itime;

vec4 mainImage(vec2 vUV) { // main
    float t = sin(itime); 

    float lowerBound, upperBound;

    if (t > 0.5) {
        lowerBound = 0.0;
        upperBound = 0.5;
    } else if (t > 0.0) {
        lowerBound = 0.5;
        upperBound = 1.0;
    } else if (t > -0.5) {
        lowerBound = 0.0;
        upperBound = 0.5;
    } else {
        lowerBound = 0.5;
        upperBound = 1.0;
    }
    if (vUV.x > lowerBound && vUV.x < upperBound) {
        vec2 gridUV = floor(vUV / blockSize) * blockSize + blockSize * 0.5;
        return texture(input, gridUV);
    }
    return texture(input, vUV);
}
