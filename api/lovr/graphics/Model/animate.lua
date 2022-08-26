return {
  summary = 'Apply an animation to the nodes of the Model.',
  description = 'TODO',
  arguments = {
    name = {
      type = 'string',
      description = 'The name of an animation in the model file.'
    },
    index = {
      type = 'number',
      description = 'The index of an animation in the model file.'
    },
    time = {
      type = 'number',
      description = 'The timestamp to evaluate the keyframes at, in seconds.'
    },
    blend = {
      type = 'number',
      default = '1.0',
      description = 'How much of the animation\'s pose to blend into the nodes, from 0 to 1.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'name', 'time', 'blend' },
      returns = {}
    },
    {
      arguments = { 'index', 'time', 'blend' },
      returns = {}
    }
  },
  notes = [[
    TODO What happens if the timestamp is before the first keyframe?
    TODO Does it loop?
  ]],
  related = {
    'Model:getAnimationCount',
    'Model:getAnimationName',
    'Model:getAnimationDuration',
    'Model:getNodePosition',
    'Model:setNodePosition',
    'Model:getNodeOrientation',
    'Model:setNodeOrientation',
    'Model:getNodeScale',
    'Model:setNodeScale',
    'Model:getNodeTransform',
    'Model:setNodeTransform'
  }
}
