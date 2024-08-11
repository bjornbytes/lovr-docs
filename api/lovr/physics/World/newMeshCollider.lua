return {
  summary = 'Add a Collider with a MeshShape to the World.',
  description = [[
    Adds a Collider to the world and attaches a `MeshShape`.

    Colliders with mesh shapes are immobile and can only be used for static environment objects.
    The collider will be kinematic and forces/velocities will not move it.  Also, these colliders
    will not detect collisions with other kinematic objects.

    MeshShapes are not treated as solid objects, but instead a collection of triangles.  They do not
    have mass or volume, and there is no concept of being "inside" a mesh.  `ConvexShape` is a good
    alternative for solid objects with an arbitrary shape.
  ]],
  arguments = {
    vertices = {
      type = 'table',
      description = [[
        A table of vertices in the mesh.  Can be a table of tables (each with 3 numbers) or a table
        of numbers (every 3 numbers form a 3D vertex).
      ]]
    },
    indices = {
      type = 'table',
      description = [[
        A table of triangle indices representing how the vertices are connected together into
        triangles.
      ]]
    },
    modelData = {
      type = 'ModelData',
      description = 'A ModelData to use for the mesh data.'
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
      description = 'A Mesh to use for the mesh data.  It must use the `cpu` storage mode.'
    },
    template = {
      type = 'MeshShape',
      description = 'An existing MeshShape to reuse.'
    }
  },
  returns = {
    collider = {
      type = 'Collider',
      description = 'The new Collider.'
    }
  },
  variants = {
    {
      arguments = { 'vertices', 'indices' },
      returns = { 'collider' }
    },
    {
      arguments = { 'modelData' },
      returns = { 'collider' }
    },
    {
      arguments = { 'model' },
      returns = { 'collider' }
    },
    {
      arguments = { 'mesh' },
      returns = { 'collider' }
    },
    {
      arguments = { 'template' },
      returns = { 'collider' }
    }
  },
  notes = 'The triangles in a MeshShape should use counterclockwise winding.',
  related = {
    'Collider',
    'MeshShape',
    'World:newCollider',
    'World:newBoxCollider',
    'World:newSphereCollider',
    'World:newCapsuleCollider',
    'World:newCylinderCollider',
    'World:newConvexCollider',
    'World:newTerrainCollider',
    'Model:getTriangles'
  }
}
