// { "smartFilterBlockType": "TonyFadeInPixelBasedPixelate", "namespace": "Custom.Masks" }

uniform sampler2D input; // main

// { "default": 8.0, "name": "Block Size (pixels)", "min": 1.0, "max": 100.0 }
uniform float pixelSize;

// { "default": 0.5, "name": "Fade In Pos", "min": 0.1, "max": 1.0 }
uniform float fadeInPos;

// { "default": 1.0, "name": "Unit Scale", "min": 0.01, "max": 10.0 }
uniform float unitScale;

// { "type": "resolution" }
uniform vec2 outputResolution;

vec4 mainImage(vec2 vUV) { // main
    vec4 original = texture(input, vUV);

    if (vUV.x < fadeInPos) {
        
        vec2 blockSize = (pixelSize * unitScale) / outputResolution;

        vec2 gridUV = floor(vUV / blockSize) * blockSize + 0.5 * blockSize;

        vec4 pixelated = texture(input, gridUV);

        float blend = smoothstep(0.0, fadeInPos, vUV.x);
        return mix(pixelated, original, blend);
    }

    return original;
}
