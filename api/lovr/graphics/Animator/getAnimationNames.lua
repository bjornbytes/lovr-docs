return {
  summary = 'Get the a table containing all animation names.',
  description = [[
    Returns a table containing the names of all animations supported by this Animator.
  ]],
  arguments = {
    t = {
      type = 'table',
      description = 'A table to fill with the animation names.'
    }
  },
  returns = {
    names = {
      type = 'table',
      description = 'The list of animation names as strings.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'names' }
    },
    {
      arguments = { 't' },
      returns = {}
    }
  },
  related = {
    'Animator:getAnimationCount'
  }
}
