return {
  summary = 'Get the torque used to satisfy the Joint\'s constraint.',
  description = [[
    Returns the magnitude of the torque used to satisfy the Joint's constraint during the last
    physics update, in newton meters.

    This is useful for breakable joints.  Use `Joint:destroy` to break the joint if its torque goes
    above a threshold.
  ]],
  arguments = {},
  returns = {
    torque = {
      type = 'number',
      description = 'The magnitude of the torque used to satisfy the Joint\'s constraint.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'torque' }
    }
  },
  notes = [[
    This does not include the motor force of a `HingeJoint`, see `HingeJoint:getMotorForce`.
  ]],
  related = {
    'Joint:getForce',
    'HingeJoint:getMotorTorque'
  }
}
