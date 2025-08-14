local mirrorPose = lovr.math.newMat4(0, 1.65, -0.75)
local inverseMirrorPose = lovr.math.newMat4(mirrorPose):invert()
local mirrorSize = vector(0.6, 1.2, 1)

local function draw_mirror(pass, outline)
  pass:push()
  pass:transform(mirrorPose)
  pass:scale(mirrorSize)
  pass:plane(nil, outline and 'line' or 'fill')
  pass:pop()
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

  pass:push()
  pass:transform(lovr.headset.getPose())

  pass:push()
  pass:scale(.09, .12, .11)
  pass:setColor(0x8d697a)
  pass:sphere() -- head
  pass:pop()

  pass:push()
  pass:translate(0, -0.02, -0.15)
  pass:rotate(-0.2, 1,0,0)
  pass:scale(0.015, 0.02, 0.03)
  pass:setColor(0xd08159)
  pass:cylinder() -- nose
  pass:pop()

  pass:pop()

  for _, hand in ipairs(lovr.headset.getHands()) do
    local skeleton = lovr.headset.getSkeleton(hand)
    if skeleton then
      for _, bone in ipairs(skeleton) do
        local x, y, z, _, angle, ax, ay, az = unpack(bone)
        pass:box(x, y, z, 0.017, 0.012, 0.019, angle, ax, ay, az) -- hand bone
      end
    else
      pass:push()
      pass:transform(lovr.headset.getPose(hand))
      pass:scale(.03, .07, .09)
      pass:box() -- palm
      pass:pop()
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
  pass:transform(inverseMirrorPose)
  pass:setWinding('clockwise') -- invert the winding to account for the flip
  draw_scene(pass)
  pass:setWinding('counterclockwise')
  pass:setStencilTest()

  pass:pop()

  pass:setColor(0x000000, 0.3)
  draw_mirror(pass, false) -- glass tint
end
