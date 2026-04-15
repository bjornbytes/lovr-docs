return {
  summary = 'Get the data for a single vertex in a mesh.',
  description = 'Returns the data for a single vertex in a mesh.',
  arguments = {
    mesh = {
      type = 'number',
      description = 'The index of a mesh to get the vertex from.'
    },
    vertex = {
      type = 'number',
      description = 'The index of a vertex in the mesh to retrieve.'
    }
  },
  returns = {
    x = {
      type = 'number',
      description = 'The x component of the position.'
    },
    y = {
      type = 'number',
      description = 'The y component of the position.'
    },
    z = {
      type = 'number',
      description = 'The z component of the position.'
    },
    nx = {
      type = 'number',
      description = 'The x component of the normal vector.'
    },
    ny = {
      type = 'number',
      description = 'The y component of the normal vector.'
    },
    nz = {
      type = 'number',
      description = 'The z component of the normal vector.'
    },
    u = {
      type = 'number',
      description = 'The u component of the texture coordinate.'
    },
    v = {
      type = 'number',
      description = 'The v component of the texture coordinate.'
    },
    u2 = {
      type = 'number',
      description = 'The u component of the second texture coordinate.'
    },
    v2 = {
      type = 'number',
      description = 'The v component of the second texture coordinate.'
    },
    r = {
      type = 'number',
      description = 'The r component of the vertex color (0 to 255).'
    },
    g = {
      type = 'number',
      description = 'The g component of the vertex color (0 to 255).'
    },
    b = {
      type = 'number',
      description = 'The b component of the vertex color (0 to 255).'
    },
    a = {
      type = 'number',
      description = 'The a component of the vertex color (0 to 255).'
    },
    tx = {
      type = 'number',
      description = 'The x component of the tangent vector.'
    },
    ty = {
      type = 'number',
      description = 'The y component of the tangent vector.'
    },
    tz = {
      type = 'number',
      description = 'The z component of the tangent vector.'
    }
  },
  variants = {
    {
      arguments = { 'mesh', 'vertex' },
      returns = { 'x', 'y', 'z', 'nx', 'ny', 'nz', 'u', 'v', 'u2', 'v2', 'r', 'g', 'b', 'a', 'tx', 'ty', 'tz' }
    }
  },
  related = {
    'ModelData:getMeshVertexCount',
    'ModelData:getMeshIndex',
    'ModelData:getMeshBlendVertex'
  }
}
