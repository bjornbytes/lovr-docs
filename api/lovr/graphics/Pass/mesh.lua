return {
  tag = 'drawing',
  summary = 'Draw a mesh.',
  description = 'TODO',
  arguments = {
    vertices = {
      type = 'Buffer',
      default = 'nil',
      description = 'TODO'
    },
    indices = {
      type = 'Buffer',
      description = 'TODO'
    },
    draws = {
      type = 'Buffer',
      description = 'TODO'
    },
    drawcount = {
      type = 'number',
      description = 'TODO'
    },
    offset = {
      type = 'number',
      description = 'TODO'
    },
    stride = {
      type = 'number',
      description = 'TODO'
    },
    transform = {
      type = 'transform',
      description = 'The transform to apply to the mesh.'
    },
    start = {
      type = 'number',
      default = '1',
      description = [[
        The 1-based index of the first vertex to render from the vertex buffer (or the first index,
        when using an index buffer).
      ]]
    },
    count = {
      type = 'number',
      default = 'nil',
      description = [[
        The number of vertices to render (or the number of indices, when using an index buffer).
        When `nil`, as many vertices or indices as possible will be drawn (based on the length of
        the Buffers and `start`).
      ]]
    },
    instances = {
      type = 'number',
      default = '1',
      description = 'The number of copies of the mesh to render.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'vertices', 'transform', 'start', 'count', 'instances' },
      returns = {}
    },
    {
      arguments = { 'vertices', 'indices', 'transform', 'start', 'count', 'instances' },
      returns = {}
    },
    {
      arguments = { 'vertices', 'indices', 'draws', 'drawcount', 'offset', 'stride' },
      returns = {}
    }
  },
  notes = 'TODO'
}
