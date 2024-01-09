return {
  summary = 'Get a Material from the Model.',
  description = 'Returns a `Material` loaded from the Model.',
  arguments = {
    name = {
      type = 'string',
      description = 'The name of the Material to return.'
    },
    index = {
      type = 'number',
      description = 'The index of the Material to return.'
    }
  },
  returns = {
    material = {
      type = 'Material',
      description = 'The material.'
    }
  },
  variants = {
    {
      arguments = { 'name' },
      returns = { 'material' }
    },
    {
      arguments = { 'index' },
      returns = { 'material' }
    }
  },
  related = {
    'Model:getMaterialCount',
    'Model:getMaterialName'
  }
}
