shader = require 'shader'

function lovr.load()
  world = lovr.physics.newWorld()

  -- Create the ground
  world:newBoxCollider(0, 0, 0, 10, .01, 10):setKinematic(true)

  -- Create boxes!
  boxes = {}
  for x = -1, 1, .25 do
    for y = .125, 2, .25 do
      local box = world:newBoxCollider(x, y, -2 - y / 10, .25)
      table.insert(boxes, box)
    end
  end

  controllerBoxes = {}

  lovr.timer.step() -- Reset the timer before the first update
end

function lovr.update(dt)
  for i, controller in ipairs(lovr.headset.getControllers()) do
    if not controllerBoxes[i] then
      controllerBoxes[i] = world:newBoxCollider(0, 0, 0, .25)
      controllerBoxes[i]:setKinematic(true)
    end
    controllerBoxes[i]:setPosition(controller:getPosition())
    controllerBoxes[i]:setOrientation(controller:getOrientation())
  end

  -- Update the physics simulation
  world:update(dt)
end

-- A helper function for drawing boxes
function drawBox(box)
  local x, y, z = box:getPosition()
  lovr.graphics.cube('fill', x, y, z, .25, box:getOrientation())
end

function lovr.draw()
  lovr.graphics.setBackgroundColor(.8, .8, .8)
  lovr.graphics.setShader(shader)

  lovr.graphics.setColor(1, 0, 0)
  for i, box in ipairs(boxes) do
    drawBox(box)
  end

  lovr.graphics.setColor(0, 0, 1)
  for i, box in ipairs(controllerBoxes) do
    drawBox(box)
  end
end
