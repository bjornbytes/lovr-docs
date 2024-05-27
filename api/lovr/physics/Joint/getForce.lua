return {
  summary = 'Get the force used to satisfy the Joint\'s constraint.',
  description = [[
    Returns the magnitude of the force used to satisfy the Joint's constraint during the last
    physics update, in newtons.

    This is useful for breakable joints.  Use `Joint:destroy` to break the joint if its force goes
    above a threshold.
  ]],
  arguments = {},
  returns = {
    force = {
      type = 'number',
      description = 'The magnitude of the force used to satisfy the Joint\'s constraint.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'force' }
    }
  },
  notes = [[
    This does not include the motor force of a `SliderJoint`, see `SliderJoint:getMotorForce`.
    that.
  ]],
  related = {
    'Joint:getTorque',
    'SliderJoint:getMotorForce'
  }
}
