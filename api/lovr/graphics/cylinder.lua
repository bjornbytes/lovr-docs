return {
  tag = 'graphicsPrimitives',
  summary = 'Draw a cylinder.',
  description = 'Draws a cylinder.',
  arguments = {
    {
      name = 'x1',
      type = 'number',
      description = 'The x coordinate of the top of the cylinder.'
    },
    {
      name = 'y1',
      type = 'number',
      description = 'The y coordinate of the top of the cylinder.'
    },
    {
      name = 'z1',
      type = 'number',
      description = 'The z coordinate of the top of the cylinder.'
    },
    {
      name = 'x2',
      type = 'number',
      description = 'The x coordinate of the bottom of the cylinder.'
    },
    {
      name = 'y2',
      type = 'number',
      description = 'The y coordinate of the bottom of the cylinder.'
    },
    {
      name = 'z2',
      type = 'number',
      description = 'The z coordinate of the bottom of the cylinder.'
    },
    {
      name = 'r1',
      type = 'number',
      default = '1',
      description = 'The radius of the top of the cylinder.'
    },
    {
      name = 'r2',
      type = 'number',
      default = '1',
      description = 'The radius of the bottom of the cylinder.'
    },
    {
      name = 'capped',
      type = 'boolean',
      default = 'true',
      description = 'Whether the top and bottom should be rendered.'
    },
    {
      name = 'segments',
      type = 'number',
      default = 'nil',
      description = [[
        The number of radial segments to use for the cylinder.  If nil, the segment count is
        automatically determined from the radii.
      ]]
    }
  },
  returns = {}
}
