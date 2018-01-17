return {
  tag = 'headset',
  summary = 'Get the orientation of the headset.',
  description = 'Returns the current orientation of the headset.',
  arguments = {},
  returns = {
    {
      name = 'angle',
      type = 'number',
      description = 'The number of radians the headset is rotated around its axis of rotation.'
    },
    {
      name = 'ax',
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    {
      name = 'ay',
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    {
      name = 'az',
      type = 'number',
      description = 'The z component of the axis of rotation.'
    }
  },
  related = {
    'lovr.headset.getPosition',
    'lovr.headset.getVelocity',
    'lovr.headset.getAngularVelocity'
  }
}
