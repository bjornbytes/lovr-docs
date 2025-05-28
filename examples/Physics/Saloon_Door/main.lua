-- Physics construct of saloon doors using the motorized hinge joint

local world
local doorR, doorL
local passenger

function lovr.load()
  world = lovr.physics.newWorld(0, -9.8, 0, false)
  -- a static geometry that functions as door frame
  doorR = world:newBoxCollider(vec3( 0.55, 0.5, -1), vec3(1, 1, 0.2))
  doorL = world:newBoxCollider(vec3(-0.55, 0.5, -1), vec3(1, 1, 0.2))
  -- attach doors with vertical hinges
  local hingeR = lovr.physics.newHingeJoint(nil, doorR, vec3( 1, 0, -1), vec3(0,1,0))
  local hingeL = lovr.physics.newHingeJoint(nil, doorL, vec3(-1, 0, -1), vec3(0,1,0))
  -- set up motors to return the doors to their initial orientation
  hingeR:setMotorMode('position')
  hingeL:setMotorMode('position')
  hingeR:setMotorTarget(0)
  hingeL:setMotorTarget(0)
  -- a controlled capsule that moves in and out pushing the door both ways
  passenger = world:newCapsuleCollider(0, 0, 0,  0.4, 1)
  passenger:getShape():setOffset(0, 0.5, 0,  math.pi/2, 1, 0, 0)
  passenger:setKinematic(true)
  passenger:moveKinematic(vec3(0, 0, -4), nil, 3)
end

function lovr.draw(pass)
  for i, collider in ipairs(world:getColliders()) do
    pass:setColor(i / 3, i / 3, i / 3)
    local shape = collider:getShape()
    local pose = mat4(collider:getPose()) * mat4(shape:getOffset())
    local shape_type = shape:getType()
    if shape_type == 'box' then
      local size = vec3(collider:getShape():getDimensions())
      pass:box(pose:scale(size))
    elseif shape_type == 'capsule' then
      local l, r = shape:getLength(), shape:getRadius()
      pose:scale(r, r, l)
      pass:capsule(pose, segments)
    end
  end
end

function lovr.update(dt)
  local t = lovr.timer.getTime()
  -- every 3 seconds change the moving direction of capsule collider
  if t % 3 < dt then
    local _, _, z = passenger:getPosition()
    z = z > -1 and -4 or 2
    -- moveKinematic is prefered over setPosition as it will correctly set the passenger's velocity
    passenger:moveKinematic(vec3(0, 0, z), nil, 3)
  end
  world:update(dt)
end
