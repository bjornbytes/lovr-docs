return {
  summary = 'Get the spring parameters of the motor target.',
  description = [[
    Returns the spring parameters of the motor target.  These are similar to the spring parameters
    set by `SliderJoint:setSpring`, but they apply to the motor when it reaches its target instead
    of the position limits of the slider joint.  Note that these only take effect when the motor
    mode is `position`.
  ]],
  arguments = {},
  returns = {
    frequency = {
      type = 'number',
      description = [[
        The frequency of the spring, in hertz.  Higher frequencies make the spring more stiff.  When
        zero, the spring is disabled.
      ]]
    },
    damping = {
      type = 'number',
      description = 'The damping ratio of the spring.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'frequency', 'damping' }
    }
  },
  notes = 'See `SliderJoint:setSpring` for more detailed info on how the spring parameters work.',
  related = {
    'SliderJoint:getSpring',
    'SliderJoint:setSpring',
    'SliderJoint:getMotorTarget',
    'SliderJoint:setMotorTarget'
  }
}
