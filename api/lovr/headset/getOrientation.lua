return {
  tag = 'input',
  summary = 'Get the orientation of a device or model.',
  description = 'Returns the current orientation of a device or model, in angle/axis form.',
  arguments = {
    device = {
      type = 'Device?',
      default = [['head']],
      description = 'The device to get the orientation of.'
    },
    model = {
      type = 'Model',
      description = 'The model to get the orientation of.'
    }
  },
  returns = {
    angle = {
      type = 'number',
      description = 'The amount of rotation around the axis of rotation, in radians.'
    },
    ax = {
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    az = {
      type = 'number',
      description = 'The z component of the axis of rotation.'
    }
  },
  variants = {
    {
      arguments = { 'device' },
      returns = { 'angle', 'ax', 'ay', 'az' }
    },
    {
      arguments = { 'model' },
      returns = { 'angle', 'ax', 'ay', 'az' }
    }
  },
  notes = ' If the object isn\'t tracked, this function returns zeroes.',
  related = {
    'lovr.headset.getPose',
    'lovr.headset.getPosition',
    'lovr.headset.getDirection',
    'lovr.headset.getVelocity',
    'lovr.headset.getAngularVelocity',
    'lovr.headset.isTracked',
    'lovr.headset.getDriver'
  }
}
