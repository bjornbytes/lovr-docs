return {
  summary = 'Check if an animation is playing.',
  description = 'Returns whether an animation is currently playing.',
  arguments = {
    {
      name = 'animation',
      type = 'string',
      description = 'The name of the animation.'
    }
  },
  returns = {
    {
      name = 'playing',
      type = 'boolean',
      description = 'Whether or not the animation is playing.'
    }
  }
}
