return {
  summary = 'Apply torque to the Collider.',
  description = 'Applies torque to the Collider.',
  arguments = {
    {
      name = 'x',
      type = 'number',
      description = 'The x component of the torque.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y component of the torque.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z component of the torque.'
    }
  },
  returns = {},
  related = {
    'Collider:applyForce'
  }
}
