return {
  tag = 'input',
  summary = 'Get the position of a device or model.',
  description = 'Returns the current position of a device or model, in meters.',
  arguments = {
    device = {
      type = 'Device?',
      default = [['head']],
      description = 'The device to locate.'
    },
    model = {
      type = 'Model',
      description = 'The model to locate.'
    }
  },
  returns = {
    x = {
      type = 'number',
      description = 'The x position.'
    },
    y = {
      type = 'number',
      description = 'The y position.'
    },
    z = {
      type = 'number',
      description = 'The z position.'
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
  notes = 'If the object isn\'t tracked, this function returns zeroes.',
  related = {
    'lovr.headset.getPose',
    'lovr.headset.getOrientation',
    'lovr.headset.getVelocity',
    'lovr.headset.getAngularVelocity',
    'lovr.headset.isTracked',
    'lovr.headset.getDriver'
  }
}
