// ======== Fragment Shader ========
// This shader takes an input texture and inverts its colors.

precision highp float;

// Varying (input from the vertex shader)
varying vec2 vUV; // Interpolated texture coordinates

// Uniforms (inputs from your application/editor)
// This 'inputTextureSampler' would be connected to the output of
// the "Texture" input block in the Smart Filter Editor.
uniform sampler2D inputTextureSampler;

void main(void) {
    // Sample the color from the input texture at the current UV coordinate
    vec4 originalColor = texture2D(inputTextureSampler, vUV);

    // Invert the colors (excluding alpha)
    vec3 invertedColor = 1.0 - originalColor.rgb;

    // Output the new color
    // Keep the original alpha
    gl_FragColor = vec4(invertedColor, originalColor.a);
}