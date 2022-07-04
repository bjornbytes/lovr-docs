return {
  summary = 'Create a new Model.',
  description = 'TODO',
  arguments = {
    filename = {
      type = 'string',
      description = 'TODO'
    },
    blob = {
      type = 'Blob',
      description = 'TODO'
    },
    modelData = {
      type = 'ModelData',
      description = 'TODO'
    },
    options = {
      type = 'table',
      description = 'Model options.',
      table = {
        {
          name = 'mipmaps',
          type = 'boolean',
          description = 'TODO'
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
      arguments = { 'modelData' },
      returns = { 'model' }
    }
  },
  related = {
    'lovr.data.newModelData',
    'Pass:draw'
  }
}
