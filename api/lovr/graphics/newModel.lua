return {
  tag = 'graphics-objects',
  summary = 'Create a new Model.',
  description = [[
    Loads a 3D model from a file.  Currently, OBJ, glTF, and binary STL files are supported.
  ]],
  arguments = {
    filename = {
      type = 'string',
      description = 'The path to model file.'
    },
    blob = {
      type = 'Blob',
      description = 'A Blob containing 3D model data.'
    },
    modelData = {
      type = 'ModelData',
      description = 'An existing ModelData object to use for the Model.'
    },
    options = {
      type = 'table',
      description = 'Model options.',
      table = {
        {
          name = 'mipmaps',
          type = 'boolean',
          default = 'true',
          description = 'Whether the textures created for the Model should have mipmaps generated.'
        }
      }
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
      arguments = { 'filename', 'options' },
      returns = { 'model' }
    },
    {
      arguments = { 'blob', 'options' },
      returns = { 'model' }
    },
    {
      arguments = { 'modelData', 'options' },
      returns = { 'model' }
    }
  },
  related = {
    'lovr.data.newModelData',
    'Pass:draw'
  }
}
