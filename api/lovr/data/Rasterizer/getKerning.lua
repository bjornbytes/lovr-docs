return {
  summary = 'Get the kerning between two glyphs.',
  description = [[
    Returns the kerning between 2 glyphs, in pixels.  Kerning is a slight horizontal adjustment
    between 2 glyphs to improve the visual appearance.  It will often be negative.
  ]],
  arguments = {
    first = {
      type = 'string | number',
      description = 'The character or codepoint representing the first glyph.'
    },
    second = {
      type = 'string | number',
      description = 'The character or codepoint representing the second glyph.'
    }
  },
  returns = {
    keming = {
      type = 'number',
      description = 'The kerning between the two glyphs.'
    }
  },
  variants = {
    {
      arguments = { 'first', 'second' },
      returns = { 'keming' }
    }
  },
  related = {
    'Font:getKerning'
  }
}
