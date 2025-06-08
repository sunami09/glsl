// { "smartFilterBlockType": "SimpleDisintegrationEffect", "namespace": "Custom.Effects" }

uniform sampler2D input;
uniform sampler2D noiseMap;

// { "default": 0.5, "name": "Disintegration Progress", "min": 0.0, "max": 1.0 }
uniform float progress;

// { "default": 1.0, "name": "Displacement Strength", "min": 0.0, "max": 5.0 }
uniform float strength;

vec4 mainImage(vec2 vUV) { // main
    // Sample the noise
    float noise = texture(noiseMap, vUV).r;

    // Pixels below the progress disappear
    if (noise < progress) {
        discard;
    }

    // Displace surviving pixels based on noise and progress
    vec2 dir = vec2(1.0, 0.0); // Displace to the right
    vec2 offset = dir * (noise - progress) * strength;

    // Apply offset to UV
    vec4 color = texture(input, vUV + offset);

    return color;
}
