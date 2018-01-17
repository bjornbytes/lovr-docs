return {
  tag = 'playArea',
  summary = 'Get the size of the play area.',
  description = 'Returns the size of the play area, in meters.',
  arguments = {},
  returns = {
    {
      name = 'width',
      type = 'number',
      description = 'The width of the play area, in meters.'
    },
    {
      name = 'depth',
      type = 'number',
      description = 'The depth of the play area, in meters.'
    }
  },
  related = {
    'lovr.headset.getBoundsWidth',
    'lovr.headset.getBoundsDepth'
  }
}
