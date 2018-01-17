return {
  tag = 'graphicsPrimitives',
  summary = 'Draw a plane.',
  description = 'Draws a plane with a given position, size, and orientation.',
  arguments = {
    {
      name = 'mode',
      type = 'DrawMode',
      description = 'How to draw the plane.'
    },
    {
      name = 'x',
      type = 'number',
      default = '0',
      description = 'The x coordinate of the center of the plane.'
    },
    {
      name = 'y',
      type = 'number',
      default = '0',
      description = 'The y coordinate of the center of the plane.'
    },
    {
      name = 'z',
      type = 'number',
      default = '0',
      description = 'The z coordinate of the center of the plane.'
    },
    {
      name = 'size',
      type = 'number',
      default = '1',
      description = 'The size of the plane, in meters.'
    },
    {
      name = 'nx',
      type = 'number',
      default = '0',
      description = 'The x coordinate of the normal vector of the plane.'
    },
    {
      name = 'ny',
      type = 'number',
      default = '1',
      description = 'The y coordinate of the normal vector of the plane.'
    },
    {
      name = 'nz',
      type = 'number',
      default = '0',
      description = 'The z coordinate of the normal vector of the plane.'
    }
  },
  returns = {}
}
