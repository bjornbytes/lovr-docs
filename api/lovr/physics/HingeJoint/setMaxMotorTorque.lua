return {
  summary = 'Set the maximum amount of torque the motor can use.',
  description = [[
    Sets the maximum amount of torque the motor can use to reach its target, in newton meters.

    There are separate limits for each direction the hinge can move.  They're usually kept the same,
    but one of them can be set to zero to make a motor that can only push in one direction.  Note
    that both limits are positive.
  ]],
  arguments = {
    positive = {
      type = 'number',
      default = 'math.huge',
      description = [[
        The maximum amount of torque the motor can use to push the hinge in the "positive"
        direction, in newton meters.
      ]]
    },
    negative = {
      type = 'number',
      default = 'positive',
      description = [[
        The maximum amount of torque the motor can use to push the hinge in the "negative"
        direction, in newton meters.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'positive', 'negative' },
      returns = {}
    }
  },
  related = {
    'HingeJoint:getMotorTorque'
  }
}
