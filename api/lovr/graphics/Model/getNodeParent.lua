return {
  summary = 'Get the parent of a node.',
  description = 'Given a child node, this function returns the index of its parent.',
  arguments = {
    node = {
      type = 'number',
      description = 'The name or index of the child node.'
    }
  },
  returns = {
    parent = {
      type = 'number',
      description = 'The index of the parent.'
    }
  },
  variants = {
    {
      arguments = { 'node' },
      returns = { 'parent' }
    }
  },
  related = {
    'Model:getNodeChildren',
    'Model:getRootNode'
  }
}
