return {
  summary = 'Get a Model for the Controller.',
  description = 'Returns a new Model for the Controller.',
  arguments = {},
  returns = {
    {
      name = 'model',
      type = 'Model',
      description = 'The new Model, or nil if a model could not be loaded.'
    }
  },
  notes = 'The Model will have a Texture applied.',
  example = [[
    local models = {}

    function lovr.draw()
      for _, controller in ipairs(lovr.headset.getControllers()) do
        local x, y, z = controller:getPosition()
        local angle, ax, ay, az = controller:getOrientation()
        models[controller] = models[controller] or controller:newModel()
        models[controller]:draw(x, y, z, 1, angle, ax, ay, az)
      end
    end
  ]]
}
