return {
  tag = 'graphicsState',
  summary = 'Set the color mask.',
  description = 'Sets which color channels are affected by drawing operations.',
  arguments = {
    {
      name = 'r',
      type = 'boolean',
      default = 'true',
      description = 'Whether or not the red channel should be enabled.'
    },
    {
      name = 'g',
      type = 'boolean',
      default = 'true',
      description = 'Whether or not the green channel should be enabled.'
    },
    {
      name = 'b',
      type = 'boolean',
      default = 'true',
      description = 'Whether or not the blue channel should be enabled.'
    },
    {
      name = 'a',
      type = 'boolean',
      default = 'true',
      description = 'Whether or not the alpha channel should be enabled.'
    }
  },
  returns = {},
  notes = 'Initially, all color channels are enabled.'
}
