return {
  summary = 'Get the type of the Shader.',
  description = 'TODO',
  arguments = {},
  returns = {
    type = {
      type = 'ShaderType',
      description = 'The type of the Shader.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'type' }
    }
  },
  related = {
    'Shader:hasStage'
  }
}
