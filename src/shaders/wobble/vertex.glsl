uniform float uTime;
uniform float uPositionFrequency;
uniform float uTimeFrequency;
uniform float uStrength;

attribute vec4 tangent;

#include ../includes/simplexNoise4d.glsl
#include ../includes/getWobble.glsl


void main() {
  
  vec3 biTangent = cross(normal, tangent.xyz);

  // Neighbor position
  float shift = 0.01;
  vec3 positionA = csm_Position + tangent.xyz * shift;
  vec3 positionB = csm_Position + biTangent * shift;

  // Wobble
  float wobble = getWobble(csm_Position, uPositionFrequency, uStrength, uTime, uTimeFrequency);
  csm_Position += wobble * normal;
  positionA += getWobble(positionA, uPositionFrequency, uStrength, uTime, uTimeFrequency) * normal;
  positionB += getWobble(positionB, uPositionFrequency, uStrength, uTime, uTimeFrequency) * normal;

  // Compute normal
  vec3 toA = normalize(positionA - csm_Position);
  vec3 toB = normalize(positionB - csm_Position);

  csm_Normal = cross(toA, toB);
}