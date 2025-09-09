return {
  summary = 'Get the smooth mode of a channel in an animation.',
  description = 'Returns the smooth mode of a channel in an animation.',
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
    smooth = {
      type = 'SmoothMode',
      description = 'The smooth mode of the keyframes.'
    }
  },
  variants = {
    {
      arguments = { 'animation', 'channel' },
      returns = { 'smooth' }
    }
  },
  related = {
    'ModelData:getAnimationNode',
    'ModelData:getAnimationProperty'
  }
}
