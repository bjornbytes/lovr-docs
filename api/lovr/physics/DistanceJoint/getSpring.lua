return {
  summary = 'Get the spring parameters of the joint.',
  description = [[
    Returns the DistanceJoint's spring parameters.  Use this to control how fast the joint pulls the
    colliders back together at the distance limits.
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
  notes = [[
    Higher frequencies make the spring more stiff.  When zero (the default), the spring is disabled
    and the limits will be as stiff as possible.

    The damping ratio controls how quickly the oscillation slows down:

    - Undamped: Zero damping will cause the spring to oscillate forever.  (Note that the spring may
      still lose a small amount of energy over time).
    - Underdamped: Damping less than one results in a system that is underdamped.  The spring will
      oscillate around the target, but the oscillations will decay over time, eventually stabilizing
      at the target.
    - Overdamped: Damping greater than one will not have any oscillation, and the spring will take
      extra time to reach the target.
    - Critical Damping: When the damping is exactly 1.0, there is no oscillation and the spring
      takes the minimum amount of time to reach the target (based on the frequency).

    The default damping ratio is zero.
  ]]
}
