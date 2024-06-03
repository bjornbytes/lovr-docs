return {
  summary = 'Get the target of the hinge motor.',
  description = [[
    Returns the target value for the HingeJoint's motor.  This is either a target angle or a target
    velocity, based on the mode set by `HingeJoint:setMotorMode`.
  ]],
  arguments = {},
  returns = {
    target = {
      type = 'number',
      description = 'The target value, in radians or radians per second, depending on the mode.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'target' }
    }
  },
  related = {
    'HingeJoint:getMotorMode',
    'HingeJoint:setMotorMode'
  }
}
