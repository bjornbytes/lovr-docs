return {
  summary = 'Get the position of the Controller.',
  description = 'Returns the current position of the Controller.',
  arguments = {},
  returns = {
    {
      name = 'x',
      type = 'number',
      description = 'The x position of the Controller.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y position of the Controller.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z position of the Controller.'
    }
  },
  notes = 'Units are in meters.',
  related = {
    'lovr.headset.getPosition',
    'Controller:getOrientation'
  }
}
