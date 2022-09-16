function lovr.load()
  models = {
    left = lovr.headset.newModel('hand/left'),
    right = lovr.headset.newModel('hand/right')
  }

  if not next(models) then print('No models loaded') end
end

function lovr.draw(pass)
  for hand, model in pairs(models) do
    if lovr.headset.isTracked(hand) then
      pass:draw(model, mat4(lovr.headset.getPose(hand)))
    end
  end
end
