return {
  summary = 'Create a new Rasterizer.',
  description = 'Creates a new Rasterizer from a TTF or BMFont file.',
  arguments = {
    file = {
      type = 'string | Blob',
      description = 'A filename or Blob containing the font file to load.'
    },
    size = {
      type = 'number?',
      default = '32',
      description = [[
        The resolution to render the font at, in pixels (TTF only).  Higher resolutions use more
        memory and processing power but may provide better quality results for some
        fonts/situations.
      ]]
    },
    atlas = {
      type = 'Image?',
      description = 'An Image to use for the BMFont atlas, instead of the one in the BMFont file.'
    }
  },
  returns = {
    rasterizer = {
      type = 'Rasterizer',
      description = 'The new Rasterizer.'
    }
  },
  variants = {
    {
      arguments = { 'file', 'size' },
      returns = { 'rasterizer' }
    },
    {
      arguments = { 'file', 'atlas' },
      returns = { 'rasterizer' }
    },
    {
      description = 'Create a Rasterizer for the default font included with LÖVR (Varela Round).',
      arguments = { 'size' },
      returns = { 'rasterizer' }
    }
  }
}
