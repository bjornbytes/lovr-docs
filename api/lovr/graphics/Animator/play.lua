return {
  summary = 'Start playing an animation.',
  description = [[
    Plays an animation.  If the animation is already playing, it will start over at the beginning.
  ]],
  arguments = {
    {
      name = 'name',
      type = 'string',
      description = 'The name of the animation to play.'
    }
  },
  returns = {},
  related = {
    'Animator:stop',
    'Animator:pause',
    'Animator:resume',
    'Animator:isPlaying',
    'Animator:getAnimationNames'
  }
}
