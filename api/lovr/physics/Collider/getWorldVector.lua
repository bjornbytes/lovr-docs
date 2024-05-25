return {
  summary = 'Transform a vector from local space to world space.',
  description = 'Transforms a direction vector from local space to world space.',
  arguments = {
    x = {
      type = 'number',
      description = 'The x component of the local vector.'
    },
    y = {
      type = 'number',
      description = 'The y component of the local vector.'
    },
    z = {
      type = 'number',
      description = 'The z component of the local vector.'
    },
    vector = {
      type = 'Vec3',
      description = 'The local vector.'
    }
  },
  returns = {
    wx = {
      type = 'number',
      description = 'The x component of the world vector.'
    },
    wy = {
      type = 'number',
      description = 'The y component of the world vector.'
    },
    wz = {
      type = 'number',
      description = 'The z component of the world vector.'
    }
  },
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = { 'wx', 'wy', 'wz' }
    },
    {
      arguments = { 'vector' },
      returns = { 'wx', 'wy', 'wz' }
    }
  },
  related = {
    'Collider:getLocalVector',
    'Collider:getLocalPoint',
    'Collider:getWorldPoint'
  }
}
