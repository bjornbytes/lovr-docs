return {
  summary = 'Get the target of the slider motor.',
  description = [[
    Returns the target value for the SliderJoint's motor.  This is either a target position or a
    target velocity, based on the mode set by `SliderJoint:setMotorMode`.
  ]],
  arguments = {},
  returns = {
    target = {
      type = 'number',
      description = 'The target value, in meters or meters per second, depending on the mode.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'target' }
    }
  },
  related = {
    'SliderJoint:getMotorMode',
    'SliderJoint:setMotorMode'
  }
}
