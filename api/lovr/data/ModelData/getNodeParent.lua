return {
  summary = 'Get the parent of a node.',
  description = 'Returns the parent of a node in the ModelData.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the node to get the parent of (1-indexed).'
    }
  },
  returns = {
    {
      name = 'parent',
      type = 'number',
      description = 'The index of the node\'s parent, or nil if the node is the root node.'
    }
  },
  notes = 'An error will be thrown if an invalid node index is supplied.',
  related = {
    'ModelData:getNodeChildren'
  }
}
