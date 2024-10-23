return {
  summary = 'Create a new ConvexShape.',
  description = 'Creates a new ConvexShape.',
  arguments = {
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
    shape = {
      type = 'ConvexShape',
      description = 'The new ConvexShape.'
    }
  },
  variants = {
    {
      arguments = { 'points', 'scale' },
      returns = { 'shape' }
    },
    {
      arguments = { 'modelData', 'scale' },
      returns = { 'shape' }
    },
    {
      arguments = { 'model', 'scale' },
      returns = { 'shape' }
    },
    {
      arguments = { 'mesh', 'scale' },
      returns = { 'shape' }
    },
    {
      description = [[
        Clones an existing ConvexShape, which is faster than passing the same points multiple times.
        Clones can have their own scale.  The clone's scale doesn't get multiplied with the scale of
        the template.
      ]],
      arguments = { 'template', 'scale' },
      returns = { 'shape' }
    }
  },
  related = {
    'ConvexShape',
    'lovr.physics.newBoxShape',
    'lovr.physics.newSphereShape',
    'lovr.physics.newCapsuleShape',
    'lovr.physics.newCylinderShape',
    'lovr.physics.newMeshShape',
    'lovr.physics.newTerrainShape'
  }
}
