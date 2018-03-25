return {
  summary = 'Create a new Rasterizer.',
  description = 'Creates a new Rasterizer from a TTF file.',
  arguments = {
    filename = {
      type = 'string',
      description = 'The filename of the font file to load.'
    },
    blob = {
      type = 'Blob',
      description = 'The Blob containing font data.'
    },
    size = {
      type = 'number',
      default = '32',
      description = 'The resolution to render the fonts at, in pixels.'
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
      arguments = { 'filename', 'size' },
      returns = { 'rasterizer' }
    },
    {
      arguments = { 'blob', 'size' },
      returns = { 'rasterizer' }
    }
  }
}
