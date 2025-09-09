return {
  summary = 'Get whether the Rasterizer can rasterize a set of glyphs.',
  description = 'Returns whether the Rasterizer can rasterize a set of glyphs.',
  arguments = {
    ['...'] = {
      type = 'string | number',
      description = 'Strings (characters) or numbers (codepoints) to check for.'
    }
  },
  returns = {
    hasGlyphs = {
      type = 'boolean',
      description = [[
        true if the Rasterizer can rasterize all of the supplied characters, false otherwise.
      ]]
    }
  },
  variants = {
    {
      arguments = { '...' },
      returns = { 'hasGlyphs' }
    }
  },
  example = [[
    rasterizer = lovr.data.newRasterizer()

    function lovr.draw(pass)
      if rasterizer:hasGlyphs('Ö') then
        pass:text('LÖVR!!!', 0, 2, -3)
      else
        pass:text('>:(', 0, 2, -3)
      end
    end
  ]],
  related = {
    'Rasterizer:getGlyphCount'
  }
}
