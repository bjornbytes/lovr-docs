return lovr.graphics.newShader([[

// All of these are in view-space.
layout(location = 0) out vec3 lightDirection; // A vector from the vertex to the light
layout(location = 1) out vec3 normalDirection;
layout(location = 2) out vec3 vertexPosition;

const vec3 lightPosition = vec3(0, 10, 3);

vec4 lovrmain() {
  vec4 vVertex = ViewFromLocal * VertexPosition;
  vec4 vLight = ViewFromWorld * vec4(lightPosition, 1.);

  lightDirection = normalize(vec3(vLight - vVertex));
  normalDirection = normalize(NormalMatrix * VertexNormal);
  vertexPosition = vVertex.xyz;

  return DefaultPosition;
}
]], [[
layout(location = 0) in vec3 lightDirection;
layout(location = 1) in vec3 normalDirection;
layout(location = 2) in vec3 vertexPosition;

const vec3 cAmbient = vec3(.25);
const vec3 cDiffuse = vec3(1);
const vec3 cSpecular = vec3(.35);

vec4 lovrmain() {
  vec3 N = normalize(normalDirection);
  vec3 L = normalize(lightDirection);
  float diffuse = max(dot(N, L), 0.);
  float specular = 0.;

  if (diffuse > 0.) {
    vec3 r = reflect(L, N);
    vec3 viewDirection = normalize(-vertexPosition);

    float specularAngle = max(dot(r, viewDirection), 0.);
    specular = pow(specularAngle, 5.);
  }

  vec3 cFinal = pow(clamp(vec3(diffuse) * cDiffuse + vec3(specular) * cSpecular, cAmbient, vec3(1.)), vec3(.4545));
  return vec4(cFinal, 1.) * Color * getPixel(ColorTexture, UV);
}
]])
