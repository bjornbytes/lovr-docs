return {
  tag = 'drawing',
  summary = 'Draw a donut.',
  description = 'TODO',
  arguments = {
    {
      name = 'transform',
      type = 'TransformXY2',
      description = [[
        The transform to apply to the torus.  The x scale is the radius, the z scale is the
        thickness.
      ]]
    },
    {
      name = 'tsegments',
      type = 'number',
      default = '64',
      description = 'The number of toroidal (circular) segments to render.'
    },
    {
      name = 'psegments',
      type = 'number',
      default = '32',
      description = 'The number of poloidal (tubular) segments to render.'
    }
  },
  returns = {},
  notes = 'TODO'
}
