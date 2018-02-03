return {
  summary = 'Resume a paused animation.',
  description = [[
    Resumes an animation. This will play an animation without starting it over at the beginning.
  ]],
  arguments = {
    {
      name = 'name',
      type = 'string',
      description = 'The animation to resume.'
    }
  },
  returns = {},
  related = {
    'Animator:pause',
    'Animator:play',
    'Animator:stop',
    'Animator:isPlaying',
    'Animator:getAnimationNames'
  }
}
