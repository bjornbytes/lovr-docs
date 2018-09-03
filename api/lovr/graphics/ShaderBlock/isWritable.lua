return {
  summary = 'Check if Shaders can write to the ShaderBlock.',
  description = [[
    Returns whether or not compute shaders can write to the ShaderBlock data.  This is set when the
    block is created using `lovr.graphics.newShaderBlock`.
  ]],
  arguments = {},
  returns = {
    {
      name = 'writable',
      type = 'boolean',
      description = 'Whether or not the block is writable by Shaders.'
    }
  },
  related = {
    'lovr.graphics.newShaderBlock'
  }
}
