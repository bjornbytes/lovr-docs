-- This demo renders a scene with several uses of stencil maps (skip down to comment "Stencils here")
--
-- Sample contributed by andi mcc

local scene = {}

function scene.load()
  -- So we can see the effects of the stencils, we want to put some things in our scene.

  -- A checkerboard floor:
  scene.floorSize = 6

  -- A series of sideways-drifting cubes (these will be stenciled)
  scene.driftCubeCount = 60
  scene.boundMin = lovr.math.newVec3(-10, -1, -10)
  scene.boundMax = lovr.math.newVec3( 10,  9,  10)
  scene.speed = 1
  scene.driftCubeSize = 0.6
  scene.driftCubes = {}
  for i=1,scene.driftCubeCount do
    scene.generateDriftCube(i, true)
  end

  -- A 3x3 cube made of two different stencil types
  scene.stencilCubeCenter = lovr.math.newVec3(0, 1.5, -0.5)
  scene.stencilCubeSize = 0.25
  scene.stencilCubeRotate = 0
  scene.stencilCubeRotateSpeed = 1
  scene.stencilCubes = {}
  for z=-1,1 do for y=-1,1 do for x=-1,1 do -- Iterate over every cube
    if not (x==0 and y==0 and z==0) then -- Except the center
      table.insert(scene.stencilCubes, {lovr.math.newVec3(x,y,z), math.random(1,2)}) -- Cube center and stencil type
    end
  end end end

  -- Three cubemap skyboxes, of different colors
  scene.skybox = {}
  local skyboxTextureSize = 32
  local bandSize=3
  for cube_index,colors in ipairs{
    {{1, 0.5, 1}, {1,1,1}},     -- Fuschia and white
    {{1, 1, 0.5},   {0,0,0}},   -- Yellow and black
    {{1,1,1}, {0.9,0.9,0.9}},   -- White and silver
  } do
    local layers = {}
    for layer=1,6 do -- 6 layers to a cubemap
      local data = lovr.data.newImage(skyboxTextureSize, skyboxTextureSize, "rgba8")
      for y=1,skyboxTextureSize do for x=1,skyboxTextureSize do
        local isBorder = x==1 or x==skyboxTextureSize or y==1 or y==skyboxTextureSize -- Solid color in corners
        local direction = cube_index==3 and -1 or 1                          -- Reverse direction on third cubemap
        local whichColor = (isBorder or ((x+direction*y-2)%(bandSize*2)>=bandSize)) and 1 or 2 -- Diagonal stripes
        data:setPixel(x-1,y-1,unpack(colors[whichColor]))
      end end
      table.insert(layers, data)
    end
    table.insert(scene.skybox, lovr.graphics.newTexture(layers))
  end

  scene.sampler = lovr.graphics.newSampler({filter="nearest"})
end

local function randomQuaternion() -- Generate one random rotation
  -- Formula from http://planning.cs.uiuc.edu/node198.html
  local u,v,w = math.random(), math.random(), math.random()
  return lovr.math.newQuat(
    math.sqrt(1-u)*math.sin(2*v*math.pi),
    math.sqrt(1-u)*math.cos(2*v*math.pi),
    math.sqrt(u)*math.sin(2*w*math.pi),
    math.sqrt(u)*math.cos(2*w*math.pi),
    true -- Raw components
  )
end

function scene.generateDriftCube(i, randomX) -- Generate one cube with random position and color and a random rotational velocity
  local cube = {}
  cube.at = lovr.math.newVec3()
  if randomX then
    cube.at.x = scene.boundMin.x + math.random()*(scene.boundMax.x-scene.boundMin.x)
  else
    cube.at.x = scene.boundMin.x
  end
  cube.at.y = scene.boundMin.y + math.random()*(scene.boundMax.y-scene.boundMin.y)
  cube.at.z = scene.boundMin.z + math.random()*(scene.boundMax.z-scene.boundMin.z)

  cube.rotateBasis = randomQuaternion()
  cube.rotateTarget = lovr.math.newQuat(cube.rotateBasis:conjugate())
  cube.rotate = cube.rotateBasis
  scene.driftCubes[i] = cube
end

function scene.update(dt) -- On each frame, move each cube and spin it a little
  for i,cube in ipairs(scene.driftCubes) do
    cube.at.x = cube.at.x + scene.speed*dt
    if cube.at.x > scene.boundMax.x then -- If cube left the scene bounds respawn it
      scene.generateDriftCube(i)
    else
      local rotateAmount = (cube.at.x - scene.boundMin.x)/(scene.boundMax.x-scene.boundMin.x)
      cube.rotate = cube.rotateBasis:slerp( cube.rotateTarget, rotateAmount )
    end
  end

  -- Also rotate the center cube
  scene.stencilCubeRotate = scene.stencilCubeRotate + dt*scene.stencilCubeRotateSpeed
end

function scene.draw(pass)
  -- Drawing without culling can make stencils or transparency look weird. We'll be using both...
  pass:setCullMode('back')

  -- First, draw the skybox
  pass:setSampler(scene.sampler)
  pass:skybox(scene.skybox[3])

  -- Next, draw a floor
  local floorRecenter = scene.floorSize/2 + 0.5
  for x=1,scene.floorSize do for y=1,scene.floorSize do
    if (x+y)%2==0 then
      pass:setColor(0.25,0.25,0.25)
    else
      pass:setColor(0.35,0.35,0.35)
    end
    pass:plane(x-floorRecenter,0,y-floorRecenter, 1,1, -math.pi/2,1,0,0) -- Face up
  end end
  pass:setColor(1,1,1,1)

  -- Stencils here
  -- Using stencils involves drawing twice, once with a stencil write set and once with a stencil test set.

  -- Example 1: Using stencils to "paint" scenes

  -- Each sub-cube in our 3x3 cube will write a different value to the stencil buffer, 1 or 2.
  pass:setColorWrite() -- In the color spectrum, these cubes are completely invisible! They write only stencil and depth.
  pass:push() -- Position ourselves in the right place
  pass:translate(scene.stencilCubeCenter)
  pass:rotate(scene.stencilCubeRotate, 0,1,0)
  for _, cube in ipairs(scene.stencilCubes) do
    local center, stencilValue = unpack(cube)

    -- Draw to stencil (but only when we pass the depth test)
    pass:setStencilWrite({"keep", "keep", "replace"}, stencilValue)
    pass:cube(center*scene.stencilCubeSize, scene.stencilCubeSize)

  end
  pass:pop()

  pass:setStencilWrite() -- Reset stencil write
  pass:setColorWrite(true) -- Reset color write

  -- Now that we've painted the stencil buffer, let's draw something with depth-- like a skybox
  pass:setDepthTest() -- Turn off depth test because the skybox is "behind" the cubes
  for stencilValue=1,2 do
    pass:setStencilTest("equal", stencilValue) -- Commands after here will only draw on pixels where the stencil value is right

    pass:skybox(scene.skybox[stencilValue])
  end
  pass:setDepthTest("gequal") -- Turn depth test back on

  -- Example 2: Using stencils to prevent collision

  -- Here we will write AND test the stencil at the same time! In this step we want to draw a bunch of 50%-transparent cubes,
  -- But we don't want any cubes to overlap each other. We want each cube to look like a "world of shadow".
  -- The cubes can darken the skybox and the 3x3 cube, but not any pixel where another cube has already drawn.

  pass:setStencilTest("notequal", 3) -- We will write the value "3", but refuse to write any pixel where a 3 is already present.
  pass:setStencilWrite("replace", 3) -- Note we haven't cleared the stencil buffer, so we can't reuse values 1 or 2.
  for _,cube in ipairs(scene.driftCubes) do
    pass:setColor(0.75,0.5,0.5,0.5)
    pass:cube(cube.at.x, cube.at.y, cube.at.z, scene.driftCubeSize, cube.rotate:unpack())
  end

  -- The stencil state will reset at the end of this lovr.draw, but let's clear it anyway.
  pass:setStencilWrite()
  pass:setStencilTest()
end

-- Handle lovr

function lovr.load()
  lovr.graphics.setBackgroundColor(1,0,0) -- Red to show up clearly if something goes wrong
  scene.load()
end

function lovr.update(dt)
  scene.update(dt)
end

function lovr.draw(pass)
  scene.draw(pass)
end
