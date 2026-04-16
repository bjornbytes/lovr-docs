return {
  summary = 'Get the index of the material used by a mesh part.',
  description = [[
    Returns the index of the material used by a mesh part.  Meshes can be split into multiple parts,
    and each part can have its own material.
  ]],
  arguments = {
    mesh = {
      type = 'number',
      description = 'The index of a mesh.'
    },
    part = {
      type = 'number',
      default = '1',
      description = 'The index of a part.'
    }
  },
  returns = {
    material = {
      type = 'number | nil',
      description = [[
        The index of the material applied to the part, or nil if the part does not have a material.
      ]]
    }
  },
  variants = {
    {
      arguments = { 'mesh', 'part' },
      returns = { 'material' }
    }
  },
  related = {
    'ModelData:getMeshMaterial'
  }
}
