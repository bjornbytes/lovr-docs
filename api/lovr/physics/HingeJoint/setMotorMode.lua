return {
  summary = 'Set the motor mode of the HingeJoint.',
  description = [[
    Sets the motor mode of the HingeJoint.  When enabled, the motor will drive the hinge to a target
    angle (for the `position` mode) or a target speed (for the `velocity` mode), set by
    `HingeJoint:setMotorTarget`.
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
    'HingeJoint:getMotorTarget',
    'HingeJonit:setMotorTarget'
  }
}
