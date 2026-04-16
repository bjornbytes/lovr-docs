return {
  summary = 'Get the number of parts in a mesh.',
  description = [[
    Returns the number of parts in a mesh.  Meshes can be split into multiple "parts".  Each part
    refers to a subset of the mesh's vertices, and parts can have their own draw mode and material.
  ]],
  arguments = {
    mesh = {
      type = 'number',
      description = 'The index of the mesh.'
    }
  },
  returns = {
    parts = {
      type = 'number',
      description = 'The number of parts in the mesh.'
    }
  },
  variants = {
    {
      arguments = { 'mesh' },
      returns = { 'parts' }
    }
  },
  related = {
    'Model:getMeshDrawRange',
    'Model:getMeshDrawMode',
    'Model:getMeshMaterial',
    'Pass:drawPart',
    'ModelData:getMeshPartCount'
  }
}
