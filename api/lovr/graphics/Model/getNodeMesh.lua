return {
  summary = 'Get the index of the mesh attached to a node.',
  description = [[
    Returns the index of the mesh attached to a node.  Meshes contain the geometry and material
    information, whereas the nodes define the hierarchy and transforms.  A single mesh can be
    attached to multiple nodes.  Not every node has a mesh.
  ]],
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    }
  },
  returns = {
    mesh = {
      type = 'number | nil',
      description = 'The index of the node\'s mesh, or `nil` if the node does not have a mesh.'
    }
  },
  variants = {
    {
      arguments = { 'node' },
      returns = { 'mesh' }
    }
  },
  related = {
    'ModelData:getNodeMesh'
  }
}
