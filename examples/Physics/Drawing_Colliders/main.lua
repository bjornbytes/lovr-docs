--[[ A utility function that draws all possible physics colliders and joint geometry

Useful for debugging physics (to see if colliders line up with rendered geometry),
and for experimenting and prototyping with physics, to get the rendering out of way.   --]]

local world
local count = 100

function lovr.load()
  gravity = gravity or 2
  sleepingAllowed = sleepingAllowed or false
  world = lovr.physics.newWorld(0, -gravity, 0, sleepingAllowed)
  -- ground plane
  local box = world:newBoxCollider(vec3(0, 0, 0), vec3(20, 0.1, 20))
  box:setKinematic(true)
  box:setUserData({1, 1, 1})
end


function lovr.update(dt)
  world:update(1 / 72) -- simulation is more stable if executed with fixed step
  -- every 100ms add random shape until there's enough of them
  if lovr.timer.getTime() % 0.1 < dt and count > 0 then
    local collider
    local colliderType = ({'box', 'sphere', 'cylinder', 'capsule'})[count % 4 + 1]
    local position = vec3(2 - 4 * lovr.math.random(), 4, 1 - 2 * lovr.math.random())
    if     colliderType == 'box' then
      local size = vec3(0.1, 0.2, 0.3)
      collider = world:newBoxCollider(position, size)
    elseif colliderType == 'sphere' then
      local radius = 0.2
      collider = world:newSphereCollider(position, radius)
    elseif colliderType == 'cylinder' then
      local radius, length = 0.1, 0.3
      collider = world:newCylinderCollider(position, radius, length)
    elseif colliderType == 'capsule' then
      local radius, length = 0.1, 0.3
      collider = world:newCapsuleCollider(position, radius, length)
    end
    local shade = 0.2 + 0.6 * lovr.math.random()
    collider:setUserData({shade, shade, shade})
    collider:setOrientation(math.pi, lovr.math.random(), lovr.math.random(), lovr.math.random())
    count = count - 1
  end
end


function lovr.draw(pass)
  for i, collider in ipairs(world:getColliders()) do
    -- rendering shapes of each collider
    drawCollider(pass, collider)
    -- debug geometry for joints (no joints are used in this example)
    drawAttachedJoints(pass, collider)
  end
end


function drawCollider(pass, collider)
  local color = collider:getUserData()
  local shape = collider:getShapes()[1]
  local alpha = shape:isSensor() and 0.2 or 1.0
  pass:setColor(color or 0x202020, alpha)
  -- shapes
  for _, shape in ipairs(collider:getShapes()) do
    local shapeType = shape:getType()
    local x,y,z, angle, ax,ay,az = collider:getPose()
    -- draw primitive at collider's position with correct dimensions
    if shapeType == 'box' then
      local sx, sy, sz = shape:getDimensions()
      pass:box(x,y,z, sx,sy,sz, angle, ax,ay,az)
    elseif shapeType == 'sphere' then
      pass:sphere(x,y,z, shape:getRadius())
    elseif shapeType == 'cylinder' then
      local l, r = shape:getLength(), shape:getRadius()
      local x,y,z, angle, ax,ay,az = collider:getPose()
      pass:cylinder(x,y,z, r, l, angle, ax,ay,az)
    elseif shapeType == 'capsule' then
      local l, r = shape:getLength(), shape:getRadius()
      local x,y,z, angle, ax,ay,az = collider:getPose()
      pass:capsule(x,y,z, r, l, angle, ax,ay,az)
    end
  end
end


function drawAttachedJoints(pass, collider)
  pass:setColor(1,1,1,0.3)
  -- joints are attached to two colliders; function draws joint for second collider
  for j, joint in ipairs(collider:getJoints()) do
    local anchoring, attached = joint:getColliders()
    if attached == collider then
      jointType = joint:getType()
      if jointType == 'ball' then
        local x1, y1, z1, x2, y2, z2 = joint:getAnchors()
        drawAnchor(pass, vec3(x1,y1,z1))
        drawAnchor(pass, vec3(x2,y2,z2))
      elseif jointType == 'slider' then
        local position = joint:getPosition()
        local x,y,z = anchoring:getPosition()
        drawAxis(pass, vec3(x,y,z), vec3(joint:getAxis()))
      elseif jointType == 'distance' then
        local x1, y1, z1, x2, y2, z2 = joint:getAnchors()
        drawAnchor(pass, vec3(x1,y1,z1))
        drawAnchor(pass, vec3(x2,y2,z2))
        drawAxis(pass, vec3(x2,y2,z2), vec3(x1, y1, z1) - vec3(x2,y2,z2))
      elseif jointType == 'hinge' then
        local x1, y1, z1, x2, y2, z2 = joint:getAnchors()
        drawAnchor(pass, vec3(x1,y1,z1))
        drawAnchor(pass, vec3(x2,y2,z2))
        drawAxis(pass, vec3(x1,y1,z1), vec3(joint:getAxis()))
      end
    end
  end
end


function drawAnchor(pass, origin)
  pass:sphere(origin, .02)
end


function drawAxis(origin, axis)
  pass:line(origin, origin + axis:normalize() * 0.3)
end
