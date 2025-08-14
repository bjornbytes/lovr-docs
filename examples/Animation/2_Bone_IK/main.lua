local transform = lovr.math.newMat4()

local function solve(root, target, control, lengths)
  local T = target - root
  local C = control - root
  local R = vector(0)

  -- Basis
  local bx = T:normalize()
  local by = (C - bx * C:dot(bx)):normalize()
  local bz = bx:cross(by)

  -- Matrix from basis
  transform:set(
    bx.x, bx.y, bx.z, 0,
    by.x, by.y, by.z, 0,
    bz.x, bz.y, bz.z, 0,
    0, 0, 0, 1
  )

  local distance = T:length()
  local x = (distance + (lengths[1] ^ 2 - lengths[2] ^ 2) / distance) / 2
  local y = math.sqrt(lengths[1] ^ 2 - x ^ 2)
  local solution = vector(x, y, 0)
  return root + transform * solution
end

function lovr.load()
  boneLengths = { .3, .3 }
  points = {
    root = vector(-.2, 1.5, -.5),
    target = vector(.2, 1.5, -.7),
    control = vector(0, 1.8, -.6)
  }
  pointSize = .04
  drags = {}
end

function lovr.update(dt)
  -- Allow hands to drag any of the points
  for i, hand in ipairs(lovr.headset.getHands()) do
    local handPosition = vector(lovr.headset.getPosition(hand .. '/point'))

    if lovr.headset.wasPressed(hand, 'trigger') then
      for k, point in pairs(points) do
        if handPosition:distance(point) < pointSize then
          drags[hand] = k
        end
      end
    elseif lovr.headset.wasReleased(hand, 'trigger') then
      drags[hand] = nil
    end

    if drags[hand] then
      points[drags[hand]] = handPosition
    end
  end
end

function lovr.draw(pass)
  local root, target, control = points.root, points.target, points.control

  -- Draw the joints and the control point
  pass:setColor(0xff80ff)
  pass:sphere(root, pointSize / 2)
  pass:sphere(target, pointSize / 2)
  pass:setColor(0x80ffff)
  pass:sphere(control, pointSize / 2)

  -- Draw the hand
  pass:setColor(0xffffff)
  for _, hand in ipairs(lovr.headset.getHands()) do
    local x, y, z, angle, ax, ay, az = lovr.headset.getPose(hand .. '/point')
    pass:cube(x, y, z, .01, angle, ax, ay, az)
  end

  -- Draw a line from the root to the result from the IK solver, then to the target
  pass:line(root, solve(root, target, control, boneLengths), target)
end
