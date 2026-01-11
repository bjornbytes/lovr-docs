return {
  summary = 'Set the visibility of a node.',
  description = [[
    Set the visibility of a node.  Invisible nodes don't render their mesh, or any of their
    children.
  ]],
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    },
    visible = {
      type = 'boolean',
      description = 'Whether the node should be visible.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'node', 'visible' },
      returns = {}
    }
  }
}
