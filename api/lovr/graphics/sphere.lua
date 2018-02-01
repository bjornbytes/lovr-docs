return {
  tag = 'graphicsPrimitives',
  summary = 'Draw a sphere.',
  description = 'Draws a sphere.',
  arguments = {
    texture = {
      type = 'Texture',
      description = 'The Texture to apply to the sphere.'
    },
    transform = {
      type = 'Transform',
      description = 'The sphere\'s transform.'
    },
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate of the center of the sphere.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y coordinate of the center of the sphere.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate of the center of the sphere.'
    },
    size = {
      type = 'number',
      default = '1',
      description = 'The size of the sphere, in meters.'
    },
    angle = {
      type = 'number',
      default = '0',
      description = 'The rotation of the sphere around its rotation axis, in radians.'
    },
    ax = {
      type = 'number',
      default = '0',
      description = 'The x coordinate of the sphere\'s axis of rotation.'
    },
    ay = {
      type = 'number',
      default = '1',
      description = 'The y coordinate of the sphere\'s axis of rotation.'
    },
    az = {
      type = 'number',
      default = '0',
      description = 'The z coordinate of the sphere\'s axis of rotation.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z', 'size', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      arguments = { 'texture', 'x', 'y', 'z', 'size', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      arguments = { 'transform' },
      returns = {}
    },
    {
      arguments = { 'texture', 'transform' },
      returns = {}
    }
  }
}
