return {
  summary = 'Get the friction of the HingeJoint.',
  description = [[
    Returns the friction of the HingeJoint.  This is a maximum torque force that will be applied, in
    newton meters.
  ]],
  arguments = {},
  returns = {
    friction = {
      type = 'number',
      description = 'The friction, in newton meters.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'friction' }
    }
  },
  notes = 'Friction is only applied when the motor is disabled.'
}
