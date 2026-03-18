return {
  summary = 'Get the position of the AudioMesh.',
  description = 'Returns the position of the AudioMesh, in meters.',
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x coordinate.'
    },
    y = {
      type = 'number',
      description = 'The y coordinate.'
    },
    z = {
      type = 'number',
      description = 'The z coordinate.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'AudioMesh:getOrientation',
    'AudioMesh:getPose',
    'AudioMesh:getScale',
    'AudioMesh:getTransform'
  }
}
