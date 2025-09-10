return {
  tag = 'playArea',
  summary = 'Get the depth of the play area.',
  description = 'Returns the depth of the play area, in meters.',
  arguments = {},
  returns = {
    depth = {
      type = 'number',
      description = 'The depth of the play area, in meters.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'depth' }
    }
  },
  notes = 'If the VR system is not roomscale, this will return zero.',
  related = {
    'lovr.headset.getBoundsWidth',
    'lovr.headset.getBoundsDimensions'
  }
}
