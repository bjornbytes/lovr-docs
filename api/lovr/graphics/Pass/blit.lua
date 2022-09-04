return {
  tag = 'transfer',
  summary = 'Copy data between textures with scaling.',
  description = [[
    Copies data between textures.  Similar to `Pass:copy`, except the source and destination sizes
    can be different.  The pixels from the source texture will be scaled to the destination size.
  ]],
  arguments = {
    {
      name = 'src',
      type = 'Texture',
      description = 'The texture to copy from.'
    },
    {
      name = 'dst',
      type = 'Texture',
      description = 'The texture to copy to.'
    },
    {
      name = 'srcx',
      type = 'number',
      default = '0',
      description = 'The x offset from the left of the source texture to blit from, in pixels.'
    },
    {
      name = 'srcy',
      type = 'number',
      default = '0',
      description = 'The y offset from the top of the source texture to blit from, in pixels.'
    },
    {
      name = 'srcz',
      type = 'number',
      default = '1',
      description = 'The index of the first layer in the source texture to blit from.'
    },
    {
      name = 'dstx',
      type = 'number',
      default = '0',
      description = 'The x offset from the left of the destination texture to blit to, in pixels.'
    },
    {
      name = 'dsty',
      type = 'number',
      default = '0',
      description = 'The y offset from the top of the destination texture to blit to, in pixels.'
    },
    {
      name = 'dstz',
      type = 'number',
      default = '1',
      description = 'The index of the first layer in the destination texture to blit to.'
    },
    {
      name = 'srcw',
      type = 'number',
      default = 'nil',
      description = [[
        The width of the region in the source texture to blit.  If nil, the region will extend to
        the right side of the texture.
      ]]
    },
    {
      name = 'srch',
      type = 'number',
      default = 'nil',
      description = [[
        The height of the region in the source texture to blit.  If nil, the region will extend to
        the bottom of the texture.
      ]]
    },
    {
      name = 'srcd',
      type = 'number',
      default = 'nil',
      description = 'The number of layers in the source texture to blit.'
    },
    {
      name = 'dstw',
      type = 'number',
      default = 'nil',
      description = [[
        The width of the region in the destination texture to blit to.  If nil, the region will
        extend to the right side of the texture.
      ]]
    },
    {
      name = 'dsth',
      type = 'number',
      default = 'nil',
      description = [[
        The height of the region in the destination texture to blit to.  If nil, the region will
        extend to the bottom of the texture.
      ]]
    },
    {
      name = 'dstd',
      type = 'number',
      default = 'nil',
      description = 'The number of the layers in the destination texture to blit to.'
    },
    {
      name = 'srclevel',
      type = 'number',
      default = '1',
      description = 'The index of the mipmap level in the source texture to blit from.'
    },
    {
      name = 'dstlevel',
      type = 'number',
      default = '1',
      description = 'The index of the mipmap level in the destination texture to blit to.'
    },
    {
      name = 'filter',
      type = 'FilterMode',
      default = 'linear',
      description = 'The filtering algorithm used when rescaling.'
    }
  },
  returns = {},
  notes = [[
    When blitting between 3D textures, the layer counts do not need to match, and the layers will be
    treated as a continuous axis (i.e. pixels will be smoothed between layers).

    When blitting between array textures, the layer counts must match, and the blit occurs
    as a sequence of distinct 2D blits layer-by-layer.
  ]]
}
