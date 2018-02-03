return {
  summary = 'Stop an animation.',
  description = 'Stops an animation.',
  arguments = {
    {
      name = 'name',
      type = 'string',
      description = 'The animation to stop.'
    }
  },
  returns = {},
  related = {
    'Animator:play',
    'Animator:reset',
    'Animator:pause',
    'Animator:resume',
    'Animator:isPlaying',
    'Animator:getAnimationNames'
  }
}
