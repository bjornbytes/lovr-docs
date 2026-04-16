return {
  summary = 'Get the index of the root node.',
  description = 'Returns the index of the Model\'s root node.',
  arguments = {},
  returns = {
    root = {
      type = 'number',
      description = 'The index of the root node.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'root' }
    }
  },
  related = {
    'Model:getNodeCount',
    'Model:getNodeParent',
    'Model:getNodeChild',
    'ModelData:getRootNode'
  }
}
