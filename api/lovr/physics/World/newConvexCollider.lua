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
    },
    scale = {
      type  = 'number',
      default = '1.0',
      description = 'A scale to apply to the points.'
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
      arguments = { 'x', 'y', 'z', 'points', 'scale' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'points', 'scale' },
      returns = { 'collider' }
    },
    {
      arguments = { 'x', 'y', 'z', 'modelData', 'scale' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'modelData', 'scale' },
      returns = { 'collider' }
    },
    {
      arguments = { 'x', 'y', 'z', 'model', 'scale' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'model', 'scale' },
      returns = { 'collider' }
    },
    {
      arguments = { 'x', 'y', 'z', 'mesh', 'scale' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'mesh', 'scale' },
      returns = { 'collider' }
    },
    {
      description = [[
        Clones an existing ConvexShape, which is faster than passing the same points multiple times.
        Clones can have their own scale.  The clone's scale doesn't get multiplied with the scale of
        the template.
      ]],
      arguments = { 'x', 'y', 'z', 'template', 'scale' },
      returns = { 'collider' }
    },
    {
      description = [[
        Clones an existing ConvexShape, which is faster than passing the same points multiple times.
        Clones can have their own scale.  The clone's scale doesn't get multiplied with the scale of
        the template.
      ]],
      arguments = { 'position', 'template', 'scale' },
      returns = { 'collider' }
    }
  },
  notes = [[
    This will throw an error if there are too many colliders in the world.  The limit defaults to
    16384 and can be changed in `lovr.physics.newWorld`.
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
