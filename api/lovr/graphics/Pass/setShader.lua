return {
  tag = 'pipeline',
  summary = 'Set the active Shader.',
  description = 'TODO',
  arguments = {
    shader = {
      type = 'Shader',
      description = 'A custom Shader object to use for rendering.'
    },
    default = {
      type = 'DefaultShader',
      description = 'One of the default shaders to use.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'shader' },
      returns = {}
    },
    {
      description = 'Use one of the default shaders for drawing.',
      arguments = { 'default' },
      returns = {}
    },
    {
      description = 'Switch back to using an automatic shader for drawing.',
      arguments = {},
      returns = {}
    }
  }
}
