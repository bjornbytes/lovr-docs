return {
  summary = 'Set the target of the slider motor.',
  description = [[
    Sets the target value for the SliderJoint's motor.  This is either a target position or a target
    velocity, based on the mode set by `SliderJoint:setMotorMode`.
  ]],
  arguments = {
    target = {
      type = 'number',
      description = 'The target value, in meters or meters per second, depending on the mode.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'mode' },
      returns = {}
    }
  },
  related = {
    'SliderJoint:getMotorMode',
    'SliderJoint:setMotorMode'
  }
}
