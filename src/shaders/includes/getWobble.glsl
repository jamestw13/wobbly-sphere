float getWobble(vec3 position, float positionFrequency, float strength, float time, float timeFrequency){
  return simplexNoise4d(vec4(position * positionFrequency, time * timeFrequency)) * strength;
} 