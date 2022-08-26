return {
  tag = 'drawing',
  summary = 'Draw a capsule.',
  description = 'TODO',
  arguments = {
    transform = {
      type = 'TransformXY2',
      description = [[
        The transform to apply to the capsule.  The x and y scale is the radius, the z scale is the
        length.
      ]]
    },
    p1 = {
      type = 'Point3',
      description = 'The starting point of the capsule.'
    },
    p2 = {
      type = 'Point3',
      description = 'The ending point of the capsule.'
    },
    segments = {
      type = 'number',
      default = '32',
      description = 'The number of circular segments to render.'
    }
  },
  variants = {
    {
      arguments = { 'transform', 'segments' },
      returns = {}
    },
    {
      arguments = { 'p1', 'p2', 'segments' },
      returns = {}
    }
  },
  returns = {},
  notes = 'TODO'
}
