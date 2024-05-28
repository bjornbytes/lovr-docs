return {
  summary = 'Set the friction of the HingeJoint.',
  description = [[
    Sets the friction of the HingeJoint.  This is a maximum torque force that will be applied, in
    newton meters.
  ]],
  arguments = {
    friction = {
      type = 'number',
      description = 'The friction, in newton meters.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'friction' },
      returns = {}
    }
  },
  notes = 'Friction is only applied when the motor is disabled.'
}
