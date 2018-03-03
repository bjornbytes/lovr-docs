local shader = require("shader")

local mesh1, mesh2, mesh3, mesh4

local rotate = 0

function lovr.load()
  lovr.graphics.setCullingEnabled(true)

  mesh1 = lovr.graphics.newMesh({{ 'lovrPosition', 'float', 3 }, { 'lovrNormal', 'float', 3 }}, 3)
  mesh1:setVertices({{0,0,0, 0,0,1}, {1,0,0, 0,0,1}, {0,1,0, 0,0,1}}) -- A triangle

  mesh2 = lovr.graphics.newMesh({{ 'lovrPosition', 'float', 3 }, { 'lovrNormal', 'float', 3 }}, 24, 'triangles')
  mesh2:setVertices({ -- Coordinates for mesh 2 (a cube)
    {0,0,0, 0,0,-1}, -- Face front
    {0,1,0, 0,0,-1},
    {1,1,0, 0,0,-1},
    {1,0,0, 0,0,-1},

    {1,1,0, 0,1,0}, -- Face top
    {0,1,0, 0,1,0},
    {0,1,1, 0,1,0},
    {1,1,1, 0,1,0},

    {1,0,0, 1,0,0}, -- Face right
    {1,1,0, 1,0,0},
    {1,1,1, 1,0,0},
    {1,0,1, 1,0,0},

    {0,0,0, -1,0,0}, -- Face left
    {0,0,1, -1,0,0},
    {0,1,1, -1,0,0},
    {0,1,0, -1,0,0},

    {1,1,1, 0,0,1}, -- Face back
    {0,1,1, 0,0,1},
    {0,0,1, 0,0,1},
    {1,0,1, 0,0,1},

    {0,0,0, 0,-1,0}, -- Face bottom
    {1,0,0, 0,-1,0},
    {1,0,1, 0,-1,0},
    {0,0,1, 0,-1,0}
  })

  mesh2:setVertexMap({ -- Indexes for mesh 2
    1,  2,  3,  1,  3,  4,  -- Face front
    5,  6,  7,  5,  7,  8,  -- Face top
    9,  10,  11, 9,  11, 12, -- Face right
    13, 14, 15, 13, 15, 16, -- Face left
    17, 18, 19, 17, 19, 20, -- Face back
    21, 22, 23, 21, 23, 24, -- Face bottom
  })

  --local vertexData = lovr.data.newVertexData(3, {{ 'position', 'float', 3 }, { 'normal', 'float', 3 }})
  --vertexData:setVertices({{0,0,0}, {0,1,0}, {1,0,0}})
--  mesh:attachAttribute(instancingMesh, 'instancedPosition') -- NYI, attaches an attribute from a different mesh onto this mesh
--  mesh:drawInstanced(500, x, y, z, ...) -- works
end

function lovr.update(dt)
  --rotate = rotate + dt/math.pi/2
end

function lovr.draw(eye)
  lovr.graphics.setShader(shader)
  lovr.graphics.setColor(1,1,1,1)
  lovr.graphics.rotate(rotate, 0, 1, 0)

  lovr.graphics.push()
  lovr.graphics.translate(0, 0, -2)
  mesh1:draw(0,0,0)
  lovr.graphics.pop()

  lovr.graphics.push()
  lovr.graphics.rotate(1 * math.pi/2, 0, 1, 0)
  lovr.graphics.translate(0, 0, -2)
  mesh2:draw(0,0,0)
  lovr.graphics.pop()

  lovr.graphics.push()
  lovr.graphics.rotate(2 * math.pi/2, 0, 1, 0)
  lovr.graphics.translate(0, 0, -2)
  lovr.graphics.cube('fill', 0,0,0)
  --mesh1:draw(0,0,0)
  lovr.graphics.pop()

  lovr.graphics.push()
  lovr.graphics.rotate(3 * math.pi/2, 0, 1, 0)
  lovr.graphics.translate(0, 0, -2)
  lovr.graphics.cube('fill', 0,0,0)
  --mesh1:draw(0,0,0)
  lovr.graphics.pop()

end
