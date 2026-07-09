return {
  summary = 'Get a quaternion that looks in a direction.',
  description = [[
    Returns a quaternion that looks in a direction.  More accurately, it returns a quaternion that
    rotates from the forward vector (0, 0, -1) to a given direction.

    The `up` vector is used to control the "roll" of the orientation, since there are an infinite
    number of orientations that look in a given direction.
  ]],
  arguments = {
    direction = {
      type = 'vector',
      description = 'The direction to look towards.  It does not need to be normalized.'
    },
    up = {
      type = 'vector?',
      default = 'vector.up',
      description = 'The up vector.  It does not need to be normalized.'
    }
  },
  returns = {
    q = {
      type = 'quaternion',
      description = 'A quaternion that rotates from the forward vector to `direction`.'
    }
  },
  variants = {
    {
      arguments = { 'direction', 'up' },
      returns = { 'q' }
    }
  },
  example = {
    description = 'This is very useful for rotating an object to face a target.',
    code = [[
      local origin = vector(x, y, z) -- the position of the object
      local target = vector(tx, ty, tz) -- what it should look at

      local rotation = quaternion.lookdir(target - origin)

      pass:draw(model, origin, 1, rotation)
    ]]
  },
  related = {
    'quaternion.between',
    'quaternion.direction',
    'Mat4:target'
  }
}
