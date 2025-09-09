return {
  summary = 'Create a new ModelData.',
  description = 'Loads a 3D model from a file.  The supported 3D file formats are OBJ and glTF.',
  arguments = {
    file = {
      type = 'string | Blob',
      description = 'A filename or Blob containing the model data to import.'
    }
  },
  returns = {
    modelData = {
      type = 'ModelData',
      description = 'The new ModelData.'
    }
  },
  variants = {
    {
      arguments = { 'file' },
      returns = { 'modelData' }
    }
  }
}
