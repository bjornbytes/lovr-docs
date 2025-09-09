return {
  summary = 'Get a keyframe in a channel of an animation.',
  description = 'Returns a single keyframe in a channel of an animation.',
  arguments = {
    animation = {
      type = 'number',
      description = 'The name or index of an animation.'
    },
    channel = {
      type = 'number',
      description = 'The index of a channel in the animation.'
    },
    keyframe = {
      type = 'number',
      description = 'The index of a keyframe in the channel.'
    }
  },
  returns = {
    time = {
      type = 'number',
      description = 'The timestamp of the keyframe.'
    },
    ['...'] = {
      type = 'number',
      description = 'The data for the keyframe (3 or more numbers, depending on the property).'
    }
  },
  variants = {
    {
      arguments = { 'animation', 'channel', 'keyframe' },
      returns = { 'time', '...' }
    }
  },
  notes = [[
    The number of values returned after `time` depends on the `AnimationProperty` targeted by the
    channel:

    - `translation`: 3 numbers
    - `rotation`: 4 numbers (returned as raw quaternion components)
    - `scale`: 3 numbers
    - `weights`: variable, contains 1 number for each blend shape in the node
  ]],
  related = {
    'ModelData:getAnimationSmoothMode',
    'ModelData:getAnimationKeyframeCount'
  }
}
