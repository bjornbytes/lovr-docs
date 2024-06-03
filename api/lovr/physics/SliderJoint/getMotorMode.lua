return {
  summary = 'Get the motor mode of the SliderJoint.',
  description = [[
    Returns the motor mode of the SliderJoint.  When enabled, the motor will drive the slider to a
    target position (for the `position` mode) or a target speed (for the `velocity` mode), set by
    `SliderJoint:setMotorTarget`.
  ]],
  arguments = {},
  returns = {
    mode = {
      type = 'MotorMode',
      description = 'The mode of the motor, or `nil` if the motor is disabled.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'mode' }
    }
  },
  related = {
    'SliderJoint:getMotorTarget',
    'SliderJoint:setMotorTarget'
  }
}
