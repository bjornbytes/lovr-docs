return {
  summary = 'Get the name of an animation in the Model.',
  description = 'Returns the name of an animation in the Model.',
  arguments = {
    index = {
      type = 'number',
      description = 'The index of an animation.'
    }
  },
  returns = {
    name = {
      type = 'string | nil',
      description = 'The name of the animation, or `nil` if the animation doesn\'t have a name.'
    }
  },
  variants = {
    {
      arguments = { 'index' },
      returns = { 'name' }
    }
  },
  related = {
    'Model:getAnimationCount',
    'Model:getAnimationDuration'
  }
}
