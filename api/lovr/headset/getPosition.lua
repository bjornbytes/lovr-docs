return {
  tag = 'headset',
  summary = 'Get the position of the headset.',
  description = 'Returns the current position of the headset.',
  arguments = {
    eye = {
      type = 'HeadsetEye',
      description = 'The eye to get the position of.'
    }
  },
  returns = {
    x = {
      type = 'number',
      description = 'The x position of the headset.'
    },
    y = {
      type = 'number',
      description = 'The y position of the headset.'
    },
    z = {
      type = 'number',
      description = 'The z position of the headset.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    },
    {
      description = 'Get the position of an eye.',
      arguments = { 'eye' },
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'lovr.headset.getOrientation',
    'lovr.headset.getVelocity',
    'lovr.headset.getAngularVelocity'
  }
}
