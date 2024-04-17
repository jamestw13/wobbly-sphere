#include ../includes/simplexNoise4d.glsl
#include ../includes/getWobble.glsl

attribute vec4 tangent;

void main() {
  
  vec3 biTangent = cross(normal, tangent.xyz);

  // Neighbor position
  float shift = 0.01;
  vec3 positionA = csm_Position + tangent.xyz * shift;
  vec3 positionB = csm_Position + biTangent * shift;

  // Wobble
  float wobble = getWobble(csm_Position);
  csm_Position += wobble * normal;
  positionA += getWobble(positionA) * normal;
  positionB += getWobble(positionB) * normal;

  // Compute normal
  vec3 toA = normalize(positionA - csm_Position);
  vec3 toB = normalize(positionB - csm_Position);

  csm_Normal = cross(toA, toB);
}