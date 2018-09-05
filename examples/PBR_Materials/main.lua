local glsl = {}
local lightPosition = {}
local headsetPosition = {}
local controller = nil

function lovr.load()
  model = lovr.graphics.newModel('helmet/DamagedHelmet.gltf')
  shader = lovr.graphics.newShader(unpack(glsl.pbr))
  lovr.graphics.setBackgroundColor(.18, .18, .20)
  lightPosition = { 75, 60, 20 }
end

function lovr.update(dt)
  controller = lovr.headset.getControllers()[1]
  if controller then lightPosition = { controller:getPosition() } end
  headsetPosition = { lovr.headset.getPosition() }

  shader:send('lightPosition', lightPosition)
  shader:send('headsetPosition', headsetPosition)
end

function lovr.draw()
  lovr.graphics.setShader(shader)
  model:draw(0, 1.6, -1.5, .4, lovr.timer.getTime() * .12 + .1)
  lovr.graphics.setShader()

  if controller then
    local x, y, z = unpack(lightPosition)
    lovr.graphics.setColor(1, 1, 1)
    lovr.graphics.sphere(x, y, z, .01)
  end
end

glsl.pbr = {
[[
out vec3 vNormal;
out vec3 vVertex;

vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
  vNormal = mat3(lovrModel) * lovrNormal;
  vVertex = vec3(lovrModel * vertex);
  return projection * lovrView * vec4(vVertex, 1.0);
}
]],

[[
#define PI 3.141592653

in vec3 vNormal;
in vec3 vVertex;

uniform vec3 headsetPosition;
uniform vec3 lightPosition;

float D_GGX(float NoH, float roughness) {
  float alpha = roughness * roughness;
  float alpha2 = alpha * alpha;
  float denom = (NoH * NoH) * (alpha2 - 1.) + 1.;
  return alpha2 / (PI * denom * denom);
}

float G_SmithGGXCorrelated(float NoV, float NoL, float roughness) {
  float alpha = roughness * roughness;
  float alpha2 = alpha * alpha;
  float GGXV = NoL * sqrt(alpha2 + (1. - alpha2) * (NoV * NoV));
  float GGXL = NoV * sqrt(alpha2 + (1. - alpha2) * (NoL * NoL));
  return .5 / max(GGXV + GGXL, 1e-5);
}

vec3 F_Schlick(vec3 F0, float LoH) {
  return F0 + (vec3(1.) - F0) * pow(1. - LoH, 5.);
}

vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {
  vec3 baseColor = texture(lovrDiffuseTexture, uv).rgb;
  vec3 emissive = texture(lovrEmissiveTexture, uv).rgb;
  float metalness = texture(lovrMetalnessTexture, uv).b * lovrMetalness;
  float roughness = max(texture(lovrRoughnessTexture, uv).g * lovrRoughness, .05);
  float occlusion = texture(lovrOcclusionTexture, uv).r;
  vec3 F0 = mix(vec3(.04), baseColor, metalness);

  vec3 N = normalize(vNormal);
  vec3 V = normalize(headsetPosition - vVertex);
  vec3 L = normalize(lightPosition - vVertex);
  vec3 H = normalize(V + L);

  float NoV = abs(dot(N, V)) + 1e-5;
  float NoL = clamp(dot(N, L), 0., 1.);
  float NoH = clamp(dot(N, H), 0., 1.);
  float LoH = clamp(dot(L, H), 0., 1.);

  float D = D_GGX(NoH, roughness);
  float G = G_SmithGGXCorrelated(NoV, NoL, roughness);
  vec3 F = F_Schlick(F0, LoH);

  vec3 specular = vec3(D * G * F);
  vec3 diffuse = (vec3(1.) - F) * (1. - metalness) * baseColor;
  vec3 color = (diffuse + specular) * NoL * occlusion + emissive;

]] ..
(lovr.getOS() == 'Web' and '  color = pow(color, vec3(.4545));\n' or '') ..
[[

  return vec4(vec3(color), 1.);
}
]]
}
