return {
  tag = 'input',
  summary = 'Get the linear acceleration of a device.',
  description = [[
    Returns the current linear acceleration of a device, in meters per second per second.
  ]],
  arguments = {
    {
      name = 'device',
      type = 'Device',
      default = 'head',
      description = 'The device to get the acceleration of.'
    }
  },
  returns = {
    {
      name = 'ax',
      type = 'number',
      description = 'The x component of the linear acceleration.'
    },
    {
      name = 'ay',
      type = 'number',
      description = 'The y component of the linear acceleration.'
    },
    {
      name = 'az',
      type = 'number',
      description = 'The z component of the linear acceleration.'
    }
  },
  related = {
    'lovr.headset.getPosition',
    'lovr.headset.getOrientation',
    'lovr.headset.getVelocity',
    'lovr.headset.getAngularVelocity',
    'lovr.headset.getAngularAcceleration'
  }
}
