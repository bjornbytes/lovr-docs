return {
  tag = 'filesystem-paths',
  summary = 'Get the path of the LÖVR executable.',
  description = 'Returns the absolute path of the LÖVR executable.',
  arguments = {},
  returns = {
    path = {
      type = 'string | nil',
      description = 'The absolute path of the LÖVR executable, or `nil` if it is unknown.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'path' }
    }
  }
}
