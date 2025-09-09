return {
  summary = 'Get the property targeted by a channel of an animation.',
  description = 'Returns the property targeted by an animation\'s channel.',
  arguments = {
    animation = {
      type = 'string | number',
      description = 'The name or index of an animation.'
    },
    channel = {
      type = 'number',
      description = 'The index of a channel in the animation.'
    }
  },
  returns = {
    property = {
      type = 'AnimationProperty',
      description = [[
        The property (translation, rotation, scale, or weights) affected by the keyframes.
      ]]
    }
  },
  variants = {
    {
      arguments = { 'animation', 'channel' },
      returns = { 'property' }
    }
  },
  related = {
    'ModelData:getAnimationNode',
    'ModelData:getAnimationSmoothMode'
  }
}
