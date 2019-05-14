return {
  tag = 'input',
  summary = 'Get the angular acceleration of a device.',
  description = 'Returns the current angular acceleration of a device.',
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
      description = 'The x component of the angular acceleration.'
    },
    {
      name = 'ay',
      type = 'number',
      description = 'The y component of the angular acceleration.'
    },
    {
      name = 'az',
      type = 'number',
      description = 'The z component of the angular acceleration.'
    }
  },
  related = {
    'lovr.headset.getPosition',
    'lovr.headset.getOrientation',
    'lovr.headset.getVelocity',
    'lovr.headset.getAngularVelocity',
    'lovr.headset.getAcceleration'
  }
}
