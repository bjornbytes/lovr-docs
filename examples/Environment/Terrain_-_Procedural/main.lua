local shaderCode = {[[
/* VERTEX shader */
out vec4 fragmentView;

vec4 lovrmain() {
  fragmentView = ClipFromLocal * VertexPosition;
  return fragmentView;
} ]], [[
/* FRAGMENT shader */
in vec4 fragmentView;

Constants {
  vec3 fogColor;
};

vec4 lovrmain() {
  float fogAmount = atan(length(fragmentView) * 0.1) * 2.0 / PI;
  return vec4(mix(Color.rgb, fogColor, fogAmount), Color.a);
}]]}

local function grid(subdivisions)
  local size = 1 / math.floor(subdivisions or 1)
  local vertices = {}
  local indices  = {}
  for y = -0.5, 0.5, size do
    for x = -0.5, 0.5, size do
      table.insert(vertices, {x, y, 0})
      table.insert(vertices, {x, y + size, 0})
      table.insert(vertices, {x + size, y, 0})
      table.insert(vertices, {x + size, y + size, 0})
      table.insert(indices, #vertices - 3)
      table.insert(indices, #vertices - 2)
      table.insert(indices, #vertices - 1)
      table.insert(indices, #vertices - 2)
      table.insert(indices, #vertices)
      table.insert(indices, #vertices - 1)
    end
  end
  return vertices, indices
end

function lovr.load()
  skyColor = {0.208, 0.208, 0.275}
  lovr.graphics.setBackgroundColor(skyColor)
  shader = lovr.graphics.newShader(unpack(shaderCode))

  local vertices, indices = grid(100)

  local offset = lovr.math.noise(0, 0) -- ensure zero height at origin
  for vi = 1, #vertices do
    local x,y,z = unpack(vertices[vi])
    z = (lovr.math.noise(x * 10, y * 10) - offset) / 20
    vertices[vi][1], vertices[vi][2], vertices[vi][3] = x, y, z
  end

  mesh = lovr.graphics.newMesh({{ 'VertexPosition', 'vec3' }}, vertices)
  mesh:setIndices(indices)
end

function lovr.draw(pass)
  pass:setShader(shader)
  pass:send('fogColor', { lovr.math.gammaToLinear(unpack(skyColor)) })
  pass:rotate(math.pi/2, 1, 0, 0)
  pass:scale(100)

  pass:setColor(0.565, 0.404, 0.463)
  pass:setDepthOffset(-10000) -- Ensure wireframe stays on top
  pass:draw(mesh)
  pass:setDepthOffset()

  pass:setWireframe(true)
  pass:setColor(0.388, 0.302, 0.412, 0.1)
  pass:draw(mesh)
end
