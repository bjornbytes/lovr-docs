return {
  summary = 'Set the scale of the AudioMesh.',
  description = 'Sets the scale of the AudioMesh.',
  arguments = {
    sx = {
      type = 'number',
      description = 'The x scale.'
    },
    sy = {
      type = 'number',
      description = 'The y scale.'
    },
    sz = {
      type = 'number',
      description = 'The z scale.'
    },
    scale = {
      type = 'vector',
      description = 'The new scale.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Set the scale using numbers.',
      arguments = { 'sx', 'sy', 'sz' },
      returns = {}
    },
    {
      description = 'Set the scale using a vector.',
      arguments = { 'scale' },
      returns = {}
    }
  },
  related = {
    'AudioMesh:setPosition',
    'AudioMesh:setOrientation',
    'AudioMesh:setPose',
    'AudioMesh:setTransform'
  }
}
