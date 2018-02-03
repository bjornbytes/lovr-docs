return {
  summary = 'Get the alpha (weight) of an animation.',
  description = 'Returns the current alpha factor of an animation.',
  arguments = {
    {
      name = 'name',
      type = 'string',
      description = 'The name of the animation.'
    }
  },
  returns = {
    {
      name = 'alpha',
      type = 'number',
      description = 'The alpha of the animation.'
    }
  },
  notes = [[
    The alpha is a number between 0 and 1 indicating how the animation's pose is blended with other
    animations.  An alpha of 1 means the animation's pose will completely overwrite the existing
    pose, whereas an alpha of .5 would blend half of the animation's pose with half of the existing
    pose.  This, combined with the animation's priority, allows for fine grained control over how
    multiple playing animations get blended together.
  ]],
  related = {
    'Animator:getPriority',
    'Animator:setPriority'
  }
}
