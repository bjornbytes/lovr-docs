return {
  tag = 'graphicsState',
  summary = 'Get the color mask.',
  description = [[
    Returns the active color channels.  If a color channel is active, then drawing operations will
    affect that particular channel.
  ]],
  arguments = {},
  returns = {
    {
      name = 'r',
      type = 'boolean',
      description = 'Whether or not the red channel is enabled.'
    },
    {
      name = 'g',
      type = 'boolean',
      description = 'Whether or not the green channel is enabled.'
    },
    {
      name = 'b',
      type = 'boolean',
      description = 'Whether or not the blue channel is enabled.'
    },
    {
      name = 'a',
      type = 'boolean',
      description = 'Whether or not the alpha channel is enabled.'
    }
  },
  notes = 'Initially, all color channels are enabled.'
}
