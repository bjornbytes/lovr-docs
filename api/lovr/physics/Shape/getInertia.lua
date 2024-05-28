return {
  summary = 'Get the inertia of the Shape.',
  description = [[
    Returns the inertia of the Shape.

    Inertia is kind of like "angular mass".  Regular mass determines how resistant a Collider is to
    linear forces (movement), whereas inertia determines how resistant the Collider is to torque
    (rotation).  Colliders with less inertia are more spinny.

    In 3D, inertia is represented by a 3x3 matrix, called a tensor.  To make calculations easier,
    the physics engine stores the inertia using eigenvalue decomposition, splitting the matrix into
    a diagonal matrix and a rotation.  It's complicated!

    In a realistic simulation, mass and inertia follow a linear relationship.  If the mass of an
    object increases, the diagonal part of its inertia should increase proportionally.
  ]],
  arguments = {},
  returns = {
    dx = {
      type = 'number',
      description = 'The x component of the diagonal matrix.'
    },
    dy = {
      type = 'number',
      description = 'The y component of the diagonal matrix.'
    },
    dz = {
      type = 'number',
      description = 'The z component of the diagonal matrix.'
    },
    angle = {
      type = 'number',
      description = 'The angle of the inertia rotation.'
    },
    ax = {
      type = 'number',
      description = 'The x component of the inertia rotation axis.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the inertia rotation axis.'
    },
    az = {
      type = 'number',
      description = 'The z component of the inertia rotation axis.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'dx', 'dy', 'dz', 'angle', 'ax', 'ay', 'az' }
    }
  },
  notes = [[
    `MeshShape` and `TerrainShape` do not have mass or volue, and for those shapes this function
    returns zeroes.
  ]],
  related = {
    'Shape:getMass',
    'Shape:getCenterOfMass',
    'Collider:getInertia'
  }
}
