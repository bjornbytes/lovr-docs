return {
  tag = 'graphicsObjects',
  summary = 'Create a new compute Shader.',
  description = [[
    Creates a new compute Shader, used for running generic compute operations on the GPU.
  ]],
  arguments = {
    {
      name = 'source',
      type = 'string',
      description = 'The code or filename of the compute shader.'
    }
  },
  returns = {
    {
      name = 'shader',
      type = 'Shader',
      description = 'The new compute Shader.'
    }
  },
  notes = [[
    Compute shaders are not supported on all hardware, use `lovr.graphics.getSupported` to check
    if they're available on the current system.

    The source code for a compute shader needs to implement the `void compute();` GLSL function.
    This function doesn't return anything, but the compute shader is able to write data out to
    `Texture`s or `ShaderBlock`s.

    The GLSL version used for compute shaders is GLSL 430.
  ]],
  related = {
    'lovr.graphics.compute',
    'lovr.graphics.newShader',
    'lovr.graphics.setShader',
    'lovr.graphics.getShader'
  }
}
