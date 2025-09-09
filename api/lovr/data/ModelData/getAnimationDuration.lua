return {
  summary = 'Get the duration of an animation.',
  description = 'Returns the duration of an animation.',
  arguments = {
    animation = {
      type = 'string | number',
      description = 'The name or index of an animation.'
    }
  },
  returns = {
    duration = {
      type = 'number',
      description = 'The duration of the animation, in seconds.'
    }
  },
  variants = {
    {
      arguments = { 'animation' },
      returns = { 'duration' }
    }
  },
  notes = [[
    The duration of the animation is calculated as the latest timestamp of all of its channels.
  ]],
  related = {
    'Model:getAnimationDuration'
  }
}
