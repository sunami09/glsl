// ======== Vertex Shader ========
// This is a standard vertex shader for 2D post-processing effects.
// Its main job is to pass through vertex positions and texture coordinates (UVs).

precision highp float;

// Attributes (input from the mesh)
attribute vec3 position; // Vertex position
attribute vec2 uv;       // Texture coordinate

// Varying (output to the fragment shader)
varying vec2 vUV; // Pass UV coordinates to the fragment shader

void main(void) {
    // Standard perspective projection
    gl_Position = vec4(position, 1.0);
    // Pass the texture coordinate to the fragment shader
    vUV = uv;
}