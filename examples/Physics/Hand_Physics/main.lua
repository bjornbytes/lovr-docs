--[[ Hand interaction with physics world: use trigger to solidify hand, grip to grab objects

To manipulate objects in world, we create box collider (palm) for each hand controller. This box
is updated to track location of controller.

The naive approach would be to set exact location and orientation of physical collider with values
from hand controller. This results in lousy and unconvincing collisions with other objects, as
physics engine doesn't know the speed of hand colliders at the moment of collision.

An improvement is to set linear and angular speed of kinematic hand colliders so that they
approach the target (actual location/orientation of hand controller). This works well for one
hand, however physics will start to glitch when you try to squeeze an object between two hands.
This is because kinematic hand controllers can never be affected by collision forces, so the
squeezed collider cannot push back against them and the collision cannot be resolved.

The approach taken here is to have hand controllers behave as normal dynamic colliders that can be
affected by other collisions. To track hand controllers, we apply force and torque on collider
objects that's proportional to distance from correct position.

This means hand colliders won't have 1:1 mapping with actual hand controllers, they will actually
'bend' under large force. Also the colliders can become stuck and buried beneath other objects.
This is frustrating to users, so in this example hand colliders can ghost through objects or
become solid, using the trigger button.

Grabbing objects is done by creating two joints between hand collider and object, to hold them
together. This enables pulling, stacking and throwing.                                      --]]

local hands = { -- palms that can push and grab objects
  colliders = {nil, nil},     -- physical objects for palms
  touching  = {nil, nil},     -- the collider currently touched by each hand
  holding   = {nil, nil},     -- the collider attached to palm
  solid     = {false, false}, -- hand can either pass through objects or be solid
} -- to be filled with as many hands as there are active controllers

local world
local collisionCallbacks = {}
local boxes = {}

local hand_torque = 20
local hand_force = 30000

function lovr.load()
  world = lovr.physics.newWorld(0, -2, 0, false) -- low gravity and no collider sleeping
  -- ground plane
  local box = world:newBoxCollider(vector(0, 0, 0), vector(20, 0.1, 20))
  box:setKinematic(true)
  table.insert(boxes, box)
  -- create a fort of boxes
  lovr.math.setRandomSeed(0)
  for angle = 0, 2 * math.pi, 2 * math.pi / 12 do
    for height = 0.3, 1.5, 0.4 do
      local orientation = quaternion(angle, 0,1,0)
      local position = orientation * vector(0, height, -1)
      local size = vector(0.3, 0.4, 0.2)
      local box = world:newBoxCollider(position, size)
      box:setOrientation(orientation)
      table.insert(boxes, box)
    end
  end
  -- make colliders for two hands
  for i = 1, 2 do
    hands.colliders[i] = world:newBoxCollider(vector(0,2,0), vector(0.04, 0.08, 0.08))
    hands.colliders[i]:setLinearDamping(0.7)
    hands.colliders[i]:setAngularDamping(0.9)
    hands.colliders[i]:setMass(0.5)
    registerCollisionCallback(hands.colliders[i],
      function(collider, world)
        -- store collider that was last touched by hand
        hands.touching[i] = collider
      end)
  end
end


function lovr.update(dt)
  -- override collision resolver to notify all colliders that have registered their callbacks
  world:update(dt, function(world)
    world:computeOverlaps()
    for shapeA, shapeB in world:overlaps() do
      local areColliding = world:collide(shapeA, shapeB)
      if areColliding then
        cbA = collisionCallbacks[shapeA]
        if cbA then cbA(shapeB:getCollider(), world) end
        cbB = collisionCallbacks[shapeB]
        if cbB then cbB(shapeA:getCollider(), world) end
      end
    end
  end)
  -- hand updates - location, orientation, solidify on trigger button, grab on grip button
  for i, hand in pairs(lovr.headset.getHands()) do
    -- align collider with controller by applying force (position) and torque (orientation)
    local handPosition = vector(lovr.headset.getPosition(hand))
    local handOrientation = quaternion(lovr.headset.getOrientation(hand))
    local colliderOrientation = quaternion(hands.colliders[i]:getOrientation())
    local rotation = handOrientation * colliderOrientation:conjugate()
    local angle, ax,ay,az = rotation:toangleaxis()
    angle = ((angle + math.pi) % (2 * math.pi) - math.pi) -- for minimal motion wrap to (-pi, +pi) range
    hands.colliders[i]:applyTorque(vector(ax, ay, az) * (angle * dt * hand_torque))
    local delta = vector(lovr.headset.getPosition(hand)) - vector(hands.colliders[i]:getPosition())
    hands.colliders[i]:applyForce(delta * dt * hand_force)
    -- solidify when trigger touched
    hands.solid[i] = lovr.headset.isDown(hand, 'trigger')
    hands.colliders[i]:setSensor(not hands.solid[i])
    -- hold/release colliders
    if lovr.headset.isDown(hand, 'grip') and hands.touching[i] and not hands.holding[i] then
      hands.holding[i] = hands.touching[i]
      -- grab object with ball joint to drag it, and slider joint to also match the orientation
      lovr.physics.newBallJoint(hands.colliders[i], hands.holding[i], hands.colliders[i]:getPosition())
      lovr.physics.newSliderJoint(hands.colliders[i], hands.holding[i], colliderOrientation:direction())
    end
    if lovr.headset.wasReleased(hand, 'grip') and hands.holding[i] then
      for _,joint in ipairs(hands.colliders[i]:getJoints()) do
        joint:destroy()
      end
      hands.holding[i] = nil
    end
  end
  hands.touching = {nil, nil} -- to be set again in collision resolver
end


function lovr.draw(pass)
  for i, collider in ipairs(hands.colliders) do
    pass:setColor(0.75, 0.56, 0.44)
    drawBoxCollider(pass, collider, not hands.solid[i])
  end
  lovr.math.setRandomSeed(0)
  for i, collider in ipairs(boxes) do
    local shade = 0.2 + 0.6 * lovr.math.random()
    pass:setColor(shade, shade, shade)
    drawBoxCollider(pass, collider)
  end
end


function drawBoxCollider(pass, collider, is_sensor)
  -- draw box
  pass:push()
  pass:transform(collider:getPose())
  pass:scale(collider:getShape():getDimensions())
  pass:box(nil, is_sensor and 'line' or 'fill')
  pass:pop()
end


function registerCollisionCallback(collider, callback)
  collisionCallbacks = collisionCallbacks or {}
  for _, shape in ipairs(collider:getShapes()) do
    collisionCallbacks[shape] = callback
  end
  -- to be called with arguments callback(otherCollider, world) from update function
end
