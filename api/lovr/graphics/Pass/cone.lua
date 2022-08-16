return {
  tag = 'drawing',
  summary = 'Draw a cone.',
  description = 'TODO',
  arguments = {
    {
      name = 'transform',
      type = 'TransformXY2',
      description = [[
        The transform to apply to the cone.  The x and y scale is the radius, the z scale is the
        length.
      ]]
    },
    {
      name = 'segments',
      type = 'number',
      default = '64',
      description = 'The number of circular segments to render.'
    }
  }
  returns = {},
  notes = 'TODO'
}
