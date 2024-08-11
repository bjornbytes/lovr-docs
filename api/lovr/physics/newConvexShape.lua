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
      arguments = { 'points' },
      returns = { 'shape' }
    },
    {
      arguments = { 'modelData' },
      returns = { 'shape' }
    },
    {
      arguments = { 'model' },
      returns = { 'shape' }
    },
    {
      arguments = { 'mesh' },
      returns = { 'shape' }
    },
    {
      arguments = { 'template' },
      returns = { 'shape' }
    }
  },
  notes = 'A Shape can be attached to a Collider using `Collider:addShape`.',
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
