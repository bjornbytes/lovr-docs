return {
  summary = 'Get the vertices for a piece of text.',
  description = [[
    Returns a table of vertices for a piece of text, along with a Material to use when rendering it.
    The Material may change over time if the Font's texture atlas needs to be resized to make room
    for more glyphs.
  ]],
  arguments = {
    {
      name = 'text',
      type = 'Text',
      description = 'TODO'
    },
    {
      name = 'wrap',
      type = 'number',
      description = 'TODO'
    },
    {
      name = 'halign',
      type = 'HorizontalAlign',
      description = 'TODO'
    },
    {
      name = 'valign',
      type = 'VerticalAlign',
      description = 'TODO'
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
