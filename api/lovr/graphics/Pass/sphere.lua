return {
  tag = 'drawing',
  summary = 'Draw a sphere.',
  description = 'TODO',
  arguments = {
    transform = {
      type = 'transform',
      description = 'The transform to apply to the sphere.'
    },
    longitudes = {
      type = 'number',
      default = '48',
      description = 'The number of "horizontal" segments.'
    },
    latitudes = {
      type = 'number',
      default = 'longitudes / 2',
      description = 'The number of "vertical" segments.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'transform', 'longitudes', 'latitudes' },
      returns = {}
    }
  },
  notes = 'TODO'
}
