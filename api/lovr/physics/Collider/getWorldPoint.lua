return {
  summary = 'Transform a point from local space to world space.',
  description = [[
    Transforms a local point relative to the collider to a point in world coordinates.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x component of the local point.'
    },
    y = {
      type = 'number',
      description = 'The y component of the local point.'
    },
    z = {
      type = 'number',
      description = 'The z component of the local point.'
    },
    point = {
      type = 'Vec3',
      description = 'The local point.'
    }
  },
  returns = {
    wx = {
      type = 'number',
      description = 'The x component of the world point.'
    },
    wy = {
      type = 'number',
      description = 'The y component of the world point.'
    },
    wz = {
      type = 'number',
      description = 'The z component of the world point.'
    }
  },
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = { 'wx', 'wy', 'wz' }
    },
    {
      arguments = { 'point' },
      returns = { 'wx', 'wy', 'wz' }
    }
  },
  related = {
    'Collider:getLocalPoint',
    'Collider:getLocalVector',
    'Collider:getWorldVector'
  }
}
