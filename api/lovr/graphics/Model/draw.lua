return {
  summary = 'Draw the Model.',
  description = 'Draw the Model.',
  arguments = {
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate to draw the Model at.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y coordinate to draw the Model at.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate to draw the Model at.'
    },
    scale = {
      type = 'number',
      default = '1',
      description = 'The scale to draw the Model at.'
    },
    angle = {
      type = 'number',
      default = '0',
      description = 'The angle to rotate the Model around its axis of rotation.'
    },
    ax = {
      type = 'number',
      default = '0',
      description = 'The x component of the axis of rotation.'
    },
    ay = {
      type = 'number',
      default = '1',
      description = 'The y component of the axis of rotation.'
    },
    az = {
      type = 'number',
      default = '0',
      description = 'The z component of the axis of rotation.'
    },
    transform = {
      type = 'Transform',
      description = 'The transform to apply before drawing.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z', 'scale', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      arguments = { 'transform' },
      returns = {}
    }
  }
}
