return {
  summary = 'Get the scale of the AudioMesh.',
  description = 'Returns the scale of the AudioMesh.',
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x scale factor.'
    },
    y = {
      type = 'number',
      description = 'The y scale factor.'
    },
    z = {
      type = 'number',
      description = 'The z scale factor.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'AudioMesh:getPosition',
    'AudioMesh:getOrientation',
    'AudioMesh:getPose',
    'AudioMesh:getTransform'
  }
}
