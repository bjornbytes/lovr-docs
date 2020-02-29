function lovr.draw()
  for i, hand in ipairs(lovr.headset.getHands()) do
    local position = vec3(lovr.headset.getPosition(hand))
    local direction = quat(lovr.headset.getOrientation(hand)):direction()

    lovr.graphics.setColor(1, 1, 1)
    lovr.graphics.sphere(position, .01)

    if lovr.headset.isDown(hand, 'trigger') then
      lovr.graphics.setColor(0, 1, 0)
    else
      lovr.graphics.setColor(1, 0, 0)
    end
    lovr.graphics.line(position, position + direction * 50)
  end
end
