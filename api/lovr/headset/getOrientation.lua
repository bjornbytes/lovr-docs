return {
  tag = 'headset',
  summary = 'Get the orientation of the headset.',
  description = 'Returns the current orientation of the headset.',
  arguments = {
    eye = {
      type = 'HeadsetEye',
      description = 'The eye to get the orientation of.'
    }
  },
  returns = {
    angle = {
      type = 'number',
      description = 'The amount of rotation around the axis of rotation.'
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
      arguments = {},
      returns = { 'angle', 'ax', 'ay', 'az' }
    },
    {
      description = 'Get the orientation of a single eye.',
      arguments = { 'eye' },
      returns = { 'angle', 'ax', 'ay', 'az' }
    }
  },
  related = {
    'lovr.headset.getPosition',
    'lovr.headset.getVelocity',
    'lovr.headset.getAngularVelocity'
  }
}
