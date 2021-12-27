return {
  tag = 'drawing',
  summary = 'Draw a mesh.',
  description = 'TODO',
  arguments = {
    material = {
      type = 'Material',
      description = 'The Material to apply to the mesh.'
    },
    mode = {
      type = 'DrawMode',
      description = 'Whether the vertices should be drawn as `points`, `lines`, or `triangles`.'
    },
    vertices = {
      type = 'Buffer',
      default = 'nil',
      description = [[
        A Buffer containing the vertices to render, or `nil` if no vertex buffer is needed.
      ]]
    },
    indices = {
      type = 'Buffer',
      description = 'A Buffer containing indices of vertices to render.'
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
    },
    indirect = {
      type = 'Buffer',
      description = 'A Buffer containing parameters for the draw.'
    },
    indirectcount = {
      type = 'number',
      default = '1',
      description = 'How many draws to read and render from the indirect buffer.'
    },
    indirectoffset = {
      type = 'number',
      default = '0',
      description = 'A byte offset of where the draw parameters are stored in the indirect buffer.'
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
      arguments = { 'mode', 'vertices', 'transform', 'start', 'count', 'instances' },
      returns = {}
    },
    {
      arguments = { 'mode', 'vertices', 'indices', 'transform', 'start', 'count', 'instances' },
      returns = {}
    },
    {
      arguments = { 'vertices', 'transform', 'indirect', 'indirectcount', 'indirectoffset' },
      returns = {}
    },
    {
      arguments = { 'vertices', 'indices', 'transform', 'indirect', 'indirectcount', 'indirectoffset' },
      returns = {}
    },
    {
      arguments = { 'mode', 'vertices', 'transform', 'indirect', 'indirectcount', 'indirectoffset' },
      returns = {}
    },
    {
      arguments = { 'mode', 'vertices', 'indices', 'transform', 'indirect', 'indirectcount', 'indirectoffset' },
      returns = {}
    }
  },
  notes = [[
    When `vertices` is `nil`, the mesh will still be rendered with `count` vertices and the vertex
    shader will still run.  The vertex shader can generate the vertex positions or read data from
    other variables to compute the final vertex position.  An index buffer can still be used too.

    TODO lots
    TODO material combinatorial explosion
  ]]
}
