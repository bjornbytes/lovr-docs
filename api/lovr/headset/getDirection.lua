return {
  tag = 'input',
  summary = 'Get the direction a device or model is pointing.',
  description = [[
    Returns the direction a device or model is pointing.  It will always be normalized.
  ]],
  arguments = {
    device = {
      type = 'Device?',
      default = [['head']],
      description = 'The device to get the direction of.'
    },
    model = {
      type = 'Model',
      description = 'The model to get the direction of.'
    }
  },
  returns = {
    x = {
      type = 'number',
      description = 'The x component of the direction.'
    },
    y = {
      type = 'number',
      description = 'The y component of the direction.'
    },
    z = {
      type = 'number',
      description = 'The z component of the direction.'
    }
  },
  variants = {
    {
      arguments = { 'device' },
      returns = { 'x', 'y', 'z' }
    },
    {
      arguments = { 'model' },
      returns = { 'x', 'y', 'z' }
    }
  },
  notes = [[
    If the object isn't tracked, this function returns zeroes.

    This is the same as `quaternion(lovr.headset.getOrientation(device)):direction()`.
  ]],
  related = {
    'lovr.headset.getPose',
    'lovr.headset.getOrientation',
    'lovr.headset.getVelocity',
    'lovr.headset.getAngularVelocity',
    'lovr.headset.isTracked',
    'lovr.headset.getDriver'
  }
}
