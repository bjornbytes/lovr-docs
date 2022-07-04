return {
  summary = 'Get the default Font.',
  description = [[
    Returns the default Font.  The default font is Varela Round, created at 24px with a spread value
    of `4.0`.  It's used by `Pass:text` if no Font is provided.
  ]],
  arguments = {},
  returns = {
    {
      name = 'font',
      type = 'Font',
      description = 'The default Font object.'
    }
  },
  related = {
    'Pass:text',
    'lovr.graphics.newFont'
  }
}