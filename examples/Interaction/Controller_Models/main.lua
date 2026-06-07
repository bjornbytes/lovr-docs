local models = {}

function lovr.draw(pass)
  for _, model in pairs(models) do
    if lovr.headset.isTracked(model) then
      lovr.headset.animate(model)

      pass:push()
      pass:transform(lovr.headset.getPose(model))
      pass:draw(model)
      pass:pop()
    end
  end

  if not next(models) then
    pass:text('No models loaded', 0, 1.7, -1, .1)
  end
end

function lovr.modelschanged()
  local newModels = {}

  for i, key in ipairs(lovr.headset.getModelKeys()) do
    newModels[key] = models[key] or lovr.headset.newModel(key)
  end

  models = newModels
end
