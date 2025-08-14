local random = lovr.math.random
local boxes = {}
local selectedBox = nil
local hitpoint = nil
local red = { 1, .5, .5 }
local green = { .5, 1, .5 }
local device = 'hand/left/point'

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

  local origin = vector(lovr.headset.getPosition(device))
  local direction = vector(lovr.headset.getDirection(device))
  local collider, shape, x, y, z = world:raycast(origin, origin + direction * 50)

  if collider then
    selectedBox = collider
    hitpoint = vector(x, y, z)
  end
end

function lovr.draw(pass)
  -- Boxes
  for i, box in ipairs(boxes) do
    pass:setColor(box == selectedBox and green or red)
    pass:cube(vector(box:getPosition()), .28, box:getOrientation())
  end

  -- Dot
  if selectedBox then
    pass:setColor(0, 0, 1)
    pass:sphere(hitpoint, .01)
  end

  -- Laser pointer
  local hand = vector(lovr.headset.getPosition(device))
  local direction = vector(lovr.headset.getDirection(device))
  pass:setColor(1, 1, 1)
  pass:line(hand, selectedBox and hitpoint or (hand + direction * 50))
end
