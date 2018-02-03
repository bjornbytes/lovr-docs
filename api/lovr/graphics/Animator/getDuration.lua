return {
  summary = 'Get the duration of an animation.',
  description = 'Returns the duration of an animation.',
  arguments = {
    {
      name = 'name',
      type = 'string',
      description = 'The name of the animation.'
    }
  },
  returns = {
    {
      name = 'duration',
      type = 'number',
      description = 'The duration of the animation at its normal speed, in seconds.'
    }
  },
  related = {
    'Animator:seek',
    'Animator:tell'
  }
}
