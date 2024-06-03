return {
  summary = 'Get the current motor torque.',
  description = [[
    Returns the current torque the motor is using to reach its target, in newton meters.
  ]],
  arguments = {},
  returns = {
    torque = {
      type = 'number',
      description = 'The current torque, in newton meters.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'torque' }
    }
  },
  related = {
    'HingeJoint:getMaxMotorTorque',
    'HingeJoint:setMaxMotorTorque'
  }
}
