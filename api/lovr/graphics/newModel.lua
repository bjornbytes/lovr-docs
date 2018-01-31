return {
  tag = 'graphicsObjects',
  summary = 'Create a new Model.',
  description = [[
    Creates a new Model from a file.  Most common 3D file formats are supported, such as `3ds`,
    `blend`, `dae`, `fbx`, `stl`, `obj`, and `glTF`.  Models use normals and texture coordinates,
    if provided.

    The following features are not supported yet: animations, materials, vertex colors.
  ]],
  arguments = {
    {
      name = 'filename',
      type = 'string',
      description = 'The filename of the model to load.'
    },
    {
      name = 'texture',
      type = 'string',
      default = 'nil',
      description = 'A filename for a texture to apply to the Model, or `nil` for no texture.'
    }
  },
  returns = {
    {
      name = 'model',
      type = 'Model',
      description = 'The new Model.'
    }
  }
}
