function lovr.load()
  models = {
    left = lovr.headset.newModel('hand/left'),
    right = lovr.headset.newModel('hand/right')
  }
end

function lovr.draw(pass)
  for hand, model in pairs(models) do
    if lovr.headset.isTracked(hand) then
      pass:draw(model, mat4(lovr.headset.getPose(hand)))
    end
  end

  if not next(models) then
    pass:text('No models loaded', 0, 1.7, -1, .1)
  end
end
