local fragmentShader = require("shader")

local mesh1, mesh2
local mesh4Instance
local mesh1Program, mesh3Program, mesh4Program
local gridSize = 8

-- Call this function with a string containing a glsl function preTransform()
-- Which maps world space coordinates to world space coordinates.
local function makeShader(prefix)
  return lovr.graphics.newShader(prefix .. [[
out vec3 lightDirection;
out vec3 normalDirection;

vec3 lightPosition = vec3(10, 10, 3);

vec4 position(mat4 projection, mat4 transform, vec4 _vertex) {
  vec4 vertex = preTransform(_vertex);

  vec4 vVertex = transform * vertex;
  vec4 vLight = lovrView * vec4(lightPosition, 1.);

  lightDirection = normalize(vec3(vLight - vVertex));
  normalDirection = normalize(lovrNormalMatrix * lovrNormal);

  return projection * transform * vertex;
}
]], fragmentShader)
end

-- This "standard" program is the same as the standard light shader from the other examples-- it does nothing.
local mesh1Program = makeShader("vec4 preTransform(vec4 v) { return v; }")

local rotate = 0
local animate = 0

function lovr.load()
  lovr.graphics.setCullingEnabled(true)

--  mesh1Program()

  mesh1 = lovr.graphics.newMesh({{ 'lovrPosition', 'float', 3 }, { 'lovrNormal', 'float', 3 }}, 3)
  mesh1:setVertices({{0,0,0, 0,0,1}, {1,0,0, 0,0,1}, {0,1,0, 0,0,1}}) -- A triangle

  mesh2 = lovr.graphics.newMesh({{ 'lovrPosition', 'float', 3 }, { 'lovrNormal', 'float', 3 }}, 24, 'triangles')
  local mesh2Vertices = { -- Coordinates for mesh 2 (a cube)
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
  }

  -- This cube covers the space 0..1, so it's centered at (0.5, 0.5, 0.5).
  -- Edit the first three coordinates of each vertex to center it at (0,0,0):
  for _, v in ipairs(mesh2Vertices) do
    for i=1,3 do
      v[i] = v[i] - 0.5
    end
  end

  mesh2:setVertices(mesh2Vertices)

  mesh2:setVertexMap({ -- Indexes for mesh 2
    1,  2,  3,  1,  3,  4,  -- Face front
    5,  6,  7,  5,  7,  8,  -- Face top
    9,  10,  11, 9,  11, 12, -- Face right
    13, 14, 15, 13, 15, 16, -- Face left
    17, 18, 19, 17, 19, 20, -- Face back
    21, 22, 23, 21, 23, 24, -- Face bottom
  })

  mesh3Program = makeShader([[
  uniform int gridSize;
  uniform float animate;
  vec4 preTransform(vec4 v) {
    int x = gl_InstanceID % gridSize;
    int y = (gl_InstanceID / gridSize) % gridSize;
    int z = (gl_InstanceID / gridSize) / gridSize;
    float cubeSize = (sin(x + y + z + animate) + 1) / 2;
    return v * vec4(cubeSize,cubeSize,cubeSize,1) + vec4(x,y,z,0) - vec4(gridSize, gridSize, gridSize, 0)/2;
  }
  ]])
  mesh3Program:send("gridSize", gridSize)
  --local vertexData = lovr.data.newVertexData(3, {{ 'position', 'float', 3 }, { 'normal', 'float', 3 }})
  --vertexData:setVertices({{0,0,0}, {0,1,0}, {1,0,0}})
--  mesh:attachAttribute(instancingMesh, 'instancedPosition') -- NYI, attaches an attribute from a different mesh onto this mesh
--  mesh:drawInstanced(500, x, y, z, ...) -- works
end

function lovr.update(dt)
--  rotate = rotate + dt/math.pi/8
  animate = animate + dt/math.pi*2
end

function lovr.draw(eye)
  lovr.graphics.setShader(mesh1Program)
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

  lovr.graphics.setShader(mesh3Program)
  lovr.graphics.push()
  lovr.graphics.rotate(2 * math.pi/2, 0, 1, 0)
  lovr.graphics.translate(0, 00, -2.5)
  lovr.graphics.scale(1/gridSize)
  mesh3Program:send("animate", animate)
  mesh2:drawInstanced(gridSize*gridSize*gridSize, 0,0,0)
  lovr.graphics.pop()

  lovr.graphics.setShader(mesh1Program)
  lovr.graphics.push()
  lovr.graphics.rotate(3 * math.pi/2, 0, 1, 0)
  lovr.graphics.translate(0, 0, -2)
  lovr.graphics.cube('fill', 0,0,0)
  --mesh1:draw(0,0,0)
  lovr.graphics.pop()

end
