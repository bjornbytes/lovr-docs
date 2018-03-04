return {
  tag = 'graphicsObjects',
  summary = 'Create a new Mesh.',
  description = [[
    Creates a new Mesh.  You must specify either the capacity for the Mesh or an initial set of
    vertex data.  The draw mode and usage hint can also optionally be specified.
  ]],
  arguments = {
    size = {
      type = 'number',
      description = 'The maximum number of vertices the Mesh can store.'
    },
    mode = {
      type = 'MeshDrawMode',
      default = [['fan']],
      description = 'How the Mesh will render its vertices.'
    },
    usage = {
      type = 'MeshUsage',
      default = [['dynamic']],
      description = 'How the Mesh will be updated.'
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
    mesh = {
      type = 'Mesh',
      description = 'The new Mesh.'
    }
  },
  variants = {
    {
      arguments = { 'size', 'mode', 'usage' },
      returns = { 'mesh' }
    },
    {
      arguments = { 'vertices', 'mode', 'usage' },
      returns = { 'mesh' }
    },
    {
      description = [[
        These variants accept a custom vertex format.  For more info, see the <a
        data-key="Mesh">`Mesh`</a> page.
      ]],
      arguments = { 'format', 'size', 'mode', 'usage' },
      returns = { 'mesh' }
    },
    {
      arguments = { 'format', 'vertices', 'mode', 'usage' },
      returns = { 'mesh' }
    }
  },
  notes = 'Once created, the size of the Mesh can\'t be changed.'
}
