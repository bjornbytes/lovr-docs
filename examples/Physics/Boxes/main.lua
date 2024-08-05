function lovr.load()
  world = lovr.physics.newWorld()

  -- Create the ground
  ground = world:newBoxCollider(0, -1, 0, 50, 2, 50)
  ground:setKinematic(true)
  ground:setFriction(1.0)

  -- Create boxes!
  boxes = {}
  for x = -1, 1, .25 do
    for y = .125, 2, .2499 do
      local box = world:newBoxCollider(x, y, -2 - y / 5, .25)
      table.insert(boxes, box)
    end
  end

  controllerBoxes = {}

  lovr.timer.step() -- Reset the timer before the first update
  lovr.graphics.setBackgroundColor(.8, .8, .8)
end

local isFirstFrame = true

function lovr.update(dt)
  -- Update the physics simulation
  world:update(dt)

  -- Place boxes on controllers
  for i, hand in ipairs(lovr.headset.getHands()) do
    if not controllerBoxes[i] then
      controllerBoxes[i] = world:newBoxCollider(0, 0, 0, .25)
      controllerBoxes[i]:setKinematic(true)
    end
    controllerBoxes[i]:setPose(lovr.headset.getPose(hand))
  end
end

-- A helper function for drawing boxes
function drawBox(pass, box)
  local x, y, z = box:getPosition()
  pass:cube(x, y, z, .25, box:getOrientation())
end

function lovr.draw(pass)
  pass:setShader(shader)

  pass:setColor(1, 0, 0)
  for i, box in ipairs(boxes) do
    drawBox(pass, box)
  end

  if lovr.headset.getDriver() ~= 'desktop' then
    pass:setColor(0, 0, 1)
    for i, box in ipairs(controllerBoxes) do
      drawBox(pass, box)
    end
  end
end
