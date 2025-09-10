return {
  tag = 'shaders',
  summary = 'Set the active Shader.',
  description = [[
    Sets the active shader.  The Shader will affect all drawing operations until it is changed
    again.
  ]],
  arguments = {
    shader = {
      type = 'Shader | DefaultShader',
      description = 'The shader to use.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'shader' },
      returns = {}
    },
    {
      description = 'Switch back to using an automatic shader for drawing.',
      arguments = {},
      returns = {}
    }
  },
  notes = [[
    Changing the shader will preserve variable values (the ones set using `Pass:send`) **unless**
    the new shader declares a variable with the same as one in the old shader, but a different type.
    The variable "type" means one of the following:

    - Uniform buffer (`uniform`).
    - Storage buffer (`buffer`).
    - Sampled texture, (`uniform texture<type>`).
    - Storage texture, (`uniform image<type>`).
    - Sampler (`uniform sampler`).

    If there's a clash in types, the variable will be reset to use a default resource:

    - Buffer variables do not have well-defined behavior when they are reset like this, and may
      return random data or even crash the GPU.
    - Texture variable will use a default texture with a single white pixel.
    - Sampler variables will use a default sampler with a `linear` filter mode and `repeat` wrap
      mode.

    Uniform variables with basic types like `float`, `vec3`, `mat4`, etc. will have their data
    preserved as long as both shaders declare the variable with the same name and type.
  ]],
  related = {
    'Pass:send',
    'Pass:compute'
  }
}
