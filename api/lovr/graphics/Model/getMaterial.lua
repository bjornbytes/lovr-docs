return {
  summary = 'Get a Material from the Model.',
  description = 'Returns a `Material` loaded from the Model.',
  arguments = {
    which = {
      type = 'string | number',
      description = 'The name or index of the Material to return.'
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
      arguments = { 'which' },
      returns = { 'material' }
    }
  },
  related = {
    'Model:getMaterialCount',
    'Model:getMaterialName'
  }
}
