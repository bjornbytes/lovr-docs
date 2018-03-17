return {
  tag = 'graphicsObjects',
  summary = 'Create a new Model.',
  description = [[
    Creates a new Model from a file.  The supported 3D file formats are `obj`, `fbx`, `gltf`, and
    collada.  Models use normals and texture coordinates, if provided.

    The following features are not supported yet: animations, materials, vertex colors.
  ]],
  arguments = {
    filename = {
      type = 'string',
      description = 'The filename of the model to load.'
    },
    texture = {
      type = 'string',
      default = 'nil',
      description = 'The filename of the texture to apply to the model.'
    },
    material = {
      type = 'Material',
      default = 'nil',
      description = [[
        The material to apply to the model.  If nil, the materials will be loaded from
        the model file.
      ]]
    }
  },
  returns = {
    model = {
      type = 'Model',
      description = 'The new Model.'
    }
  },
  variants = {
    {
      arguments = { 'filename', 'texture' },
      returns = { 'model' }
    },
    {
      arguments = { 'filename', 'material' },
      returns = { 'model' }
    }
  },
  notes = [[
    Models loaded from glTF files do not currently import animations properly.
  ]]
}
