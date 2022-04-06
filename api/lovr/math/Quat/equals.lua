return {
  summary = 'Check if a quaternion equals another quaternion.',
  description = 'Returns whether a quaternion is approximately equal to another quaternion.',
  arguments = {
    {
      name = 'r',
      type = 'Quat',
      description = 'The other quaternion.'
    }
  },
  returns = {
    {
      name = 'equal',
      type = 'boolean',
      description = 'Whether the 2 quaternions approximately equal each other.'
    }
  },
  related = {
    'Vec2:equals',
    'Vec3:equals',
    'Vec4:equals',
    'Mat4:equals'
  }
}
