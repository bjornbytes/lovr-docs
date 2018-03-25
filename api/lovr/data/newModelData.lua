return {
  summary = 'Create a new ModelData.',
  description = 'Creates a new ModelData from a 3D model file.',
  arguments = {
    filename = {
      type = 'string',
      description = 'The filename of the model to load.'
    },
    blob = {
      type = 'Blob',
      description = 'The Blob containing model to decode.'
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
      arguments = { 'string' },
      returns = { 'modelData' }
    },
    {
      arguments = { 'blob' },
      returns = { 'modelData' }
    }
  }
}
