return {
  summary = 'Get the vertices for a piece of text.',
  description = [[
    Returns a table of vertices for a piece of text, along with a Material to use when rendering it.
    The Material returned by this function may not be the same if the Font's texture atlas needs to
    be recreated with a bigger size to make room for more glyphs.
  ]],
  arguments = {
    string = {
      type = 'string',
      description = 'The text to render.'
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
      default = '0',
      description = [[
        The maximum line length.  The units depend on the pixel density of the font, but are in
        meters by default.
      ]]
    },
    {
      name = 'halign',
      type = 'HorizontalAlign',
      description = 'The horizontal align.'
    },
    {
      name = 'valign',
      type = 'VerticalAlign',
      description = 'The vertical align.'
    }
  },
  returns = {
    {
      name = 'vertices',
      type = 'table',
      description = 'The table of vertices.  See below for the format of each vertex.'
    },
    {
      name = 'material',
      type = 'Material',
      description = 'A Material to use when rendering the vertices.'
    }
  },
  notes = [[
    Each vertex is a table of 4 floating point numbers with the following data:

        { x, y, u, v }

    These could be placed in a vertex buffer using the following buffer format:

        { 'vec2:VertexPosition', 'vec2:VertexUV' }
  ]]
}
