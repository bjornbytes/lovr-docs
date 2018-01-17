return {
  tag = 'window',
  summary = 'Clear the screen.',
  description = [[
    Clears the screen to the background color.  This function is called automatically by `lovr.run`.
  ]],
  arguments = {
    {
      name = 'color',
      type = 'boolean',
      default = 'true',
      description = 'Whether or not to clear color information on the screen.'
    },
    {
      name = 'depth',
      type = 'boolean',
      default = 'true',
      description = 'Whether or not to clear the depth information on the screen.'
    }
  },
  returns = {},
  related = {
    'lovr.graphics.setBackgroundColor'
  }
}
