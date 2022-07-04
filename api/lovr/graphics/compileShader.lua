return {
  summary = 'Compile a Shader.',
  description = 'TODO',
  arguments = {
    stage = {
      type = 'ShaderStage',
      description = 'TODO'
    },
    string = {
      type = 'ShaderSource',
      description = 'TODO'
    }
  },
  returns = {
    bytecode = {
      type = 'Blob',
      description = 'TODO'
    }
  },
  variants = {
    {
      arguments = { 'stage', 'source' },
      returns = { 'bytecode' }
    }
  },
  related = {
    'lovr.graphics.newShader'
  }
}
