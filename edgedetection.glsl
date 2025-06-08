// { "smartFilterBlockType": "HardEdgeOutline", "namespace": "Custom.Filters" }

uniform sampler2D input;
// { "type": "resolution" }
uniform vec2 outputResolution;

// { "default": 0.2, "name": "Edge Threshold", "min": 0.01, "max": 1.0 }
uniform float threshold;

vec4 mainImage(vec2 vUV) { // main
    vec2 texel = 1.0 / outputResolution;

    float gx[9] = float[](
        -1.0, 0.0, 1.0,
        -2.0, 0.0, 2.0,
        -1.0, 0.0, 1.0
    );
    float gy[9] = float[](
        -1.0, -2.0, -1.0,
         0.0,  0.0,  0.0,
         1.0,  2.0,  1.0
    );

    float edgeX = 0.0;
    float edgeY = 0.0;
    int k = 0;

    for (int y = -1; y <= 1; y++) {
        for (int x = -1; x <= 1; x++) {
            vec2 offset = vec2(float(x), float(y)) * texel;
            vec3 color = texture(input, vUV + offset).rgb;
            float lum = dot(color, vec3(0.299, 0.587, 0.114));
            edgeX += lum * gx[k];
            edgeY += lum * gy[k];
            k++;
        }
    }

    float edge = length(vec2(edgeX, edgeY));

    // Hard threshold for crisp outlines
    float outline = step(threshold, edge);

    return vec4(vec3(outline), 1.0); // white line, black background
}
