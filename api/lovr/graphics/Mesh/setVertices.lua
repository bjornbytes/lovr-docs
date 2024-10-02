return {
  summary = 'Set vertices in the Mesh.',
  description = 'Sets the data for vertices in the Mesh.',
  arguments = {
    vertices = {
      type = 'table',
      description = [[
        A table of vertices, where each vertex is a table of numbers matching the vertex format of
        the Mesh.
      ]]
    },
    blob = {
      type = 'Blob',
      description = 'A Blob containing binary vertex data.'
    },
    index = {
      type = 'number',
      default = '1',
      description = 'The index of the first vertex to return.'
    },
    count = {
      type = 'number',
      default = 'nil',
      description = [[
        The number of vertices to return.  If nil, returns the "rest" of the vertices, based on the
        `index` argument.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'vertices', 'index', 'count' },
      returns = {}
    },
    {
      arguments = { 'blob', 'index', 'count' },
      returns = {}
    }
  },
  notes = [[
    Note that a `Pass` that draws a Mesh will only "see" the vertices as they exist when the pass is
    submitted.  So, if this function is used to change vertices multiple times before submitting the
    Pass, only the final value of each vertex will be used.  Example:

        function lovr.draw(pass)
          -- Due to the second :setVertices call below, the Mesh
          -- contains a sphere when this pass is submitted!  So
          -- this code will actually draw 2 spheres!
          mesh:setVertices(cube)
          pass:draw(mesh, x1, y1, z1)

          mesh:setVertices(sphere)
          pass:draw(mesh, x2, y2, z2)
        end

    If you want multiple meshes, then use multiple Mesh objects!  Or, *append* vertices to the Mesh
    instead of replacing them, and use `Mesh:setDrawRange` to control which vertices are drawn for a
    particular draw call.

    CPU meshes will write the data to CPU memory and upload any changes to the GPU before the Mesh
    is drawn.  GPU meshes don't store this CPU copy of the data, and will immediately upload the new
    vertex data to VRAM.  This means that multiple calls to this function might be slower on a `gpu`
    mesh.
  ]],
  related = {
    'Mesh:getVertexBuffer',
    'Mesh:getVertexFormat',
    'Mesh:getIndices',
    'Mesh:setIndices'
  }
}
