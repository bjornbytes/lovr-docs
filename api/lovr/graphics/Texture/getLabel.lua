return {
  summary = 'Get the debug label of the Texture.',
  description = [[
    Returns the debug label of the Texture, which will show up when the Texture is printed and in
    some graphics debugging tools.  This is set when the Texture is created, and can't be changed
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
    'lovr.graphics.newTexture',
    'Shader:getLabel',
    'Pass:getLabel'
  }
}
