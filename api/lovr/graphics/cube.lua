return {
  tag = 'graphicsPrimitives',
  summary = 'Draw a cube.',
  description = 'Draws a cube.',
  arguments = {
    {
      name = 'mode',
      type = 'DrawMode',
      description = 'How to draw the cube.'
    },
    {
      name = 'x',
      type = 'number',
      default = '0',
      description = 'The x coordinate of the center of the cube.'
    },
    {
      name = 'y',
      type = 'number',
      default = '0',
      description = 'The y coordinate of the center of the cube.'
    },
    {
      name = 'z',
      type = 'number',
      default = '0',
      description = 'The z coordinate of the center of the cube.'
    },
    {
      name = 'size',
      type = 'number',
      default = '1',
      description = 'The size of the cube, in meters.'
    },
    {
      name = 'angle',
      type = 'number',
      default = '0',
      description = 'The rotation of the cube around its rotation axis, in radians.'
    },
    {
      name = 'ax',
      type = 'number',
      default = '0',
      description = 'The x coordinate of the cube\'s axis of rotation.'
    },
    {
      name = 'ay',
      type = 'number',
      default = '1',
      description = 'The y coordinate of the cube\'s axis of rotation.'
    },
    {
      name = 'az',
      type = 'number',
      default = '0',
      description = 'The z coordinate of the cube\'s axis of rotation.'
    }
  },
  returns = {}
}
