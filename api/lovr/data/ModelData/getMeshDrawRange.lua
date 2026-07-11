return {
  summary = 'Get the vertex range of a mesh part.',
  description = [[
    Returns the vertex range of a part of a mesh.  Meshes can be split into multiple "parts", and
    each part can have its own draw mode and material.
  ]],
  arguments = {
    mesh = {
      type = 'number',
      description = 'The index of a mesh.'
    },
    part = {
      type = 'number',
      default = '1',
      description = 'The index of a part.'
    }
  },
  returns = {
    start = {
      type = 'number',
      description = 'The index of the first vertex or index in the part.'
    },
    count = {
      type = 'number',
      description = 'The number of vertices or indices in the part.'
    }
  },
  variants = {
    {
      arguments = { 'mesh', 'part' },
      returns = { 'start', 'count' }
    }
  },
  notes = [[
    Parts will always use the full set of vertices/indices in the mesh, in order.

    If the mesh has indices, then the draw range will be in terms of indices, otherwise it will be
    vertices.  This matches the way `Mesh:setDrawRange` works.
  ]],
  related = {
    'ModelData:getMeshDrawMode',
    'ModelData:getMeshMaterial',
    'Model:getMeshDrawRange'
  }
}
