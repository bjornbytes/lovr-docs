return {
  tag = 'callbacks',
  summary = 'Called when the set of available headset models changes.',
  description = [[
    The `lovr.modelschanged` callback is called when VR models change, usually when hardware is
    connected or disconnected.
  ]],
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  },
  example = [[
    local models = {}

    function lovr.draw(pass)
      for _, model in pairs(models) do
        if lovr.headset.isTracked(model) then
          lovr.headset.animate(model)

          local x, y, z, angle, ax, ay, az = lovr.headset.getPose(model)
          pass:draw(model, x, y, z, 1, angle, ax, ay, az)
        end
      end
    end

    function lovr.modelschanged()
      local newModels = {}

      for i, key in ipairs(lovr.headset.getModelKeys()) do
        newModels[key] = models[key] or lovr.headset.newModel(key)
      end

      models = newModels
    end
  ]],
  related = {
    'lovr.headset.getModelKeys',
    'lovr.headset.newModel'
  }
}
