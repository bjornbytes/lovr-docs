return {
  tag = 'graphics-objects',
  summary = 'Compile shader code to bytecode.',
  description = [[
    Compiles shader code to SPIR-V bytecode.  The bytecode can be passed to
    `lovr.graphics.newShader` to create shaders, which will be faster than creating it from GLSL.
    The bytecode is portable, so bytecode compiled on one platform will work on other platforms.
    This allows shaders to be precompiled in a build step.
  ]],
  arguments = {
    stage = {
      type = 'ShaderStage',
      description = 'The type of shader to compile.'
    },
    source = {
      type = 'string | Blob',
      description = 'A string, filename, or Blob with shader code.'
    }
  },
  returns = {
    bytecode = {
      type = 'Blob',
      description = 'A Blob containing compiled SPIR-V code.'
    }
  },
  variants = {
    {
      arguments = { 'stage', 'source' },
      returns = { 'bytecode' }
    }
  },
  notes = [[
    The input can be GLSL or SPIR-V.  If it's SPIR-V, it will be returned unchanged as a Blob.

    If the shader fails to compile, an error will be thrown with the error message.
  ]],
  related = {
    'lovr.graphics.newShader',
    'Shader'
  }
}
