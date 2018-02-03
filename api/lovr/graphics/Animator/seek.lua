return {
  summary = 'Seek to a specific time in an animation.',
  description = 'Seeks to a specific time in an animation.',
  arguments = {
    {
      name = 'name',
      type = 'string',
      description = 'The name of the animation to seek.'
    },
    {
      name = 'time',
      type = 'number',
      description = 'The time to seek to, in seconds.'
    }
  },
  returns = {},
  notes = [[
    If the time is greater than the duration of the animation, the animation will stop if it isn't
    currently looping.  Negative time values are supported for animations (regardless of looping
    state) and will seek backwards from the animation's end time.

    Seeking an animation does not stop or play the animation.
  ]],
  related = {
    'Animator:tell',
    'Animator:getDuration'
  }
}
