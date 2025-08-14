box = {
  position = vector(0, 1, -.25),
  size = .25
}

function lovr.load()
  drag = {
    active = false,
    hand = nil,
    offset = vector()
  }
end

function lovr.update(dt)
  for i, hand in ipairs(lovr.headset.getHands()) do
    if lovr.headset.wasPressed(hand, 'trigger') then
      local offset = box.position - vector(lovr.headset.getPosition(hand))
      local halfSize = box.size / 2
      local x, y, z = offset:unpack()
      if math.abs(x) < halfSize and math.abs(y) < halfSize and math.abs(z) < halfSize then
        drag.active = true
        drag.hand = hand
        drag.offset = offset
      end
    end
  end

  if drag.active then
    box.position = drag.offset + vector(lovr.headset.getPosition(drag.hand))

    if lovr.headset.wasReleased(drag.hand, 'trigger') then
      drag.active = false
    end
  end
end

function lovr.draw(pass)
  pass:setColor(drag.active and 0x80ee80 or 0xee8080)
  pass:cube(box.position, box.size, nil, 'line')

  pass:setColor(0xffffff)
  for i, hand in ipairs(lovr.headset.getHands()) do
    local x, y, z, angle, ax, ay, az = lovr.headset.getPose(hand)
    pass:cube(x, y, z, .01, angle, ax, ay, az)
  end
end
