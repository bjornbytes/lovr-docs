return {
  summary = 'Get the number of subcomponents that comprise a node.',
  description = [[
    Returns the number of subcomponents of a node in the ModelData.

    Each node is composed of several pieces of geometry.  These are called the components of a node.
    A component is a range of vertices and a material.  To render a node, the appropriate material
    is applied and the component's range of vertices is rendered with that material.
  ]],
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the node to get the number of components of (1-indexed).'
    }
  },
  returns = {
    {
      name = 'count',
      type = 'number',
      description = 'The number of components of the node.'
    }
  },
  notes = 'An error will be thrown if an invalid node index is supplied.',
  related = {
    'ModelData:getNodeComponent'
  }
}
