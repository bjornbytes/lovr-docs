return {
  summary = 'Get the current frames per second.',
  description = [[
    Returns the current frames per second, averaged over the last 60 frames.
  ]],
  arguments = {},
  returns = {
    {
      name = 'fps',
      type = 'number',
      description = 'The current FPS.'
    }
  }
}
