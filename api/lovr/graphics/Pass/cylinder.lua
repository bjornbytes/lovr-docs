return {
  tag = 'drawing',
  summary = 'Draw a cylinder.',
  description = 'TODO',
  arguments = {
    {
      name = 'transform',
      type = 'TransformXY2',
      description = [[
        The transform to apply to the cylinder.  The x and y scale is the radius, the z scale is the
        length.
      ]]
    },
    {
      name = 'capped',
      type = 'boolean',
      default = 'true',
      description = 'Whether the tops and bottoms of the cylinder should be rendered.'
    },
    {
      name = 'angle1',
      type = 'number',
      default = '0',
      description = 'The angle of the beginning of the arc.'
    },
    {
      name = 'angle2',
      type = 'number',
      default = '2 * math.pi',
      description = 'angle of the end of the arc.'
    },
    {
      name = 'segments',
      type = 'number',
      default = '64',
      description = 'The number of circular segments to render.'
    }
  },
  returns = {},
  notes = 'TODO'
}
