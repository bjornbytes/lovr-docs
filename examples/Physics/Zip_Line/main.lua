--[[ A zipline demo combining several joint types

Capsule is suspended from trolley using distance joint. Trolley is attached to hanger
using slider joint. Beware that slider joint loses its accuracy/stability when attached
objects are too far away. Increasing object mass of helps with stability.            --]]

local world
local p1 = Vec3(1, 1.9, -1)
local p2 = Vec3(-1, 2, -1)
local p3 = Vec3(-1, 1.5, -1)

function lovr.load()
  world = lovr.physics.newWorld(0, -3, 0, false)
  local hanger = world:newBoxCollider(p1, 0.1, 0.1, 0.3)
  hanger:setKinematic(true)
  local trolley = world:newBoxCollider(p2, 0.2, 0.2, 0.5)
  trolley:setRestitution(0.7)
  -- calculate axis that passes through centers of hanger and trolley
  local sliderAxis = p1 - p2
  -- constraint the trolley so that it can only slide along specified axis without any rotation
  joint = lovr.physics.newSliderJoint(hanger, trolley, sliderAxis)
  -- hang a weight from trolley
  local weight = world:newCapsuleCollider(p3, 0.1, 0.4)
  weight:setOrientation(math.pi/2, 1,0,0)
  weight:setLinearDamping(0.005)
  weight:setAngularDamping(0.01)
  local joint = lovr.physics.newDistanceJoint(trolley, weight,
    p2, p3 + vec3(0, 0.3, 0))
  joint:setSpring(4, 0.5) -- make the hanging rope streachable

  lovr.graphics.setBackgroundColor(0.1, 0.1, 0.1)
end


function lovr.update(dt)
  world:update(dt)
end


function lovr.draw(pass)
  pass:line(p1, p2)
  for i, collider in ipairs(world:getColliders()) do
    pass:setColor(0.6, 0.6, 0.6)
    local shape = collider:getShapes()[1]
    local shapeType = shape:getType()
    local x,y,z, angle, ax,ay,az = collider:getPose()
    if shapeType == 'box' then
      local sx, sy, sz = shape:getDimensions()
      pass:box(x,y,z, sx,sy,sz, angle, ax,ay,az)
    elseif shapeType == 'capsule' then
      pass:setColor(0.4, 0, 0)
      local l, r = shape:getLength(), shape:getRadius()
      local x,y,z, angle, ax,ay,az = collider:getPose()
      pass:capsule(x,y,z, r, l, angle, ax,ay,az)
    end
  end
end
