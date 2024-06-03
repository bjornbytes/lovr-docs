return {
  summary = 'Get the maximum amount of torque the motor can use.',
  description = [[
    Returns the maximum amount of torque the motor can use to reach its target, in newton meters.

    There are separate limits for each direction the hinge can move.  They're usually kept the same,
    but one of them can be set to zero to make a motor that can only push in one direction.  Note
    that both limits are positive.
  ]],
  arguments = {},
  returns = {
    positive = {
      type = 'number',
      description = [[
        The maximum amount of torque the motor can use to push the hinge in the "positive"
        direction, in newton meters.
      ]]
    },
    negative = {
      type = 'number',
      description = [[
        The maximum amount of torque the motor can use to push the hinge in the "negative"
        direction, in newton meters.
      ]]
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'positive', 'negative' }
    }
  },
  related = {
    'HingeJoint:getMotorTorque'
  }
}
