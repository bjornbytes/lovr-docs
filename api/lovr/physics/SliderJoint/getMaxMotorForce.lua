return {
  summary = 'Get the maximum amount of force the motor can use.',
  description = [[
    Returns the maximum amount of force the motor can use to reach its target, in newtons.

    There are separate limits for each direction the slider can move.  They're usually kept the
    same, but one of them can be set to zero to make a motor that can only push in one direction.
    Note that both limits are positive.
  ]],
  arguments = {},
  returns = {
    positive = {
      type = 'number',
      description = [[
        The maximum amount of force the motor can use to push the slider in the "positive"
        direction, in newtons.
      ]]
    },
    negative = {
      type = 'number',
      description = [[
        The maximum amount of force the motor can use to push the slider in the "negative"
        direction, in newtons.
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
    'SliderJoint:getMotorForce'
  }
}
