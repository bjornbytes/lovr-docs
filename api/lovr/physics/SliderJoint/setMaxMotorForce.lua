return {
  summary = 'Set the maximum amount of force the motor can use.',
  description = [[
    Sets the maximum amount of force the motor can use to reach its target, in newtons.

    There are separate limits for each direction the slider can move.  They're usually kept the
    same, but one of them can be set to zero to make a motor that can only push in one direction.
    Note that both limits are positive.
  ]],
  arguments = {
    positive = {
      type = 'number',
      default = 'math.huge',
      description = [[
        The maximum amount of force the motor can use to push the slider in the "positive"
        direction, in newtons.
      ]]
    },
    negative = {
      type = 'number',
      default = 'positive',
      description = [[
        The maximum amount of force the motor can use to push the slider in the "negative"
        direction, in newtons.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = {},
      returns = { 'positive', 'negative' }
    }
  },
  related = {
    'SliderJoint:getMotorForce'
  }
}
