return {
  summary = 'Set the position of the AudioMesh.',
  description = 'Sets the position of the AudioMesh, in meters.',
  arguments = {
    x = {
      type = 'number',
      description = 'The new x coordinate.'
    },
    y = {
      type = 'number',
      description = 'The new y coordinate.'
    },
    z = {
      type = 'number',
      description = 'The new z coordinate.'
    },
    position = {
      type = 'vector',
      description = 'The position.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Set the position using numbers.',
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      description = 'Set the position using a vector.',
      arguments = { 'position' },
      returns = {}
    }
  },
  related = {
    'AudioMesh:setOrientation',
    'AudioMesh:setPose',
    'AudioMesh:setScale',
    'AudioMesh:setTransform'
  }
}
