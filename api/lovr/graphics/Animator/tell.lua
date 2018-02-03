return {
  summary = 'Get the current time of an animation.',
  description = 'Returns the current playback time of an animation.',
  arguments = {
    {
      name = 'name',
      type = 'string',
      description = 'The name of the animation.'
    }
  },
  returns = {
    {
      name = 'time',
      type = 'number',
      description = 'The current time the animation is at, in seconds.'
    }
  },
  notes = 'This will always be between 0 and the animation\'s duration.',
  related = {
    'Animator:seek',
    'Animator:getDuration'
  }
}
