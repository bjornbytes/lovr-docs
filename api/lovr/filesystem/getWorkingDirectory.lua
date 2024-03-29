return {
  tag = 'filesystem-paths',
  summary = 'Get the current working directory.',
  description = [[
    Returns the absolute path of the working directory.  Usually this is where the executable was
    started from.
  ]],
  arguments = {},
  returns = {
    path = {
      type = 'string',
      description = 'The current working directory, or `nil` if it\'s unknown.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'path' }
    }
  }
}
