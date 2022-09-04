return {
  summary = 'Get the antialiasing setting of a render pass.',
  description = 'Returns the antialiasing setting of a render pass.',
  arguments = {},
  returns = {
    {
      name = 'samples',
      type = 'number',
      description = 'The number of samples used for rendering.  Currently, will be 1 or 4.'
    }
  }
}
