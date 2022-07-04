return {
  summary = 'Get the name of a material in the Model.',
  description = 'TODO',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'TODO'
    }
  },
  returns = {
    {
      name = 'name',
      type = 'string',
      description = 'The name of the material.'
    }
  },
  related = {
    'Model:getMaterialCount',
    'Model:getAnimationName',
    'Model:getNodeName'
  }
}
