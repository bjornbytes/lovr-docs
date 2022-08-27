local mirrorPose = lovr.math.newMat4(0, 1.65, -0.75)
local mirrorSize = lovr.math.newVec3(0.6, 1.2, 1)

local function draw_mirror(pass, outline)
  local pose = mat4(mirrorPose)
  pose:scale(mirrorSize)
  pass:plane(pose, outline and 'line' or 'fill')
end

local function draw_scene(pass)
  pass:setColor(0x203c56)
  pass:box(0, 0, 0,  4, 0.05, 4) -- floor
  pass:setColor(0x544e68)
  pass:box(0, 1, -0.5,  1, 0.1, 0.4) -- a table
  pass:setColor(0xffaa5e)
  pass:cylinder(0.2, 1.2, -0.4,  .06,0.3,  math.pi/2, 1,0,0, true, 0,2*math.pi, 8) -- a vase
  pass:setColor(0xffd4a3)
  pass:box(0.1, 1.1, -0.6,  0.12, 0.1, 0.12) -- a jewelry box
  local pose = mat4()
  pose:set(lovr.headset.getPose('head')):scale(0.09, 0.12, 0.11)
  pass:setColor(0x8d697a)
  pass:sphere(pose) -- head
  pass:setColor(0xd08159)
  pose:set(lovr.headset.getPose('head'))
  pose:translate(0, -0.02, -0.1)
  pose:rotate(-0.2, 1,0,0)
  pose:scale(0.015, 0.02, 0.03)
  pass:cylinder(pose) -- nose
  for _, handness in ipairs(lovr.headset.getHands()) do
    local skeleton = lovr.headset.getSkeleton(handness)
    if skeleton then
      for _, bone in ipairs(skeleton) do
        pass:box(pose:set(unpack(bone)):scale(0.017, 0.012, 0.019)) -- hand bone
      end
    else
      pose:set(lovr.headset.getPose(handness)):scale(0.03, 0.07, 0.09)
      pass:box(pose) -- palm
    end
  end
end

function lovr.load()
  lovr.graphics.setBackgroundColor(0x0d2b45)
end

function lovr.draw(pass)
  pass:setCullMode('back')
  draw_scene(pass)
  pass:setColor(0xffecd6)
  draw_mirror(pass, true) -- mirror frame
  pass:push()
  pass:setStencilWrite('replace', 1)
  pass:setColorWrite(false)
  pass:setDepthWrite(false)
  draw_mirror(pass)
  pass:setDepthWrite(true)
  pass:setColorWrite(true)
  pass:setStencilWrite()
  pass:setStencilTest('equal', 1)
  pass:transform(mirrorPose)
  pass:scale(1, 1, -1) -- after Z-flip all triangles will change their windings
  pass:transform(mat4(mirrorPose):invert())
  pass:setWinding('clockwise') -- invert the winding to account for the flip
  draw_scene(pass)
  pass:setWinding('counterclockwise')
  pass:setStencilTest()
  pass:pop()
  pass:setColor(0x000000, 0.3)
  draw_mirror(pass, false) -- glass tint
end
