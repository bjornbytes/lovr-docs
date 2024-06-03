return {
  summary = 'Set the friction of the SliderJoint.',
  description = [[
    Sets the friction of the SliderJoint.  This is a maximum friction force that will be applied, in
    newtons, opposing movement along the slider axis.
  ]],
  arguments = {
    friction = {
      type = 'number',
      description = 'The maximum friction force, in newtons.'
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
