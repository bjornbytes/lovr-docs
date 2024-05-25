return {
  summary = 'Transform a point from world space to collider space.',
  description = [[
    Transforms a point from world coordinates into local coordinates relative to the Collider.
  ]],
  arguments = {
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
    },
    point = {
      type = 'Vec3',
      description = 'The world point.'
    }
  },
  returns = {
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
    }
  },
  variants = {
    {
      arguments = { 'wx', 'wy', 'wz' },
      returns = { 'x', 'y', 'z' }
    },
    {
      arguments = { 'point' },
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'Collider:getWorldPoint',
    'Collider:getLocalVector',
    'Collider:getWorldVector'
  }
}
