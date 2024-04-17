float getWobble(
  vec3 position, 
  float positionFrequency, 
  float strength, 
  float time, 
  float timeFrequency
)
{
  vec3 warpedPosition = position;
  warpedPosition += simplexNoise4d(vec4(position, uTime));
  return simplexNoise4d(

    vec4(
      warpedPosition * positionFrequency, 
      time * timeFrequency
      )
  ) * strength;
} 