return {
  tag = 'texture-sampler',
  summary = 'Get the Sampler assigned to the Texture.',
  description = [[
    Returns the Sampler object previously assigned with `Texture:setSampler`.

    This API is experimental, and subject to change in the future!
  ]],
  arguments = {},
  returns = {
    sampler = {
      type = 'Sampler',
      description = 'The Sampler object.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'sampler' }
    }
  }
}
