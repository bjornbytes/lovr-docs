return {
  tag = 'window',
  summary = 'Check if certain features are supported.',
  description = [[
    Returns whether certain features are supported by the system\'s graphics card.
  ]],
  arguments = {},
  returns = {
    {
      name = 'features',
      type = 'table',
      description = 'A table of features and whether or not they are supported.',
      table = {
        {
          name = 'compute',
          type = 'boolean',
          description = 'Whether compute shaders are available.'
        },
        {
          name = 'singlepass',
          type = 'boolean',
          description = 'Whether single pass stereo rendering is supported.'
        }
      }
    }
  },
  related = {
    'lovr.graphics.getSystemLimits'
  }
}
