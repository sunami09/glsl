// { "smartFilterBlockType": "sin50percentCustomPixelateBlock" }

uniform sampler2D input; // main
// { "default": 0.05, "name": "Block Size", "min": 0.001, "max": 0.2 }
uniform float blockSize;
uniform float time;

vec4 mainImage(vec2 vUV) { // main
    float t = sin(time);

    float lowerBoundx, upperBoundx, lowerBoundy, upperBoundy;

    if (t > 0.5) {
        lowerBoundx = 0.0;
        upperBoundx = 0.5;
    } else if (t > 0.0) {
        lowerBoundx = 0.0;
        upperBoundx = 0.5;
    } else if (t > -0.5) {
        lowerBoundx = 0.5;
        upperBoundx = 1.0;
    } else {
        lowerBoundx = 0.5;
        upperBoundx = 1.0;
    }

    if (t > 0.5) {
        lowerBoundy = 0.0;
        upperBoundy = 0.5;
    } else if (t > 0.0) {
        lowerBoundy = 0.5;
        upperBoundy = 1.0;
    } else if (t > -0.5) {
        lowerBoundy = 0.5;
        upperBoundy = 1.0;
    } else {
        lowerBoundy = 0.0;
        upperBoundy = 0.5;
    }

    if ((vUV.x > lowerBoundx && vUV.x < upperBoundx) &&
        (vUV.y > lowerBoundy && vUV.y < upperBoundy)) {
        vec2 gridUV = floor(vUV / blockSize) * blockSize + blockSize * 0.5;
        return texture(input, gridUV);
    }

    return texture(input, vUV);
}
