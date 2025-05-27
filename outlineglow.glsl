// { "smartFilterBlockType": "OutlineGlowEffect", "namespace": "Custom.Masks" }

uniform sampler2D input; // main image
uniform sampler2D outlineMap; // your outline image

// { "default": 1.0, "name": "Glow Strength", "min": 0.0, "max": 3.0 }
uniform float glowStrength;

// { "default": [1.0, 0.0, 1.0], "name": "Glow Color" }
uniform vec3 glowColor;

vec4 mainImage(vec2 vUV) { // main
    vec4 base = texture(input, vUV);
    float outline = texture(outlineMap, vUV).r; // assuming grayscale in red channel

    // Add glow where outline is white
    vec3 glow = glowColor * outline * glowStrength;

    return vec4(base.rgb + glow, base.a);
}
