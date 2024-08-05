local random = lovr.math.random
local boxes = {}
local selectedBox = nil
local hitpoint = lovr.math.newVec3()
local red = { 1, .5, .5 }
local green = { .5, 1, .5 }

function lovr.load()
  lovr.graphics.setBackgroundColor(.2, .2, .22)
  world = lovr.physics.newWorld(0, 0, 0)

  -- Make a bunch of random spinning boxes XD
  for x = -3, 3 do
    for z = 1, 10 do
      local y = .5 + lovr.math.randomNormal(.1)
      local box = world:newBoxCollider(x, y, -z, .28)
      box:setOrientation(random(2 * math.pi), random(), random(), random())
      box:setAngularVelocity(random(), random(), random())
      table.insert(boxes, box)
    end
  end
end

function lovr.update(dt)
  selectedBox = nil

  world:update(dt)

  local ox, oy, oz = lovr.headset.getPosition('hand/left/point')
  local dx, dy, dz = quat(lovr.headset.getOrientation('hand/left/point')):direction():mul(50):unpack()
  local collider, shape, x, y, z = world:raycast(ox, oy, oz, ox + dx, oy + dy, oz + dz)

  if collider then
    selectedBox = collider
    hitpoint:set(x, y, z)
  end
end

function lovr.draw(pass)
  -- Boxes
  for i, box in ipairs(boxes) do
    pass:setColor(box == selectedBox and green or red)
    pass:cube(vec3(box:getPosition()), .28, quat(box:getOrientation()))
  end

  -- Dot
  if selectedBox then
    pass:setColor(0, 0, 1)
    pass:sphere(hitpoint, .01)
  end

  -- Laser pointer
  local hand = vec3(lovr.headset.getPosition('hand/left/point'))
  local direction = quat(lovr.headset.getOrientation('hand/left/point')):direction()
  pass:setColor(1, 1, 1)
  pass:line(hand, selectedBox and hitpoint or (hand + direction * 50))
end
