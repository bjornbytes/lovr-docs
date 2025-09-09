return {
  summary = 'Get the index of the skin used by a node.',
  description = [[
    Returns the index of the skin used by a node.  Skins are collections of joints used for skeletal
    animation.  A model can have multiple skins, and each node can use at most one skin to drive the
    animation of its meshes.
  ]],
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    }
  },
  returns = {
    skin = {
      type = 'number',
      description = 'The index of the node\'s skin, or nil if the node isn\'t skeletally animated.'
    }
  },
  variants = {
    {
      arguments = { 'node' },
      returns = { 'skin' }
    }
  },
  related = {
    'ModelData:getSkinCount'
  }
}
