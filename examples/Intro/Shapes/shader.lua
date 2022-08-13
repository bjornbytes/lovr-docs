return lovr.graphics.newShader([[
vec4 lovrmain() {
  PointSize = 5.0;
  return DefaultPosition;
}
]], [[
vec4 lovrmain() {
  const vec3 lightPosition = vec3(0., 2.0, -1.);
  float distance = length(PositionWorld - lightPosition);
  const vec3 lightDirection = normalize(PositionWorld - lightPosition);
  const vec4 lightColor = vec4(1, 1, 1, 5);

  Surface surface;
  initSurface(surface);

  vec3 lighting = getLighting(surface, lightDirection, lightColor, 1.0 / distance);

  return vec4(Color.rgb * lighting, Color.a);
}
]])
