return lovr.graphics.newShader([[
vec4 lovrmain() {
  return DefaultPosition;
}
]], [[
vec4 lovrmain() {
  vec3 lightPosition = vec3(0., 10., 3.);
  vec3 L = normalize(lightPosition - PositionWorld);
  vec3 N = normalize(Normal);

  vec3 cAmbient = vec3(.25);
  vec3 cDiffuse = vec3(.75);
  vec3 cSpecular = vec3(.35);

  float diffuse = max(dot(N, L), 0.);
  float specular = 0.;

  if (diffuse > 0.) {
    vec3 R = reflect(L, N);
    vec3 V = normalize(CameraPositionWorld - PositionWorld);

    float specularAngle = max(dot(R, V), 0.);
    specular = pow(specularAngle, 5.);
  }

  vec3 cFinal = pow(clamp(vec3(diffuse) * cDiffuse + vec3(specular) * cSpecular, cAmbient, vec3(1.)), vec3(.4545));
  return vec4(cFinal, 1.) * Color * getPixel(ColorTexture, UV);
}
]])
