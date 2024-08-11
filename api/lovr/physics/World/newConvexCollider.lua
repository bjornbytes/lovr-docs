return {
  summary = 'Add a Collider with a ConvexShape to the World.',
  description = [[
    Adds a Collider to the world and attaches a `ConvexShape`.  A `ConvexShape` is a convex hull of
    a set of points, kinda like if you wrapped them in wrapping paper.
  ]],
  arguments = {
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate of the collider, in meters.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y coordinate of the collider, in meters.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate of the collider, in meters.'
    },
    position = {
      type = 'Vec3',
      description = 'The position of the center of the capsule, in meters.'
    },
    points = {
      type = 'table',
      description = [[
        A list of vertices to compute a convex hull from.  Can be a table of tables (each with 3
        numbers) or a table of numbers (every 3 numbers form a 3D point).
      ]]
    },
    modelData = {
      type = 'ModelData',
      description = 'The ModelData to compute a convex hull from.'
    },
    model = {
      type = 'Model',
      description = 'The Model to compute a convex hull from.'
    },
    mesh = {
      type = 'Mesh',
      description = 'The Mesh to compute a convex hull from.  It must use the `cpu` storage mode.'
    },
    template = {
      type = 'ConvexShape',
      description = 'An existing ConvexShape to clone.'
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
      arguments = { 'x', 'y', 'z', 'points' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'points' },
      returns = { 'collider' }
    },
    {
      arguments = { 'x', 'y', 'z', 'modelData' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'modelData' },
      returns = { 'collider' }
    },
    {
      arguments = { 'x', 'y', 'z', 'model' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'model' },
      returns = { 'collider' }
    },
    {
      arguments = { 'x', 'y', 'z', 'mesh' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'mesh' },
      returns = { 'collider' }
    },
    {
      arguments = { 'x', 'y', 'z', 'template' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'template' },
      returns = { 'collider' }
    }
  },
  notes = [[
    This will throw an error if there are too many colliders in the world.  The limit defaults to
    16384 and can be changed in `lovr.physics.newWorld`.

    Computing the convex hull is expensive.  If you need a lot of colliders with the same convex
    hull shape, it's much faster to pass an existing ConvexShape to this function.
  ]],
  related = {
    'ConvexShape',
    'Collider',
    'World:newCollider',
    'World:newBoxCollider',
    'World:newSphereCollider',
    'World:newCapsuleCollider',
    'World:newCylinderCollider',
    'World:newMeshCollider',
    'World:newTerrainCollider'
  }
}
