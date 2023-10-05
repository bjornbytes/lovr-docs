local function grid(size, subdivisions)
  local vertices = {}
  local indices  = {}
  local step = size / (subdivisions - 1)
  for z = -size / 2, size / 2, step do
    for x = -size / 2, size / 2, step do
      table.insert(vertices, {x, 0, z})
      table.insert(vertices, {x, 0, z + step})
      table.insert(vertices, {x + step, 0, z})
      table.insert(vertices, {x, 0, z + step})
      table.insert(vertices, {x + step, 0, z + step})
      table.insert(vertices, {x + step, 0, z})
    end
  end
  return vertices
end

local function terrain_fn(x, z)
  return 4 * (lovr.math.noise(x * 0.05, z * 0.05) - 0.5)
end

function lovr.load()
  size = 50
  world = lovr.physics.newWorld(0, -9.81, 0, false)
  lovr.graphics.setBackgroundColor(0.208, 0.208, 0.275)
  local vertices, indices = grid(size, 100)
  for vi = 1, #vertices do
    local x,y,z = unpack(vertices[vi])
    vertices[vi][2] = terrain_fn(x, z) -- elevate grid to terrain height
  end
  mesh = lovr.graphics.newMesh(vertices)
  world:newTerrainCollider(size, terrain_fn) -- use callback to define elevations
  box_colliders = {}
end

function lovr.update(dt)
  if lovr.timer.getTime() % 1 < dt then -- spawn new box each second
    local collider = world:newBoxCollider(
      lovr.math.randomNormal(size / 10, 0),
      lovr.math.randomNormal(1, 20),
      lovr.math.randomNormal(size / 10, 0),
      1)
    table.insert(box_colliders, collider)
  end
  world:update(1 / 60)
end

function lovr.draw(pass)
  pass:setColor(0.925, 0.745, 0.137)
  for _, collider in ipairs(box_colliders) do
    pass:box(mat4(collider:getPose()))
  end

  pass:setColor(0.565, 0.404, 0.463)
  pass:draw(mesh)

  pass:setWireframe(true)
  pass:setColor(0.388, 0.302, 0.412, 0.1)
  pass:draw(mesh)
end
