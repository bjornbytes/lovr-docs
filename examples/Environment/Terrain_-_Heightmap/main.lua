local shaderCode = {[[
/* VERTEX shader */
layout(location = 0) out vec4 fragmentClip;
layout(set = 2) uniform texture2D heightmap;

vec4 lovrmain() {
  vec3 position = VertexPosition.xyz;
  position.z = getPixel(heightmap, position.xy).r / 10.;
  fragmentClip = ClipFromLocal * vec4(position, 1.);
  return fragmentClip;
} ]], [[
/* FRAGMENT shader */
layout(location = 0) in vec4 fragmentView;

Constants {
  vec3 fogColor;
};

vec4 lovrmain() {
  float fogAmount = atan(length(fragmentView) * 0.1) * 2.0 / PI;
  return vec4(mix(Color.rgb, fogColor, fogAmount), Color.a);
}]]}

function lovr.load()
  skyColor = { 0.208, 0.208, 0.275 }
  lovr.graphics.setBackgroundColor(skyColor)
  heightmap = lovr.graphics.newTexture('heightmap.png')
  shader = lovr.graphics.newShader(unpack(shaderCode))
end

function lovr.draw(pass)
  pass:setShader(shader)
  pass:send('fogColor', { lovr.math.gammaToLinear(unpack(skyColor)) })
  pass:send('heightmap', heightmap)

  pass:rotate(math.pi / 2, 1, 0, 0)
  pass:scale(100)

  pass:setColor(0.565, 0.404, 0.463)
  pass:setDepthOffset(-10000) -- Ensures wireframe stays on top
  pass:plane(mat4(), 'fill', 100)
  pass:setDepthOffset()

  pass:setWireframe(true)
  pass:setColor(0.388, 0.302, 0.412, 0.1)
  pass:plane(mat4(), 'fill', 100)
end
