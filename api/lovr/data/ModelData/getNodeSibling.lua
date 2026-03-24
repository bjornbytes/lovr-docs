return {
  summary = 'Get the next sibling of a node.',
  description = [[
    Returns the next sibling of a node (a node with the same parent), or `nil` if the node doesn't
    have a sibling.

    This, together with `ModelData:getNodeChild`, can be used to iterate the tree of nodes in a
    model.
  ]],
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    }
  },
  returns = {
    sibling = {
      type = 'number | nil',
      description = [[
        The index of the node's next sibling, or `nil` if the node doesn't have a sibling.
      ]]
    }
  },
  variants = {
    {
      arguments = { 'node' },
      returns = { 'sibling' }
    }
  },
  related = {
    'ModelData:getNodeChild',
    'ModelData:getNodeParent',
    'ModelData:getRootNode',
    'Model:getNodeSibling'
  }
}
