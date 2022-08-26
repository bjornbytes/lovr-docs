function lovr.draw(pass)
  for i, hand in ipairs(lovr.headset.getHands()) do
    local x, y, z = lovr.headset.getPosition(hand)
    pass:sphere(x, y, z, .1)
  end
end
