return {
  tag = 'controller-models',
  summary = 'Load a model for an active device.',
  description = [[
    Loads a new Model object for the specified model key.

    Model keys are lightuserdata values that act as an ID for a specific model.  Use
    `lovr.headset.getModelKeys` to retrieve a list of model keys for the currently connected
    hardware.

    It is recommended to refresh the list of model keys in the `lovr.modelschanged` event, which
    gets fired whenever the list of keys changes.  `lovr.modelschanged` is also fired once at
    startup when the models are ready to load.  In the callback, you can get the new list of model
    keys and load models for any keys that haven't been loaded yet.

    There isn't any correspondence between a model key and a `Device`, because there could be
    multiple models for a device, or some models that do not correspond to a device at all.  For
    example, the hand device could have a model for a controller, a wrist tracker, or a hand mesh.

    Once a model is loaded, call `lovr.headset.isTracked` with the model to check if it should be
    visible, and `lovr.headset.getPose` to get the position and orientation to draw the model at.

    To reposition the nodes in the model to match the current state of the buttons, joysticks, etc.,
    call `lovr.headset.animate` with the model.
  ]],
  arguments = {
    key = {
      type = 'lightuserdata',
      description = 'A model key to load, previously obtained with `lovr.headset.getModelKeys`.'
    },
    device = {
      type = 'Device',
      default = [['head']],
      description = 'The device to load a model for.'
    }
  },
  returns = {
    model = {
      type = 'Model',
      description = 'The new Model, or `nil` if a model could not be loaded.'
    }
  },
  variants = {
    {
      arguments = { 'key' },
      returns = { 'model' }
    },
    {
      deprecated = true,
      arguments = { 'device' },
      returns = { 'model' }
    }
  },
  example = [[
    local models = {}

    function lovr.draw(pass)
      for k, model in pairs(models) do
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
    'lovr.headset.animate',
    'lovr.headset.isTracked',
    'lovr.modelschanged',
    'lovr.graphics.newModel'
  }
}
