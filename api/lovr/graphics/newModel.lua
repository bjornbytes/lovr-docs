return {
  tag = 'graphicsObjects',
  summary = 'Create a new Model.',
  description = [[
    Creates a new Model from a file.  The supported 3D file formats are `obj`, `fbx`, `gltf`, and
    collada.  Models use normals and texture coordinates, if provided.

    The following features are not supported yet: animations, materials, vertex colors.
  ]],
  arguments = {
    {
      name = 'filename',
      type = 'string',
      description = 'The filename of the model to load.'
    }
  },
  returns = {
    {
      name = 'model',
      type = 'Model',
      description = 'The new Model.'
    }
  },
  notes = [[
    Models loaded from glTF files do not currently import animations properly.
  ]]
}
