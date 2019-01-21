return {
  tag = 'graphicsObjects',
  summary = 'Create a new Model.',
  description = [[
    Creates a new Model from a file.  The supported 3D file formats are OBJ and glTF.

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
    },
    modelData = {
      type = 'ModelData',
      description = 'The ModelData holding the data for the Model.'
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
    },
    {
      arguments = { 'modelData', 'texture' },
      returns = { 'model' }
    },
    {
      arguments = { 'modelData', 'material' },
      returns = { 'model' }
    }
  },
  notes = [[
    Diffuse and emissive textures will be loaded in the sRGB encoding, all other textures will be
    loaded as linear.
  ]]
}
