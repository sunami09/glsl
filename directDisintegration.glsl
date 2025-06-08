// { "smartFilterBlockType": "DustDisintegrateBurst", "namespace": "Custom.Effects" }

uniform sampler2D input;
uniform sampler2D noiseMap; // noise used for both direction and timing

// { "default": 0.0, "name": "Progress", "min": 0.0, "max": 1.0 }
uniform float progress;

// { "default": 0.2, "name": "Burst Strength", "min": 0.0, "max": 1.0 }
uniform float strength;

vec4 mainImage(vec2 vUV) { // main
    vec4 base = texture(input, vUV);
    float noise = texture(noiseMap, vUV).r;

    // Fade out based on progress and noise
    float alpha = smoothstep(progress + 0.2, progress, noise);

    // Create a "random" vector from noise to drift pixel
    vec2 direction = normalize(vec2(
        fract(sin(noise * 91.17) * 43758.5453),
        fract(sin(noise * 47.45) * 12345.6789)
    ) - 0.5);

    // Displace pixels based on inverse alpha (farther as they disintegrate)
    vec2 offsetUV = vUV + direction * (1.0 - alpha) * strength;

    vec4 dust = texture(input, offsetUV);
    return vec4(dust.rgb * alpha, alpha);
}
