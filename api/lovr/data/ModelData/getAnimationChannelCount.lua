return {
  summary = 'Get the number of channels in an animation.',
  description = [[
    Returns the number of channels in an animation.

    A channel is a set of keyframes targeting a single property of a node.
  ]],
  arguments = {
    animation = {
      type = 'number | string',
      description = 'The name or index of an animation.'
    }
  },
  returns = {
    count = {
      type = 'number',
      description = 'The number of channels in the animation.'
    }
  },
  variants = {
    {
      arguments = { 'animation' },
      returns = { 'count' }
    }
  },
  related = {
    'ModelData:getAnimationNode',
    'ModelData:getAnimationProperty'
  }
}
