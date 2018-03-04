return {
  tag = 'graphicsObjects',
  summary = 'Create a new Buffer.',
  description = [[
    Creates a new Buffer.  You must specify either the capacity for the Buffer or an initial set of
    vertex data.  The draw mode and usage hint can also optionally be specified.
  ]],
  arguments = {
    size = {
      type = 'number',
      description = 'The maximum number of vertices the Buffer can store.'
    },
    mode = {
      type = 'BufferDrawMode',
      default = [['fan']],
      description = 'How the Buffer will render its vertices.'
    },
    usage = {
      type = 'BufferUsage',
      default = [['dynamic']],
      description = 'How the Buffer will be updated.'
    },
    vertices = {
      type = 'table',
      description = 'A table of vertices.  Each vertex is a table containing the vertex data.'
    },
    format = {
      type = 'table',
      description = 'A table describing the attribute format for the vertices.'
    }
  },
  returns = {
    buffer = {
      type = 'Buffer',
      description = 'The new Buffer.'
    }
  },
  variants = {
    {
      arguments = { 'size', 'mode', 'usage' },
      returns = { 'buffer' }
    },
    {
      arguments = { 'vertices', 'mode', 'usage' },
      returns = { 'buffer' }
    },
    {
      description = [[
        These variants accept a custom vertex format.  For more info, see the <a
        data-key="Buffer">`Buffer`</a> page.
      ]],
      arguments = { 'format', 'size', 'mode', 'usage' },
      returns = { 'buffer' }
    },
    {
      arguments = { 'format', 'vertices', 'mode', 'usage' },
      returns = { 'buffer' }
    }
  },
  notes = 'Once created, the size of the Buffer can\'t be changed.'
}
