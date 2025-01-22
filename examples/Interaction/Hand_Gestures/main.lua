local function getJointDirection(skeleton, joint)
  return quat(unpack(skeleton[joint], 5)):direction()
end

local function getCurl(skeleton, finger)
  local fingers = { thumb = 4, index = 8, middle = 13, ring = 18, pinky = 23 }
  local jointCount = finger == 'thumb' and 2 or 3
  local directions = {}

  repeat
    local orientation = quat(unpack(skeleton[fingers[finger] + #directions], 5))
    table.insert(directions, orientation:direction())
  until #directions == jointCount

  local straightness = 0

  for i = 2, jointCount do
    straightness = straightness + math.max(directions[i]:dot(directions[i - 1]), 0)
  end

  local curliness = 1 - (straightness / (jointCount - 1))

  return curliness
end

local function isThumbsUp(skeleton)
  return skeleton and
    getCurl(skeleton, 'thumb') < .1 and
    getJointDirection(skeleton, 6).y > .4 and
    getCurl(skeleton, 'index') > .6 and
    getCurl(skeleton, 'middle') > .6 and
    getCurl(skeleton, 'ring') > .6 and
    getCurl(skeleton, 'pinky') > .6
end

function lovr.load()
  hands = {
    left = {},
    right = {}
  }
end

function lovr.update(dt)
  for device, hand in pairs(hands) do
    hand.skeleton = lovr.headset.getSkeleton(device)
    hand.thumbsup = isThumbsUp(hand.skeleton)
  end
end

local function drawSkeleton(pass, skeleton)
  if not skeleton then return end

  pass:setColor(0xf0f0f0)

  for i, joint in ipairs(skeleton) do
    pass:sphere(vec3(unpack(joint)), .01)
  end

  pass:setColor(0xb0b0b0)

  for f = 1, 5 do
    local base = ({ 3, 7, 12, 17, 22 })[f]
    local length = f == 1 and 3 or 4
    for j = 1, length do
      local from = vec3(unpack(skeleton[base + j - 1]))
      local to = vec3(unpack(skeleton[base + j - 0]))
      pass:capsule(from, to, .002)
    end
  end
end

local function drawCurls(pass, skeleton, x)
  if not skeleton then return end

  pass:push()
  pass:translate(x, 0, 0)
  local str = 'curls:'
  for i, finger in ipairs({ 'thumb', 'index', 'middle', 'ring', 'pinky' }) do
    str = str .. ('\n%s: %.2f'):format(finger, getCurl(skeleton, finger))
  end
  pass:text(str, 0, 1.7, -2, .1)
  pass:pop()
end

function lovr.draw(pass)
  local str = 'Detecting thumbs up gesture..\n'

  if hands.left.thumbsup or hands.right.thumbsup then
    str = str .. 'Good job!'
  end

  pass:text(str, 0, 1.7, -2, .2)

  drawSkeleton(pass, hands.left.skeleton)
  drawSkeleton(pass, hands.right.skeleton)

  drawCurls(pass, hands.left.skeleton, -2)
  drawCurls(pass, hands.right.skeleton, 2)
end
