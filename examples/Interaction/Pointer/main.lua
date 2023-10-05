function lovr.draw(pass)
  for i, hand in ipairs(lovr.headset.getHands()) do
    hand = hand .. '/point'
    local position = vec3(lovr.headset.getPosition(hand))
    local direction = quat(lovr.headset.getOrientation(hand)):direction()

    pass:setColor(1, 1, 1)
    pass:sphere(position, .01)

    pass:setColor(1, 0, 0)
    pass:line(position, position + direction * 50)
  end
end
