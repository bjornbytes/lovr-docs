return {
  tag = 'sourceEffects',
  summary = 'Check if the Source is spatial.',
  description = [[
    Returns whether the Source was created with the `spatial` flag.  Non-spatial sources are routed
    directly to the speakers without any spatial effects.
  ]],
  arguments = {},
  returns = {
    spatial = {
      type = 'boolean',
      description = 'Whether the source is spatial.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'spatial' }
    }
  }
}
