return {
  tag = 'headset',
  summary = 'Get the position of an eye.',
  description = 'Returns the current position of one of the eyes in 3D space.',
  arguments = {
    {
      name = 'eye',
      type = 'HeadsetEye',
      description = 'The eye to get the position of.'
    }
  },
  returns = {
    {
      name = 'x',
      type = 'number',
      description = 'The x position of the eye.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y position of the eye.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z position of the eye.'
    }
  },
  related = {
    'lovr.headset.getPosition'
  }
}
