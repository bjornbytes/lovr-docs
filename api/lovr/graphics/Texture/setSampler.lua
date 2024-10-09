return {
  tag = 'texture-sampler',
  summary = 'Set sampler settings for the Texture.',
  description = [[
    Sets sampler settings for the texture.  This can either be a `FilterMode` like `nearest`, or a
    `Sampler` object, which allows configuring all of the filtering and wrapping settings.

    There are other ways of using custom samplers for a texture, but they have disadvantages:

    - `Sampler` objects can be sent to shaders and used to sample from the texture, but this
      requires writing custom shader code and sending sampler objects with `Pass:send`, which is
      inconvenient.
    - `Pass:setSampler` exists, but it applies to all textures in all draws in the Pass.  It doesn't
      allow for changing filtering settings on a per-texture basis.

    This API is experimental, and subject to change in the future!
  ]],
  arguments = {
    mode = {
      type = 'FilterMode',
      description = 'The FilterMode shaders will use when reading pixels from the texture.'
    },
    sampler = {
      type = 'Sampler',
      description = 'The Sampler object shaders will use when reading pixels from the texture.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'mode' },
      returns = {}
    },
    {
      arguments = { 'sampler' },
      returns = {}
    },
    {
      description = 'Remove the texture\'s sampler, instead using the one set by `Pass:setSampler`.',
      arguments = {},
      returns = {}
    }
  }
}
