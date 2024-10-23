return {
  summary = 'Create a new MeshShape.',
  description = 'Creates a new MeshShape.',
  arguments = {
    vertices = {
      type = 'table',
      description = 'The table of vertices in the mesh.  Each vertex is a table with 3 numbers.'
    },
    indices = {
      type = 'table',
      description = [[
        A table of triangle indices representing how the vertices are connected in the Mesh.
      ]]
    },
    modelData = {
      type = 'ModelData',
      description = 'The ModelData to use the vertices from.'
    },
    model = {
      type = 'Model',
      description = [[
        A Model to use for the mesh data.  Similar to calling `Model:getTriangles` and passing it to
        this function, but has better performance.
      ]]
    },
    mesh = {
      type = 'Mesh',
      description = 'The Mesh to use the vertices from.  It must use the `cpu` storage mode.'
    },
    template = {
      type = 'MeshShape',
      description = 'An existing MeshShape to clone.'
    },
    scale = {
      type  = 'number',
      default = '1.0',
      description = 'A scale to apply to the mesh vertices.'
    }
  },
  returns = {
    mesh = {
      type = 'MeshShape',
      description = 'The new MeshShape.'
    }
  },
  variants = {
    {
      arguments = { 'vertices', 'indices', 'scale' },
      returns = { 'mesh' }
    },
    {
      arguments = { 'modelData', 'scale' },
      returns = { 'mesh' }
    },
    {
      arguments = { 'model', 'scale' },
      returns = { 'mesh' }
    },
    {
      arguments = { 'mesh', 'scale' },
      returns = { 'mesh' }
    },
    {
      description = [[
        Clones an existing MeshShape, which is faster than passing the same mesh multiple times.
        Clones can have their own scale.  The clone's scale doesn't get multiplied with the scale of
        the template.
      ]],
      arguments = { 'template', 'scale' },
      returns = { 'mesh' }
    }
  },
  related = {
    'MeshShape',
    'lovr.physics.newBoxShape',
    'lovr.physics.newSphereShape',
    'lovr.physics.newCapsuleShape',
    'lovr.physics.newCylinderShape',
    'lovr.physics.newConvexShape',
    'lovr.physics.newTerrainShape',
    'Model:getTriangles'
  }
}
