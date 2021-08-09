local terrain

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
  local meshFormat = {{'lovrPosition', 'float', 3}}
  local mesh = lovr.graphics.newMesh(meshFormat, vertices, "triangles", "dynamic", true)
  mesh:setVertexMap(indices)
  return mesh
end

function lovr.load()
  lovr.graphics.setBackgroundColor(0.208, 0.208, 0.275)
  lovr.graphics.setLineWidth(5)
  terrain = grid(100)
  local offset = lovr.math.noise(0, 0) -- ensure zero height at origin
  for vi = 1, terrain:getVertexCount() do
    local x,y,z = terrain:getVertex(vi)
    z = (lovr.math.noise(x * 10, y * 10) - offset) / 20
    terrain:setVertex(vi, {x,y,z})
  end
end

function lovr.draw()
  lovr.graphics.rotate(math.pi/2, 1, 0, 0)
  lovr.graphics.scale(100)
  lovr.graphics.setWireframe(false)
  lovr.graphics.setColor(0.565, 0.404, 0.463)
  terrain:draw()
  lovr.graphics.setWireframe(true)
  lovr.graphics.setColor(0.388, 0.302, 0.412, 0.5)
  terrain:draw()
end
