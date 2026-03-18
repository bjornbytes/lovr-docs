return {
  summary = 'Create a lightweight copy of the AudioMesh.',
  description = [[
    Creates a lightweight copy of the AudioMesh.  The clone reuses the mesh data from the parent,
    but it can be transformed independently.
  ]],
  arguments = {},
  returns = {
    clone = {
      type = 'AudioMesh',
      description = 'A copy of the parent AudioMesh.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'clone' }
    }
  },
  related = {
    'lovr.audio.newAudioMesh'
  }
}
