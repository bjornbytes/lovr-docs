return {
  summary = 'Check if the Shader has a given stage.',
  description = 'Returns whether the Shader has a given stage.',
  arguments = {
    {
      name = 'stage',
      type = 'ShaderStage',
      description = 'The stage.'
    }
  },
  returns = {
    {
      name = 'exists',
      type = 'boolean',
      description = 'Whether the Shader has the stage.'
    }
  },
  related = {
    'Shader:getType'
  }
}
