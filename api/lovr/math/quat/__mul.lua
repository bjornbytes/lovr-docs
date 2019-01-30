return {
  summary = 'Multiply a quaternion by another quaternion or a vector.',
  description = [[
    Multiplies this quaternion by another value.  If the value is a quaternion, the rotations in the
    two quaternions are applied sequentially and a new temporary quaternion is returned with the
    result.  If the value is a vector, then a new temporary rotated vector is returned.
  ]],
  arguments = {
    r = {
      type = 'quat',
      description = 'A quaternion to combine with the original.'
    },
    v = {
      type = 'vec3',
      description = 'A vector to rotate.'
    }
  },
  returns = {
    s = {
      type = 'quat',
      description = 'The temporary combined quaternion.'
    },
    u = {
      type = 'vec3',
      description = 'The temporary rotated vector.'
    }
  },
  variants = {
    {
      arguments = { 'q', 'r' },
      returns = { 's' },
    },
    {
      arguments = { 'q', 'v' },
      returns = { 'u' }
    }
  },
  related = {
    'quat:mul'
  }
}
