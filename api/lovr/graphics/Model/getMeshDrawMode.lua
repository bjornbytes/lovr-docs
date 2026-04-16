return {
  summary = 'Get the draw mode of a mesh part.',
  description = [[
    Returns the draw mode of a mesh part.  The draw mode controls how mesh vertices are connected
    together. Meshes can be split into multiple parts, and each part can have its own draw mode.
  ]],
  arguments = {
    mesh = {
      type = 'number',
      description = 'The index of a mesh.'
    },
    part = {
      type = 'number',
      default = '1',
      description = 'The index of a part.'
    }
  },
  returns = {
    mode = {
      type = 'ModelDrawMode',
      description = 'The draw mode of the part.'
    }
  },
  variants = {
    {
      arguments = { 'mesh' },
      returns = { 'mode' }
    }
  },
  related = {
    'ModelData:getMeshDrawMode'
  }
}
