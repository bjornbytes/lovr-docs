return {
  summary = 'Apply an animation to the pose of the Model.',
  description = 'TODO',
  arguments = {
    name = {
      type = 'string',
      description = 'The name of an animation.'
    },
    index = {
      type = 'number',
      description = 'The index of an animation.'
    },
    time = {
      type = 'number',
      description = 'The timestamp to evaluate the keyframes at, in seconds.'
    },
    alpha = {
      type = 'number',
      default = '1',
      description = 'How much of the animation to mix in, from 0 to 1.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'name', 'time', 'alpha' },
      returns = {}
    },
    {
      arguments = { 'index', 'time', 'alpha' },
      returns = {}
    }
  },
  related = {
    'Model:resetPose',
    'Model:getNodePose',
    'Model:setNodePose',
    'Model:getAnimationCount',
    'Model:getAnimationName',
    'Model:getAnimationDuration'
  }
}
