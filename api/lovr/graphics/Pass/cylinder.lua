return {
  tag = 'drawing',
  summary = 'Draw a cylinder.',
  description = 'Draws a cylinder.',
  arguments = {
    transform = {
      type = 'TransformXY2',
      description = [[
        The transform to apply to the cylinder.  The x and y scale is the radius, the z scale is the
        length.
      ]]
    },
    p1 = {
      type = 'Point3',
      description = 'The starting point of the cylinder.'
    },
    p2 = {
      type = 'Point3',
      description = 'The ending point of the cylinder.'
    },
    radius = {
      type = 'number',
      description = 'The radius of the cylinder.'
    },
    capped = {
      type = 'boolean',
      default = 'true',
      description = 'Whether the tops and bottoms of the cylinder should be rendered.'
    },
    angle1 = {
      type = 'number',
      default = '0',
      description = 'The angle of the beginning of the arc.'
    },
    angle2 = {
      type = 'number',
      default = '2 * math.pi',
      description = 'angle of the end of the arc.'
    },
    segments = {
      type = 'number',
      default = '64',
      description = 'The number of circular segments to render.'
    }
  },
  variants = {
    {
      arguments = { 'transform', 'capped', 'angle1', 'angle2', 'segments' },
      returns = {}
    },
    {
      arguments = { 'p1', 'p2', 'radius', 'capped', 'angle1', 'angle2', 'segments' },
      returns = {}
    }
  },
  returns = {},
  notes = 'TODO'
}
