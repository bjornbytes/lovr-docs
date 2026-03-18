return {
  summary = 'Enable or disable the AudioMesh.',
  description = [[
    Enable or disable the AudioMesh.  Disabled audio meshes do not affect audio processing.
  ]],
  arguments = {
    enabled = {
      type = 'boolean',
      description = 'Whether the AudioMesh should be enabled.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'enabled' },
      returns = {}
    }
  }
}
