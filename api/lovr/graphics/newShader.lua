return {
  tag = 'graphics-objects',
  summary = 'Create a Shader.',
  description = 'TODO',
  arguments = {
    vertex = {
      type = 'ShaderSource',
      description = 'TODO'
    },
    fragment = {
      type = 'ShaderSource',
      description = 'TODO'
    },
    compute = {
      type = 'ShaderSource',
      description = 'TODO'
    },
    options = {
      type = 'table',
      description = 'Shader options.',
      table = {
        {
          name = 'flags',
          type = 'table',
          description = 'TODO'
        },
        {
          name = 'label',
          type = 'string',
          description = 'TODO'
        }
      }
    }
  },
  returns = {
    shader = {
      type = 'Shader',
      description = 'TODO'
    }
  },
  variants = {
    {
      description = 'Create a graphics shader.',
      arguments = { 'vertex', 'fragment', 'options' },
      returns = { 'shader' }
    },
    {
      description = 'Create a compute shader.',
      arguments = { 'compute', 'options' },
      returns = { 'shader' }
    }
  },
  related = {
    'lovr.graphics.compileShader'
  }
}
