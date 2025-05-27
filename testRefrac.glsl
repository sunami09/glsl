// { "smartFilterBlockType": "BasicRefractionDistortion", "namespace": "Custom.Effects" }

uniform sampler2D input; // main
/// The base image

// { "default": 0.02, "name": "Distortion Strength", "min": 0.0, "max": 0.1 }
uniform float strength;
/// How intense the UV distortion is

uniform sampler2D bumpMap;
/// A noise or pattern texture that warps the image

// { "default": 8.0, "name": "Tile Scale", "min": 1.0, "max": 20.0 }
uniform float tileScale;
vec4 mainImage(vec2 vUV) { // main
    if (vUV.x > 0.5)
    {
        vec2 bump = texture(bumpMap, vUV * tileScale).rg;
        vec2 offset = (bump - 0.5) * strength;

        // Apply refraction: shift UVs by offset to distort the input
        return texture(input, vUV + offset);
    }
    return texture(input, vUV);
}
