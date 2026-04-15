return {
  summary = 'Get the data for a single vertex in a blend shape.',
  description = [[
    Returns the data for a single vertex in a blend shape.  The data represents a displacement of
    the vertex position, normal, and tangent.
  ]],
  arguments = {
    mesh = {
      type = 'number',
      description = 'The index of a mesh.'
    },
    blendshape = {
      type = 'number',
      description = 'The index of a blend shape in the mesh.'
    },
    vertex = {
      type = 'number',
      description = 'The index of a vertex in the mesh.'
    }
  },
  returns = {
    x = {
      type = 'number',
      description = 'The x displacement of the vertex position.'
    },
    y = {
      type = 'number',
      description = 'The y displacement of the vertex position.'
    },
    z = {
      type = 'number',
      description = 'The z displacement of the vertex position.'
    },
    nx = {
      type = 'number',
      description = 'The x displacement of the vertex normal.'
    },
    ny = {
      type = 'number',
      description = 'The y displacement of the vertex normal.'
    },
    nz = {
      type = 'number',
      description = 'The z displacement of the vertex normal.'
    },
    tx = {
      type = 'number',
      description = 'The x displacement of the vertex tangent.'
    },
    ty = {
      type = 'number',
      description = 'The y displacement of the vertex tangent.'
    },
    tz = {
      type = 'number',
      description = 'The z displacement of the vertex tangent.'
    }
  },
  variants = {
    {
      arguments = { 'mesh', 'blendshape', 'vertex' },
      returns = { 'x', 'y', 'z', 'nx', 'ny', 'nz', 'tx', 'ty', 'tz' }
    }
  },
  related = {
    'ModelData:getMeshBlendShapeCount',
    'ModelData:getMeshBlendShapeName',
    'Model:getBlendShapeWeight',
    'Model:setBlendShapeWeight'
  }
}
