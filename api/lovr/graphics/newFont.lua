return {
  tag = 'graphics-objects',
  summary = 'Create a new Font.',
  description = 'Creates a new Font.',
  arguments = {
    file = {
      type = 'string | Blob',
      description = 'A filename or Blob containing a TTF or BMFont file.'
    },
    rasterizer = {
      type = 'Rasterizer',
      description = 'An existing Rasterizer to use to load glyph images.'
    },
    size = {
      type = 'number',
      default = '32',
      description = [[
        The size of the Font in pixels (TTF only).  Larger sizes are slower to initialize and use
        more memory, but have better quality.
      ]]
    },
    spread = {
      type = 'number',
      default = '4',
      description = [[
        For signed distance field fonts (currently all fonts), the width of the SDF, in pixels.  The
        greater the distance the font is viewed from, the larger this value needs to be for the font
        to remain properly antialiased.  Increasing this will have a performance penalty similar to
        increasing the size of the font.
      ]]
    }
  },
  returns = {
    font = {
      type = 'Font',
      description = 'The new Font.'
    }
  },
  variants = {
    {
      description = 'Creates a new Font from a font file.',
      arguments = { 'file', 'size', 'spread' },
      returns = { 'font' }
    },
    {
      description = 'Creates a new Font using the default typeface (Varela Round).',
      arguments = { 'size', 'spread' },
      returns = { 'font' }
    },
    {
      description = 'Creates a new Font from an existing Rasterizer.',
      arguments = { 'rasterizer', 'spread' },
      returns = { 'font' }
    }
  },
  related = {
    'lovr.graphics.getDefaultFont',
    'lovr.data.newRasterizer',
    'Pass:text'
  }
}
