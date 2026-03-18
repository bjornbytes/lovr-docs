return {
  summary = 'Check if the AudioMesh is enabled.',
  description = [[
    Returns whether the AudioMesh is enabled.  Disabled audio meshes do not affect audio processing.
  ]],
  arguments = {},
  returns = {
    enabled = {
      type = 'boolean',
      description = 'Whether the AudioMesh is enabled.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'enabled' }
    }
  }
}
