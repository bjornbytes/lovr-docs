return {
  summary = 'Set the motor mode of the SliderJoint.',
  description = [[
    Sets the motor mode of the SliderJoint.  When enabled, the motor will drive the slider to a
    target position (for the `position` mode) or a target speed (for the `velocity` mode), set by
    `SliderJoint:setMotorTarget`.
  ]],
  arguments = {
    mode = {
      type = 'MotorMode',
      description = 'The mode of the motor.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'mode' },
      returns = {}
    },
    {
      description = 'Disables the motor.',
      arguments = {},
      returns = {}
    }
  },
  related = {
    'SliderJoint:getMotorTarget',
    'SliderJoint:setMotorTarget'
  }
}
