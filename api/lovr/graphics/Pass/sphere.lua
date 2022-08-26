return {
  tag = 'drawing',
  summary = 'Draw a sphere.',
  description = 'TODO',
  arguments = {
    {
      name = 'transform',
      type = 'transform',
      description = 'The transform to apply to the sphere.'
    },
    {
      name = 'longitudes',
      type = 'number',
      default = '48',
      description = 'The number of "horizontal" segments.'
    },
    {
      name = 'latitudes',
      type = 'number',
      default = 'longitudes / 2',
      description = 'The number of "vertical" segments.'
    }
  },
  returns = {},
  notes = 'TODO'
}
