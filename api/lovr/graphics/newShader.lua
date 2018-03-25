return {
  tag = 'graphicsObjects',
  summary = 'Create a new Shader.',
  description = 'Creates a new Shader.',
  arguments = {
    {
      name = 'vertex',
      type = 'string',
      description = [[
        The code or filename of the vertex shader.  If nil, the default vertex shader is used.
      ]]
    },
    {
      name = 'fragment',
      type = 'string',
      description = [[
        The code or filename of the fragment shader.  If nil, the default fragment shader is used.
      ]]
    }
  },
  returns = {
    {
      name = 'shader',
      type = 'Shader',
      description = 'The new Shader.'
    }
  }
}
