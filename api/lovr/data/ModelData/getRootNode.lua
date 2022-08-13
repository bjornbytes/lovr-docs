return {
  summary = 'Get the index of the root node.',
  description = 'Returns the index of the model\'s root node.',
  arguments = {},
  returns = {
    {
      name = 'root',
      type = 'number',
      description = 'The index of the root node.'
    }
  },
  related = {
    'ModelData:getNodeCount',
    'ModelData:getNodeParent'
  }
}
