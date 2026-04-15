return {
  tag = 'input',
  summary = 'Check if a device is currently tracked.',
  description = 'Returns whether a `Device` or `Model` has an actively tracked pose.',
  arguments = {
    device = {
      type = 'Device',
      default = [['head']],
      description = 'The device to check.'
    },
    model = {
      type = 'Model',
      description = 'The model to check.  Should have been created with `lovr.headset.newModel`.'
    }
  },
  returns = {
    tracked = {
      type = 'boolean',
      description = 'Whether the device or model is currently tracked.'
    }
  },
  variants = {
    {
      arguments = { 'device' },
      returns = { 'tracked' }
    },
    {
      arguments = { 'model' },
      returns = { 'tracked' }
    }
  },
  notes = [[
    If a device is tracked, it is guaranteed to return a valid pose until the next call to
    `lovr.headset.update`.
  ]]
}
