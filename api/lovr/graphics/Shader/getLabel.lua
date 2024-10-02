return {
  summary = 'Get the debug label of the Shader.',
  description = [[
    Returns the debug label of the Shader, which will show up when the Shader is printed and in some
    graphics debugging tools.  This is set when the Shader is created, and can't be changed
    afterwards.
  ]],
  arguments = {},
  returns = {
    label = {
      type = 'string',
      description = 'The label, or nil if none was set.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'label' }
    }
  },
  related = {
    'lovr.graphics.newShader',
    'Texture:getLabel',
    'Pass:getLabel'
  }
}
