return {
  summary = 'Get the children of a node.',
  description = [[
    Given a parent node, this function returns a table with the indices of its children.
  ]],
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of the parent node.'
    }
  },
  returns = {
    children = {
      type = '{number}',
      description = 'A table containing the node index of each child of the parent node.'
    }
  },
  variants = {
    {
      arguments = { 'node' },
      returns = { 'children' }
    }
  },
  notes = 'If the node does not have any children, this function returns an empty table.',
  related = {
    'Model:getNodeParent',
    'Model:getRootNode'
  }
}
