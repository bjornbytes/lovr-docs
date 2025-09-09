return {
  summary = 'Wrap a string into a sequence of lines.',
  description = [[
    Returns a table of wrapped lines for a piece of text, given a line length limit.

    By default the units for `limit` are in meters.  If text is being drawn with scale applied, make
    sure the scale is also applied to the `limit`.
  ]],
  arguments = {
    string = {
      type = 'string',
      description = 'The text to wrap.'
    },
    strings = {
      type = 'table',
      description = [[
        A table of colored strings, each given as a `{ color, string }` pair.  The color can be a
        `Vec3`, `Vec4`, table, or hexcode.
      ]]
    },
    wrap = {
      type = 'number',
      description = 'The line length to wrap at.'
    }
  },
  returns = {
    lines = {
      type = '{string}',
      description = 'A table of strings, one for each wrapped line.'
    }
  },
  variants = {
    {
      arguments = { 'string', 'wrap' },
      returns = { 'lines' }
    },
    {
      arguments = { 'strings', 'wrap' },
      returns = { 'lines' }
    }
  },
  notes = [[
    The font's pixel density is incorporated into the limit.  So if the font's pixel density is
    changed to 1 (changing the font's units to pixels), the `limit` will be in pixels as well.
  ]],
  related = {
    'Font:getWidth',
    'Font:getHeight',
    'Pass:text'
  }
}
