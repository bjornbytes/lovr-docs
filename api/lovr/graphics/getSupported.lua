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
          name = 'writableblocks',
          type = 'boolean',
          description = 'Whether ShaderBlock objects can be created with the \'writable\' flag.'
        },
        {
          name = 'computeshaders',
          type = 'boolean',
          description = 'Whether compute shaders are available.'
        }
      }
    }
  },
  related = {
    'lovr.graphics.getSystemLimits'
  }
}
