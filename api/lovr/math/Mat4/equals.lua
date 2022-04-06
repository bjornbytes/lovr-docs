return {
  summary = 'Check if a matrix equals another matrix.',
  description = 'Returns whether a matrix is approximately equal to another matrix.',
  arguments = {
    {
      name = 'n',
      type = 'Mat4',
      description = 'The other matrix.'
    }
  },
  returns = {
    {
      name = 'equal',
      type = 'boolean',
      description = 'Whether the 2 matrices approximately equal each other.'
    }
  },
  related = {
    'Vec2:equals',
    'Vec3:equals',
    'Vec4:equals',
    'Quat:equals'
  }
}
