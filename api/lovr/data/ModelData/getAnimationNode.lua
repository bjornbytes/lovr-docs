return {
  summary = 'Get the node targeted by the channel of an animation.',
  description = 'Returns the index of the node targeted by an animation\'s channel.',
  arguments = {
    animation = {
      type = 'number',
      description = 'The index or name of an animation.'
    },
    channel = {
      type = 'number',
      description = 'The index of a channel in the animation.'
    }
  },
  returns = {
    node = {
      type = 'number',
      description = 'The index of the node targeted by the channel.'
    }
  },
  variants = {
    {
      arguments = { 'animation', 'channel' },
      returns = { 'node' }
    }
  },
  related = {
    'ModelData:getAnimationProperty',
    'ModelData:getAnimationSmoothMode'
  }
}
