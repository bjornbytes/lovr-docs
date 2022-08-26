return {
  summary = 'TODO',
  description = 'TODO',
  arguments = {
    index = {
      type = 'number',
      description = 'The index of a node.'
    },
    name = {
      type = 'string',
      description = 'The name of a node.'
    }
  },
  returns = {
    count = {
      type = 'number',
      description = 'The number of draws in the node.'
    }
  },
  variants = {
    {
      arguments = { 'index' },
      returns = { 'count' }
    },
    {
      arguments = { 'name' },
      returns = { 'count' }
    }
  },
  related = {
    'ModelData:getNodeMeshCount',
    'Model:getNodeDraw'
  }
}
