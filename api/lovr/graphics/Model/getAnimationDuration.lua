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
      arguments = { 'index' },
      returns = { 'duration' }
    },
    {
      arguments = { 'name' },
      returns = { 'duration' }
    }
  },
  notes = [[
    TODO how is duration calculated?
  ]],
  related = {
    'Model:getAnimationCount',
    'Model:getAnimationName',
    'Model:animate'
  }
}
