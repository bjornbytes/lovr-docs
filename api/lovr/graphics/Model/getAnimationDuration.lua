return {
  summary = 'Get the duration of an animation in the Model.',
  description = 'Returns the duration of an animation in the Model, in seconds.',
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
    The duration of an animation is calculated as the largest timestamp of all of its keyframes.
  ]],
  related = {
    'Model:getAnimationCount',
    'Model:getAnimationName',
    'Model:animate'
  }
}
