return {
  summary = 'Get a subcomponent of a node.',
  description = [[
    Returns a subcomponent of a node of the ModelData.

    Each node is composed of several pieces of geometry.  These are called the components of a node.
    A component is a range of vertices and a material.  To render a node, the appropriate material
    is applied and the component's range of vertices is rendered with that material.
  ]],
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the node to get the number of components of (1-indexed).'
    },
    {
      name = 'subcomponent',
      type = 'number',
      description = 'The index of the subcomponent to retrieve.'
    }
  },
  returns = {
    {
      name = 'start',
      type = 'number',
      description = 'The index of the first vertex in the subcomponent.'
    },
    {
      name = 'count',
      type = 'number',
      description = 'The number of vertices in the subcomponent.'
    },
    {
      name = 'material',
      type = 'number',
      description = 'The index of the subcomponent\'s material.'
    }
  },
  notes = 'An error will be thrown if an invalid node index or subcomponent index is supplied.',
  related = {
    'ModelData:getNodeComponentCount'
  }
}
