return {
  summary = 'Get the speed of an animation.',
  description = 'Returns the speed factor for an animation or the Animator\'s global speed factor.',
  arguments = {
    name = {
      type = 'string',
      description = 'The name of the animation.'
    }
  },
  returns = {
    speed = {
      type = 'number',
      description = 'The current speed multiplier.'
    }
  },
  variants = {
    {
      description = 'Get the speed of a specific animation.',
      arguments = { 'name' },
      returns = { 'speed' }
    },
    {
      description = 'Get the global speed multiplier for the Animator.',
      arguments = {},
      returns = { 'speed' }
    }
  }
}
