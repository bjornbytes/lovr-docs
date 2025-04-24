return {
  summary = 'Different ways Textures can be used.',
  description = [[
    These are the different ways `Texture` objects can be used.  These are passed in to
    `lovr.graphics.isFormatSupported` to see which texture operations are supported by the GPU for a
    given format.
  ]],
  values = {
    {
      name = 'sample',
      description = [[
        The Texture can be sampled (e.g. used in a `Material` or sent to a `texture2D` variable in
        shaders).
      ]]
    },
    {
      name = 'render',
      description = 'The Texture can used as a canvas in a `Pass`.'
    },
    {
      name = 'storage',
      description = [[
        The Texture can be sent to a storage image variable in shaders (e.g. `image2D`).
      ]]
    },
    {
      name = 'blit',
      description = 'The Texture can be used with `Pass:blit` and `Pass:generateMipmaps`.'
    },
    {
      name = 'cubic',
      description = [[
        The Texture can be used with a sampler that uses a `cubic` filter mode.  See `FilterMode`.
      ]]
    }
  }
}
