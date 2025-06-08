// { "smartFilterBlockType": "DisintegrationEffect", "namespace": "Custom.Effects" }

uniform sampler2D input;       // Main image
uniform sampler2D noiseMap;    // Grayscale noise pattern

// { "default": 0.0, "name": "Disintegration Progress", "min": 0.0, "max": 1.0 }
uniform float progress;

// { "default": 0.1, "name": "Edge Softness", "min": 0.0, "max": 0.3 }
uniform float softness;

vec4 mainImage(vec2 vUV) { // main
    vec4 base = texture(input, vUV);
    float noise = texture(noiseMap, vUV).r;

    // Use noise and progress to determine visibility
    float mask = smoothstep(progress - softness, progress + softness, noise);

    // Optional: fade out with mask (multiply alpha)
    return vec4(base.rgb * mask, base.a * mask);
}
