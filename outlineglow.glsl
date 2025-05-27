// { "smartFilterBlockType": "OutlineGlowEffect", "namespace": "Custom.Masks" }

uniform sampler2D input;
uniform sampler2D outlineMap;

// { "default": 1.0, "name": "Glow Strength", "min": 0.0, "max": 3.0 }
uniform float glowStrength;

// { "default": [1.0, 0.0, 1.0], "name": "Glow Color" }
uniform vec3 glowColor;

vec4 mainImage(vec2 vUV) { // main
    vec4 base = texture(input, vUV);

    // How far to spread glow (1 pixel = ~1 / resolution)
    float spread = 0.005;

    // Sample the outline at 9 positions to make it thicker
    float outline = 0.0;
    outline += texture(outlineMap, vUV).r;
    outline += texture(outlineMap, vUV + vec2(spread, 0.0)).r;
    outline += texture(outlineMap, vUV - vec2(spread, 0.0)).r;
    outline += texture(outlineMap, vUV + vec2(0.0, spread)).r;
    outline += texture(outlineMap, vUV - vec2(0.0, spread)).r;
    outline += texture(outlineMap, vUV + vec2(spread, spread)).r;
    outline += texture(outlineMap, vUV - vec2(spread, spread)).r;
    outline += texture(outlineMap, vUV + vec2(spread, -spread)).r;
    outline += texture(outlineMap, vUV - vec2(spread, -spread)).r;

    outline = clamp(outline / 9.0, 0.0, 1.0); // normalize back

    vec3 glow = glowColor * outline * glowStrength;

    return vec4(base.rgb + glow, base.a);
}
