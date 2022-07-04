return {
  summary = 'Get the duration of an animation in the Model.',
  description = 'TODO',
  arguments = {
    name = {
      type = 'string',
      description = 'The name of the animation.'
    },
    index = {
      type = 'number',
      description = 'The animation index.'
    }
  },
  returns = {
    duration = {
      type = 'number',
      description = 'TODO'
    }
  },
  variants = {
    {
      arguments = { 'name' },
      returns = { 'duration' }
    },
    {
      arguments = { 'index' },
      returns = { 'duration' }
    }
  },
  related = {
    'Model:getAnimationCount',
    'Model:getAnimationName',
    'Model:animate'
  }
}
