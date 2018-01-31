return {
  tag = 'graphicsPrimitives',
  summary = 'Draw a plane.',
  description = 'Draws a plane with a given position, size, and orientation.',
  arguments = {
    texture = {
      type = 'Texture',
      description = 'The texture to apply to the plane.'
    },
    mode = {
      type = 'DrawMode',
      description = 'How to draw the plane.'
    },
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate of the center of the plane.'
    },
    y = {
      name = 'y',
      type = 'number',
      default = '0',
      description = 'The y coordinate of the center of the plane.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate of the center of the plane.'
    },
    size = {
      type = 'number',
      default = '1',
      description = 'The size of the plane, in meters.'
    },
    nx = {
      type = 'number',
      default = '0',
      description = 'The x coordinate of the normal vector of the plane.'
    },
    ny = {
      type = 'number',
      default = '1',
      description = 'The y coordinate of the normal vector of the plane.'
    },
    nz = {
      type = 'number',
      default = '0',
      description = 'The z coordinate of the normal vector of the plane.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'mode', 'x', 'y', 'z', 'size', 'nx', 'ny', 'nz' },
      returns = {}
    },
    {
      description = 'Draw a textured plane.',
      arguments = { 'texture', 'x', 'y', 'z', 'size', 'nx', 'ny', 'nz' },
      returns = {}
    },
    {
      description = 'Draw a fullscreen textured plane.',
      arguments = { 'texture' },
      returns = {}
    }
  }
}
