// { "smartFilterBlockType": "SerializedBlock", "displayName": "Passthrough" }

uniform sampler2D input; // main

vec4 mainImage(vec2 vUV) { // main
    // sample the incoming texture at the UV coords
    return texture2D(input, vUV);
}
