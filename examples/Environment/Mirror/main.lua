local mirrorPose = lovr.math.newMat4(0, 1.65, -0.75)
local mirrorSize = lovr.math.newVec3(0.6, 1.2, 1)

local function draw_mirror(outline)
  local pose = mat4(mirrorPose)
  pose:scale(mirrorSize)
  lovr.graphics.plane(outline and 'line' or 'fill', pose)
end

local function draw_scene()
  lovr.graphics.setColor(0x203c56)
  lovr.graphics.box('fill', 0, 0, 0,  4, 0.05, 4) -- floor
  lovr.graphics.setColor(0x544e68)
  lovr.graphics.box('fill', 0, 1, -0.5,  1, 0.1, 0.4) -- a table
  lovr.graphics.setColor(0xffaa5e)
  lovr.graphics.cylinder(0.2, 1.2, -0.4,  0.3,  math.pi/2, 1,0,0, 0.07, 0.05, true, 8) -- a vase
  lovr.graphics.setColor(0xffd4a3)
  lovr.graphics.box('fill', 0.1, 1.1, -0.6,  0.12, 0.1, 0.12) -- a jewelry box
  local pose = mat4()
  pose:set(lovr.headset.getPose('head')):scale(0.09, 0.12, 0.11)
  lovr.graphics.setColor(0x8d697a)
  lovr.graphics.sphere(pose) -- head
  lovr.graphics.setColor(0xd08159)
  pose:set(lovr.headset.getPose('head'))
  pose:translate(0, -0.02, -0.1)
  pose:rotate(-0.2, 1,0,0)
  pose:scale(0.03, 0.04, 0.03)
  lovr.graphics.cylinder(pose, 0.015, 0.02) -- nose
  for _, handness in ipairs(lovr.headset.getHands()) do
    local skeleton = lovr.headset.getSkeleton(handness)
    if skeleton then
      for _, bone in ipairs(skeleton) do
        lovr.graphics.box('fill', pose:set(unpack(bone)):scale(0.017, 0.012, 0.019)) -- hand bone
      end
    else
      pose:set(lovr.headset.getPose(handness)):scale(0.03, 0.07, 0.09)
      lovr.graphics.box('fill', pose) -- palm
    end
  end
end

function lovr.load()
  lovr.graphics.setCullingEnabled(true)
  lovr.graphics.setBackgroundColor(0x0d2b45)
  lovr.graphics.setLineWidth(5)
end

function lovr.draw()
  draw_scene()
  lovr.graphics.setColor(0xffecd6)
  draw_mirror(true) -- mirror frame
  lovr.graphics.push()
  lovr.graphics.stencil(draw_mirror, 'replace', 1, false)
  lovr.graphics.setStencilTest('equal', 1)
  lovr.graphics.transform(mirrorPose)
  lovr.graphics.scale(1, 1, -1) -- after Z-flip all triangles will change their windings
  lovr.graphics.transform(mat4(mirrorPose):invert())
  lovr.graphics.setWinding('clockwise') -- invert the winding to account for the flip
  draw_scene()
  lovr.graphics.setWinding('counterclockwise')
  lovr.graphics.setStencilTest()
  lovr.graphics.pop()
  lovr.graphics.setColor(0x000000, 0.3)
  draw_mirror(false) -- glass tint
end
