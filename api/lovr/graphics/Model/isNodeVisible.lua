return {
  summary = 'Check if a node is visible.',
  description = [[
    Returns whether a node is visible.  Invisible nodes don't render their mesh, or any of their
    children.
  ]],
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    }
  },
  returns = {
    visible = {
      type = 'boolean',
      description = 'Whether the node is visible.'
    }
  },
  variants = {
    {
      arguments = { 'node' },
      returns = { 'visible' }
    }
  }
}
