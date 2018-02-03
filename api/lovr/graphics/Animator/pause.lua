return {
  summary = 'Pause an animation.',
  description = 'Pauses an animation.  This will stop the animation without resetting its time.',
  arguments = {
    {
      name = 'name',
      type = 'string',
      description = 'The animation to pause.'
    }
  },
  returns = {},
  related = {
    'Animator:play',
    'Animator:stop',
    'Animator:resume',
    'Animator:isPlaying',
    'Animator:getAnimationNames'
  }
}
