return {
  summary = 'Get the first child of a node.',
  description = [[
    Given a parent node, this function returns the index of its first child, or `nil` if it doesn't
    have any children.

    This, together with `ModelData:getNodeSibling`, can be used to iterate the tree of nodes in a
    model.
  ]],
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of the parent node.'
    }
  },
  returns = {
    child = {
      type = 'number | nil',
      description = [[
        The index of the node's first child, or `nil` if the node doesn't have any children.
      ]]
    }
  },
  variants = {
    {
      arguments = { 'node' },
      returns = { 'child' }
    }
  },
  related = {
    'ModelData:getNodeSibling',
    'ModelData:getNodeParent',
    'ModelData:getRootNode',
    'Model:getNodeChild'
  }
}
