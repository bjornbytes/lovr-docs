function lovr.draw(pass)
  for _, hand in ipairs({ 'left', 'right' }) do
    for _, joint in ipairs(lovr.headset.getSkeleton(hand) or {}) do
      pass:points(unpack(joint, 1, 3))
    end
  end
end
