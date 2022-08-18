return {
  summary = 'Get the name of an animation.',
  description = 'Returns the name of an animation.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the animation.'
    }
  },
  returns = {
    {
      name = 'name',
      type = 'string',
      description = 'The name of the animation.'
    }
  },
  notes = 'If the animation does not have a name, this function returns `nil`.',
  related = {
    'Model:getAnimationName'
  }
}
