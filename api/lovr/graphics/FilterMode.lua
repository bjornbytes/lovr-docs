return {
  summary = 'How textures are sampled.',
  description = [[
    The method used to downsample (or upsample) a texture.  "nearest" can be used for a pixelated
    effect, whereas "linear" leads to more smooth results.  Nearest is slightly faster than linear.
  ]],
  values = {
    {
      name = 'linear',
      description = 'The texture will be smoothed.'
    },
    {
      name = 'nearest',
      description = 'The texture will be pixelated.'
    }
  }
}
