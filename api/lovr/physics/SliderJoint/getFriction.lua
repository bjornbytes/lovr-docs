return {
  summary = 'Get the friction of the SliderJoint.',
  description = [[
    Returns the friction of the SliderJoint.  This is a maximum friction force that will be applied,
    in newtons, opposing movement along the slider axis.
  ]],
  arguments = {},
  returns = {
    friction = {
      type = 'number',
      description = 'The maximum friction force, in newtons.'
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
