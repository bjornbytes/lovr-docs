return {
  summary = 'Set the speed of an animation.',
  description = 'Sets the speed factor for an animation or the Animator\'s global speed factor.',
  arguments = {
    name = {
      type = 'string',
      description = 'The name of the animation.'
    },
    speed = {
      type = 'number',
      description = 'The new speed multiplier.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Set the speed of a specific animation.',
      arguments = { 'name', 'speed' },
      returns = {}
    },
    {
      description = 'Set the global speed multiplier for the Animator.',
      arguments = { 'speed' },
      returns = {}
    }
  }
}
