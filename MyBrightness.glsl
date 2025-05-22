// { "smartFilterBlockType": "CustomBrightnessBlock" }

uniform sampler2D input; // main
// { "default": 0.5, "name": "Brightness", "min": -1.0, "max": 1.0 }
uniform float brightness;

vec4 mainImage(vec2 vUV) { // main

    vec4 c = texture(input, vUV);
    if(vUV.x > 0.5){
        c.rgb += brightness;
    }
    
    return c;
}
