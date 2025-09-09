return {
  summary = 'Get the number of keyframes in a channel of an animation.',
  description = 'Returns the number of keyframes in a channel of an animation.',
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
    count = {
      type = 'number',
      description = 'The number of keyframes in the channel.'
    }
  },
  variants = {
    {
      arguments = { 'animation', 'channel' },
      returns = { 'count' }
    }
  },
  related = {
    'ModelData:getAnimationSmoothMode',
    'ModelData:getAnimationKeyframe'
  }
}
