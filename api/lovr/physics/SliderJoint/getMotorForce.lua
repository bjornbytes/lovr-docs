return {
  summary = 'Get the current motor force.',
  description = [[
    Returns the current force the motor is using to reach its target, in newtons.
  ]],
  arguments = {},
  returns = {
    force = {
      type = 'number',
      description = 'The current force, in newtons.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'force' }
    }
  },
  related = {
    'SliderJoint:getMaxMotorForce',
    'SliderJoint:setMaxMotorForce'
  }
}
