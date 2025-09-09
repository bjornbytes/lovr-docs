return {
  summary = 'Get the parent of a node.',
  description = 'Given a child node, this function returns the index of its parent.',
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of the child node.'
    }
  },
  returns = {
    parent = {
      type = 'number',
      description = 'The index of the parent node.'
    }
  },
  variants = {
    {
      arguments = { 'node' },
      returns = { 'parent' }
    }
  },
  related = {
    'ModelData:getNodeChildren',
    'ModelData:getRootNode',
    'Model:getNodeParent'
  }
}
