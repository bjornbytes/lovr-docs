return {
  tag = 'pass-misc',
  summary = 'Get the debug label of the Pass.',
  description = [[
    Returns the debug label of the Pass, which will show up when the Pass is printed and in some
    graphics debugging tools.  This is set when the Pass is created, and can't be changed
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
    'lovr.graphics.newPass',
    'Texture:getLabel',
    'Shader:getLabel'
  }
}
