return {
  summary = 'Get the name of an animation.',
  description = 'Returns the name of an animation.',
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
    'Model:getAnimationName'
  }
}
