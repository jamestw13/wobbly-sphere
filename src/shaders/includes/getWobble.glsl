float getWobble(vec3 position){
  return simplexNoise4d(vec4(position, 0.0));
} 