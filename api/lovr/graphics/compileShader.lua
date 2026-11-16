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
    vertex = {
      type = 'string | Blob',
      description = 'A string, filename, or Blob containing code for the vertex stage.'
    },
    fragment = {
      type = 'string | Blob',
      description = 'A string, filename, or Blob containing code for the fragment stage.'
    },
    compute = {
      type = 'string | Blob',
      description = 'A string, filename, or Blob containing code for the compute stage.'
    }
  },
  returns = {
    ['...blobs'] = {
      type = 'Blob',
      description = 'Blobs containing compiled SPIR-V code, one for each input stage.'
    }
  },
  variants = {
    {
      arguments = { 'vertex', 'fragment' },
      returns = { '...blobs' }
    },
    {
      arguments = { 'compute' },
      returns = { '...blobs' }
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
