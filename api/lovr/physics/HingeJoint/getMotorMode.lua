return {
  summary = 'Get the motor mode of the HingeJoint.',
  description = [[
    Returns the motor mode of the HingeJoint.  When enabled, the motor will drive the hinge to a
    target angle (for the `position` mode) or a target speed (for the `velocity` mode), set by
    `HingeJoint:setMotorTarget`.
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
    'HingeJoint:getMotorTarget',
    'HingeJonit:setMotorTarget'
  }
}
